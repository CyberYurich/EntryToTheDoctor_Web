$(document).ready(function () {
    $("#date").change(function () {
        $("#date").keyup();
        var date = $("#date").val();
        $("#time").empty();
        $.get('ShowValidTimes', {date: date}, function (responseJson) {
            $.each(responseJson, function (key, value) {
                $("#time").append($('<option></option>').attr("value", key).text(value));
            });
            $("#time").keyup();
        });
    });
});



