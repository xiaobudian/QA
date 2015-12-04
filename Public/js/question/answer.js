/**
 * Created by Administrator on 2015.12.3.
 */
$(function () {
    var ue = UE.getEditor('editor');
    $("#wmd-input").keyup(function () {

        var txt = $("#wmd-input").val();
        if (txt.length > 0) {
            $('#submit-button').removeAttr('disabled');
        } else {
            $('#submit-button').attr('disabled', 'disabled');
        }
    });

    $("#submit-button").click(function () {
        var answer = UE.getEditor('editor').getContentTxt();
        answer = $.trim(answer);
        if (answer.length < 1) {
            alert("请输入答案");
            return;
        }
        answer = UE.getEditor('editor').getContent();
        answer = encodeURI(answer);
        $("#answer").val(answer);
        $("#post-form").submit();
    });
});