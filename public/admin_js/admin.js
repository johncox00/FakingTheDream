/// <reference path="jquery-ui-1.8.11.js" />

function setCurrentSong(songId) {
    $.ajax({
        url: "/admin/dashboard/set_current_song",
        data: { "id": songId },
        dataType: 'json',
        type: "POST",
        cache: false,
        success: function (result) {
            //alert("Current song set to '" + result.title + "'.");
            html = "<h2>" + result.title + "</h2><div class='lyric'>" + result.lyric + "</div>";
            $("#current_song").html(html);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert('status:' + XMLHttpRequest.status + ', status text: ' + XMLHttpRequest.statusText);
        }
    });
    return false;
}

function ingnoreRequest(requestId) {
    $.ajax({
        url: "IgnoreRequest",
        data: { "requestId": requestId },
        dataType: 'json',
        type: "POST",
        cache: false,
        success: function (result) {
            $(".Request-" + requestId).slideUp('slow', function () {
                $(".Request-" + requestId).remove();
            });
            $("#most_popular_requests").load('GetRequestsGroupedBySong');
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert('status:' + XMLHttpRequest.status + ', status text: ' + XMLHttpRequest.statusText);
        }
    });
    return false;
}

function setRequestToCurrentSong(songId) {
    $.ajax({
        url: "DeleteRequestsBySong",
        data: { "songId": songId },
        dataType: 'json',
        type: "POST",
        cache: false,
        success: function (result) {
            if (result.Id > 0) {
                setCurrentSong(songId);
                $(".Song-" + songId).slideUp('slow', function () {
                    $(".Song-" + songId).remove();
                });
            } else {
                alert("There was an error!");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert('status:' + XMLHttpRequest.status + ', status text: ' + XMLHttpRequest.statusText);
        }
    });
    return false;
}

function ignoreRequestBySong(songId) {
    $.ajax({
        url: "DeleteRequestsBySong",
        data: { "songId": songId },
        dataType: 'json',
        type: "POST",
        cache: false,
        success: function (result) {
            if (result.Id > 0) {
                $(".Song-" + songId).slideUp('slow', function () {
                    $(".Song-" + songId).remove();
                });
            } else {
                alert("There was an error!");
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert('status:' + XMLHttpRequest.status + ', status text: ' + XMLHttpRequest.statusText);
        }
    });
    return false;
}



$(document).ready(function () {

    $.ajaxSetup({
        // Disable caching of AJAX responses
        cache: false
    });

    

});