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
        var password = $('#password').val();
        if (password.length < 6) {
            alert('密码长度不得小于6位！');
            return;
        }
        $('#password').val($.md5($('#password').val()))
        $("#login-form").submit();
    });
});