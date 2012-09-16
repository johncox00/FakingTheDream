/// <reference path="jquery-ui-1.8.11.js" />
/// <reference path="jquery-1.5.1-vsdoc.js" />


function createRequest(songId) {
    $.ajax({
        url: "Home/CreateRequest",
        data: { "SongId": songId, "Requestor_Name":"Anonymous" },
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
            $("#current_song").html(song);
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
                var resting = '<p>We\'re taking 5.</p>';
                $("#current_song").html(resting);
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
            alert(foo + '\n' + result + '\n' + goo);
        }
    });
}