/// <reference path="jquery-ui-1.8.11.js" />
/// <reference path="jquery-1.5.1-vsdoc.js" />
$(function() {
    var faye = new Faye.Client('http://rt.fakingthedream.com/faye');
    //Faye.Transport.WebSocket.isUsable = function(_,c) { c(false) };
    faye.disable('websocket');
    Faye.Transport.WebSocket.isUsable = function($, _, c) { c(false) };
    faye.setHeader('Access-Control-Allow-Origin', '*');
    faye.connect();


    faye.subscribe('/songs/current', function (result) {
      //$("#chat").append("<li>" + data.body + "</li>");
      if (result.title == "lightshow"){
        process_lightshow(result.details);
      } else {
        clear_light_show("#current_song");
        var song = '<h2>' + result.title + '</h2>';
        song += '<div class="lyric">' + result.lyric + '</div>';
        var chart = '<h2>' + result.title + '</h2>';
        chart += '<div class="lyric">' + result.chart + '</div>';
        if (result.chart == null){ 
          chart = song;
        }
        $("#current_song").html(song);
        $("#current_chart").html(chart);
        $("#song_id").val(songId);
      }
      
    });

    
    

});
var timers = new Array();

function random_name(){
    var name = random_color() + Date.now();
    return name;
}

function make_timeout(method, time){
  name = random_name();
  timers[name] = setTimeout(method, time);
}

function make_interval(method, time){
  name = random_name();
  timers[name] = setInterval(method, time);
}

function clear_timers(){
  for (key in timers){
    clearTimeout(key);
    clearInterval(key);
  }
  timers = new Array();
}

//EFFECT_OPTIONS = ["Random Color", "Specific Color", "BW Strobe", "Color Strobe", "Color Stream"]
function process_lightshow(details){
    effect = details.effect
    target_div = "#current_song";
    clear_timers();
    switch(effect){
        case "Random Color":
          color = random_color();
          light_show_change(color, details.text, details.text_color, target_div);
          break;
        case "Specific Color":
          color = '#' + details.hex_color;
          light_show_change(color, details.text, details.text_color, target_div);
          break;
        case "BW Strobe":
          strobe(details.strobe_duration, target_div);
          break;
        case "Color Strobe":
          colorful_strobe(details.strobe_duration, target_div);
          break;
        case "Color Stream":
          colorful_stream(details.strobe_duration, target_div);
          break;
    }
}

function light_show_change(bg_color, text, text_color, target_div) {
    // .css("color", "#CDCDCD");
    $('body').css('background-color',bg_color);
    $(target_div).css('color', text_color);
    //$(target_div).css('width', '100%');
    //$(target_div).css('min-height', '570px');
    $(target_div).css('text-align', 'center');

    //$(target_div).css('color:' + text_color + ';width:100%;min-height:100%;text-align:center;');
    $(target_div).html('<h1>' + text + '</h1>');
}

function clear_light_show(target_div){
  $('body').css('background-color',"#555");
  $(target_div).css('text-align', 'left');
}

function random_color(){
    digits = ['0','1','2','3','4','5','6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'];
    red = digits[Math.floor(Math.random() * 16)] + digits[Math.floor(Math.random() * 16)];
    green = digits[Math.floor(Math.random() * 16)] + digits[Math.floor(Math.random() * 16)];
    blue = digits[Math.floor(Math.random() * 16)] + digits[Math.floor(Math.random() * 16)];
    return '#' + red + blue + green;
}

function strobe(frequency, target_div){
    fd2 = frequency/2.0;
    call = 'light_show_change("#000000","","#000000","' + target_div + '")';
    make_interval(call, frequency);
    call2 = 'light_show_change("#ffffff","","#ffffff","' + target_div + '")';
    timeout_call = 'make_interval(call2, ' + frequency + ')';
    make_timeout(timeout_call, fd2);
}

function colorful_stream(frequency, target_div){
    color = random_color();
    light_show_change(color,"","#000000",target_div);
    interval_call = 'light_show_change(random_color(),"","#000000","' + target_div + '")';
    make_interval(interval_call, frequency);
    //timeout_call = 'colorful_stream(' + frequency + ', "' + target_div + '")';
    //make_timeout(timeout_call, frequency);
}

function colorful_strobe(frequency, target_div){
    fd2 = frequency/2.0;
    color = random_color();
    light_show_change(color,"","#000000",target_div);
    interval_call = 'light_show_change(random_color(),"","#000000","' + target_div + '")';
    make_interval(interval_call, frequency);
    // timeout_call = 'colorful_strobe(' + frequency + ', "' + target_div + '")';
    // make_timeout(timeout_call, frequency);
    call2 = 'light_show_change("#000000","","#000000","' + target_div + '")';
    interval2 = 'make_interval(' + call2 + ',' + frequency + ')';
    make_timeout(interval2, fd2);
}


function createRequest(songId) {
    $.ajax({
        url: "create_request",
        data: { "song_id": songId, "requestor":"Anonymous" },
        dataType: 'json',
        type: "POST",
        cache: false,
        success: function (result) {
            $("#request-" + songId).html("Requested");
            $("#request-" + songId).css("disabled", "disabled");
        },
        error: function (foo, result, goo) {
            alert(foo + '\n' + result + '\n' + goo);
        }
    });
}



function updateSong(songId) {
    $.ajax({
        url: "current",
        data: { "id": songId },
        dataType: 'json',
        type: "GET",
        cache: false,
        success: function (result) {
            var song = '<h2>' + result.title + '</h2>';
            song += '<div class="lyric">' + result.lyric + '</div>';
            var chart = '<h2>' + result.title + '</h2>';
            chart += '<div class="lyric">' + result.chart + '</div>';
            if (result.chart == null){ 
                chart = song;
            }
            $("#current_song").html(song);
            $("#current_chart").html(chart);
            $("#song_id").val(songId);
        },
        error: function (foo, result, goo) {
           // alert(foo + '\n' + result + '\n' + goo);
        }
    });
}

function CheckCurrentSong () {
    $.ajax({
        url: "get_current_song_id",
        data: {},
        dataType: 'json',
        type: "GET",
        cache: false,
        success: function (result) {
            //alert('ID = ' + result.Id);
            if (result.id < 0) {
                var resting = '<p>We\'re taking 5.</p><p>Stay tuned. When we start again this page will refresh on its own to show you the words.</p>';
                $("#current_song").html(resting);
                $("#current_chart").html(resting);
                $("#song_id").val("-1");
            } else {
                var displayedSong = $("#song_id").val();
                var currentSong = result.id;
                if (displayedSong != currentSong) {
                    updateSong(result.id);
                }
            }
        },
        error: function (foo, result, goo) {
            //alert(foo + '\n' + result + '\n' + goo);
        }
    });
}