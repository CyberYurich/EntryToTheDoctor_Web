$(document).ready(function () {
    $('#date').datetimepicker({
        language: 'ru',
        pickTime: false,
        format: "YYYY-MM-DD",
        daysOfWeekDisabled: [0],
        useCurrent: false
    });
});
