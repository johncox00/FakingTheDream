function addNewArtist() {
    $("#ArtistSelect").hide();
    $("#NewArtistInput").show();
    $("#CreateNewArtist").val("true");
    addNewAlbum();
}

function cancelNewArtist() {
    $("#ArtistSelect").show();
    $("#NewArtistInput").hide();
    $("#CreateNewArtist").val("false");
    cancelNewAlbum();
}

function addNewAlbum() {
    $("#AlbumSelect").hide();
    $("#NewAlbumInput").show();
    $("#CreateNewAlbum").val("true");
}

function cancelNewAlbum() {
    $("#AlbumSelect").show();
    $("#NewAlbumInput").hide();
    $("#CreateNewAlbum").val("false");
}

function addNewGenre() {
    var ng = $("#NewGenre").val();
    if (ng != "") {
        $.ajax({
            url: "/songs/add_genre",
            data: { newGenre: ng },
            type: 'POST',
            dataType: 'json',
            success: function (result) {
                
                //Get which genres were previously selected.
                var selectedIds = new Array();
                $('#Genre option:selected').each(function () {
                    selectedIds.push(this.value);
                });
                
                //Re-populate the select list.
                var options = "";
                for (var i = 0; i < result.length; i++) {
                    options += '<option value="' + result[i].Id + '">' + result[i].Name + '</option>';
                }
                $("#Genre").html(options);

                //Select all of the previously-selected items.
                for (var i = 0; i < selectedIds.length; i++) {
                    $('#Genre option[value=' + selectedIds[i] + ']').attr('selected', 'selected');
                }

                //Select the genre we just added.
                $("#Genre option:contains('" + ng + "')").attr('selected', 'selected');
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert('status:' + XMLHttpRequest.status + ', status text: ' + XMLHttpRequest.statusText);
            }
        });

        //Select the genre we just added.
        $("#Genre option:contains('" + ng + "')").attr('selected', 'selected');
    }
}

$(document).ready(function () {

    $.ajaxSetup({
        // Disable caching of AJAX responses
        cache: false
    });

    //Clear out the tags textbox.
    $("#Tags").val("");

    // // SONG CREATE/EDIT: 
    // // Load up the artist dropdown. //
    // if ($('#Artist').length > 0) {
    //     $.ajax({
    //         url: "GetArtistList",
    //         data: {},
    //         dataType: 'json',
    //         type: "GET",
    //         cache: false,
    //         success: function (result) {
    //             //alert("I got the artists!");
    //             var options = "";
    //             for (var i = 0; i < result.length; i++) {
    //                 options += '<option value="' + result[i].Id + '">' + result[i].Name + '</option>';
    //             }
    //             $("#Artist").html(options);
    //             var artistId = $("#Artist").val();
    //             $.ajax({
    //                 url: "GetArtistAlbums",
    //                 data: { "artistId": artistId },
    //                 dataType: 'json',
    //                 type: "GET",
    //                 cache: false,
    //                 success: function (result) {
    //                     //alert("I got the artist's albums!");
    //                     var options = "";
    //                     for (var i = 0; i < result.length; i++) {
    //                         options += '<option value="' + result[i].Id + '">' + result[i].Title + '</option>';
    //                     }
    //                     $("#Album").html(options);
    //                 },
    //                 error: function (XMLHttpRequest, textStatus, errorThrown) {
    //                     alert('status:' + XMLHttpRequest.status + ', status text: ' + XMLHttpRequest.statusText);
    //                 }
    //             });
    //         },
    //         error: function (XMLHttpRequest, textStatus, errorThrown) {
    //             alert('status:' + XMLHttpRequest.status + ', status text: ' + XMLHttpRequest.statusText);
    //         }
    //     });
    // }
    // // Done loading artist dropdown. //
    // //Load up the genre list.//
    // if (("#Genre").length > 0) {
    //     $.ajax({
    //         url: "GetGenreList",
    //         data: {},
    //         dataType: 'json',
    //         type: "GET",
    //         cache: false,
    //         success: function (result) {
    //             var options = "";
    //             for (var i = 0; i < result.length; i++) {
    //                 options += '<option value="' + result[i].Id + '">' + result[i].Name + '</option>';
    //             }
    //             $("#Genre").html(options);
    //         },
    //         error: function (XMLHttpRequest, textStatus, errorThrown) {
    //             alert('status:' + XMLHttpRequest.status + ', status text: ' + XMLHttpRequest.statusText);
    //         }
    //     });
    // }

    //Done loading the genre list.//

    $("#Artist").change(function () {
        var artistId = $("#Artist option:selected").val();
        $.ajax({
            url: "GetArtistAlbums",
            data: { "artistId": artistId },
            dataType: 'json',
            type: "GET",
            cache: false,
            success: function (result) {
                //alert("I got the artist's albums!");
                var options = "";
                for (var i = 0; i < result.length; i++) {
                    options += '<option value="' + result[i].Id + '">' + result[i].Title + '</option>';
                }
                $("#Album").html(options);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert('status:' + XMLHttpRequest.status + ', status text: ' + XMLHttpRequest.statusText);
            }
        });
    });
});