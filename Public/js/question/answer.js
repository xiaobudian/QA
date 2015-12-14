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

    function qaajax(url, callback) {
        var id = $('.question input[name=_id_]').val();
        $.ajax({
                url: '/index.php/Home/Question/' + url,
                data: {id: id},
                type: 'post',
                dataType: 'json',
                success: callback,
            }
        );
    }

    function updatevotes(data, c1, c2, inc) {
        //data = $.parseJSON(data);
        if (data.result) {
            $('.question .vote-up-on').removeClass().addClass('vote-up-off');
            $('.question .vote-down-on').removeClass().addClass('vote-down-off');
            $('.question .' + c1).removeClass().addClass(c2);

            $('.question .vote-count-post').html(data.votes);
        }
    }

    $('.question .vote a').click(function () {
        var c = $(this).attr('class');
        var url, c2, inc;
        switch (c) {
            case 'vote-up-on':
                url = "voteupoff";
                c2 = 'vote-up-off';
                inc = -1;
                break;
            case 'vote-up-off':
                url = "voteupon";
                c2 = 'vote-up-on';
                inc = 1;
                break;
            case 'vote-down-on':
                url = "votedownoff";
                c2 = 'vote-down-off';
                inc = 1;
                break;
            case 'vote-down-off':
                url = "votedownon";
                c2 = 'vote-down-on';
                inc = -1;
                break;
        }
        qaajax(url, function (data) {
            updatevotes(data, c, c2, inc);
        });
    });

});