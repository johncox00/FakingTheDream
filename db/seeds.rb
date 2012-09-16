# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
genres = ['Rock', 'Country', 'Pop', 'Hip Hop', '80s', '90s', '00s', 'Alternative']
genres.each do |value|
	Genre.create(name: value)
end

tags = ['fast', 'slow', 'ridiculous', 'funny']
tags.each do |value|
	Tag.create(value: value)
end

tears_for_fears = Artist.create(name: 'Tears for Fears')
the_clash = Artist.create(name: 'The Clash')
garth_brooks = Artist.create(name: 'Garth Brooks')
kelly_clarkson = Artist.create(name: 'Kelly Clarkson')
journey = Artist.create(name:'Journey')
rem = Artist.create(name: 'REM')
hootie = Artist.create(name:'Hootie and the Blowfish')
bon_jovie = Artist.create(name:'Bon Jovie')
police = Artist.create(name: 'The Police')
bryan_adams = Artist.create(name: 'Bryan Adams')
chumbawumba = Artist.create(name: 'Chumbawumba')
survivor = Artist.create(name: 'Survivor')
beastie_boys = Artist.create(name: 'Beastie Boys')

files = ['everybody_wants_to_rule_the_world.html',
'should_i_stay_or_should_i_go.html',
'since_youve_been_gone.html',
'dont_stop_believing.html',
'end_of_the_world.html',
'friends_in_low_places.html',
'hold_my_hand.html',
'living_on_a_prayer.html',
'roxanne.html',
'summer_of_69.html',
'tubthumping.html',
'eye_of_the_tiger.html',
'sabotage.html']
lyrics = {}
files.each do |file_name|
	file = File.new("./db/lyrics/" + file_name, "r")
	lyric = ""
	while (line = file.gets)
	    lyric += line.strip
	end
	file.close
	lyrics[file_name] = lyric
end
song1 = Song.create(title: 'Everybody Wants to Rule the World', artist: tears_for_fears, lyric: lyrics['everybody_wants_to_rule_the_world.html'])
song1.tags.push(Tag.where(value:'slow'))
song1.genres.push(Genre.where(name:'80s'))
song1.genres.push(Genre.where(name:'Pop'))
song1.save

song2 = Song.create(title: 'Should I Stay or Should I Go', artist: the_clash, lyric: lyrics['should_i_stay_or_should_i_go.html'])
song2.tags.push(Tag.where(value: 'funny'))
song2.genres.push(Genre.where(name:'80s'))
song2.genres.push(Genre.where(name:'Pop'))
song2.save

song3 = Song.create(title: "Since You've Been Gone", artist: kelly_clarkson, lyric: lyrics['since_youve_been_gone.html'])
song3.tags.push(Tag.where(value: 'funny'))
song3.genres.push(Genre.where(name:'Rock'))
song3.genres.push(Genre.where(name:'00s'))
song3.save

song4 = Song.create(title: "Don't Stop Believing", artist: journey, lyric: lyrics['dont_stop_believing.html'])
song4.tags.push(Tag.where(value: 'funny'))
song4.genres.push(Genre.where(name:'Rock'))
song4.genres.push(Genre.where(name:'80s'))
song4.save

song5 = Song.create(title: "It's the End of the World As We Know It", artist: rem, lyric: lyrics['end_of_the_world.html'])
song5.tags.push(Tag.where(value: 'fast'))
song5.tags.push(Tag.where(value: 'ridiculous'))
song5.genres.push(Genre.where(name:'Alternative'))
song5.genres.push(Genre.where(name:'90s'))
song5.save

song6 = Song.create(title: "Friends In Low Places", artist: garth_brooks, lyric: lyrics['friends_in_low_places.html'])
song6.tags.push(Tag.where(value: 'funny'))
song6.genres.push(Genre.where(name:'Country'))
song6.genres.push(Genre.where(name:'90s'))
song6.save

song7 = Song.create(title: "Hold My Hand", artist: hootie, lyric: lyrics['hold_my_hand.html'])
song7.tags.push(Tag.where(value: 'funny'))
song7.genres.push(Genre.where(name:'Rock'))
song7.genres.push(Genre.where(name:'90s'))
song7.save

song8 = Song.create(title: "Living On a Prayer", artist: bon_jovie, lyric: lyrics['living_on_a_prayer.html'])
song8.tags.push(Tag.where(value: 'funny'))
song8.genres.push(Genre.where(name:'Rock'))
song8.genres.push(Genre.where(name:'80s'))
song8.save

song9 = Song.create(title: "Roxanne", artist: police, lyric: lyrics['roxanne.html'])
song9.tags.push(Tag.where(value: 'slow'))
song9.genres.push(Genre.where(name:'Pop'))
song9.genres.push(Genre.where(name:'80s'))
song9.save

song10 = Song.create(title: "Summer of '69", artist: bryan_adams, lyric: lyrics['summer_of_69.html'])
song10.tags.push(Tag.where(value: 'funny'))
song10.genres.push(Genre.where(name:'Rock'))
song10.genres.push(Genre.where(name:'80s'))
song10.save

song11 = Song.create(title: "Tubthumping", artist: chumbawumba, lyric: lyrics['tubthumping.html'])
song11.tags.push(Tag.where(value: 'ridiculous'))
song11.genres.push(Genre.where(name:'Pop'))
song11.genres.push(Genre.where(name:'90s'))
song11.save

song12 = Song.create(title: "Eye of the Tiger", artist: survivor, lyric: lyrics['eye_of_the_tiger.html'])
song12.tags.push(Tag.where(value: 'slow'))
song12.genres.push(Genre.where(name:'Rock'))
song12.genres.push(Genre.where(name:'80s'))
song12.save

song13 = Song.create(title: "Sabotage", artist: beastie_boys, lyric: lyrics['sabotage.html'])
song13.tags.push(Tag.where(value: 'ridiculous'))
song13.genres.push(Genre.where(name:'Rock'))
song13.genres.push(Genre.where(name:'90s'))
song13.save