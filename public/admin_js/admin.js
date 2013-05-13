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

function startLightShow(songId) {
    $.ajax({
        url: "/admin/dashboard/start_light_show",
        data: { "id": songId },
        dataType: 'json',
        type: "POST",
        cache: false,
        success: function (result) {
            alert("Light show started!")
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert('status:' + XMLHttpRequest.status + ', status text: ' + XMLHttpRequest.statusText);
        }
    });
    return false;
}

function ingnoreRequest(requestId) {
    $.ajax({
        url: "/admin/dashboard/ignore_request",
        data: { "request_id": requestId },
        dataType: 'json',
        type: "POST",
        cache: false,
        success: function (result) {
            $(".request-" + requestId).slideUp('slow', function () {
                $(".request-" + requestId).remove();
            });
            $("#most_popular_requests").load('/admin/dashboard/get_requests_grouped_by_song');
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert('status:' + XMLHttpRequest.status + ', status text: ' + XMLHttpRequest.statusText);
        }
    });
    return false;
}

function setRequestToCurrentSong(songId) {
    $.ajax({
        url: "/admin/dashboard/delete_requests_by_song",
        data: { "song_id": songId },
        dataType: 'json',
        type: "POST",
        cache: false,
        success: function (result) {
            setCurrentSong(songId);
            $(".song-" + songId).slideUp('slow', function () {
                $(".song-" + songId).remove();
            });
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert('status:' + XMLHttpRequest.status + ', status text: ' + XMLHttpRequest.statusText);
        }
    });
    return false;
}

function ignoreRequestBySong(songId) {
    $.ajax({
        url: "/admin/dashboard/delete_requests_by_song",
        data: { "songId": songId },
        dataType: 'json',
        type: "POST",
        cache: false,
        success: function (result) {
            $(".song-" + songId).slideUp('slow', function () {
                $(".song-" + songId).remove();
            });
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert('status:' + XMLHttpRequest.status + ', status text: ' + XMLHttpRequest.statusText);
        }
    });
    return false;
}

function getGroupedRequests(){
    $.ajax({
        url: "/admin/dashboard/get_requests_grouped_by_song",
        dataType: 'json',
        type: "GET",
        cache: false,
        success: function (result) {
            $(".song-" + songId).slideUp('slow', function () {
                $(".song-" + songId).remove();
            });
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