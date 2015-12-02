/**
 * Created by Administrator on 2015.12.2.
 */
$(function () {

    $("#submit-button").click(function () {
        var regex = new Regex();
        var emial = $("#email").val();
        if (!regex.checkemail(emial)) {
            alert('invalid email.')
            return;
        }
        $("#login-form").submit();
    });
});