/**
 * Created by Administrator on 2015.12.3.
 */
$(function () {
    var ue = UE.getEditor('editor');
    $("#tags").keyup(function () {

        finished($("#tags").val())
    });
});
var request = null;
function finished(txt) {
    $("#tag-suggestions").html('');
    if (request) {
        request.abort();
    }
    if ($.trim(txt).length > 0) {
        var ids = [];
        $('input[myname=tag]').each(function (i, v) {
            ids.push($(v).val());
        });
        request = $.ajax({
            type: "POST",
            url: "/index.php/Home/Ask/tagsuggestion",
            data: {filter: txt, ids: ids.toString()},
            dataType: "html",
            success: function (result) {
                var domelement = $(result);

                $("#tag-suggestions").html(domelement);
            }
        });
    }
}

var tag_count = 0;
function selecttag(id, name) {
    if (tag_count > 4) {
        alert('最多添加5个tag');
        return;
    }
    var tag = '<span id="' + id + '" class="post-tag rendered-element">'
        + name + '<span class="delete-tag" onclick="deletetag(' + id + ')" title="remove this tag"></span></span>';
    $(".tag-editor").children().first().append(tag);
    tag_count++;
    var hiddentag = '<input type="hidden" myname="tag" name="tag[' + id + ']" value="' + id + '">';
    $("#post-form").append(hiddentag);
    $("#tag-suggestions").html('');

    $("#tags").val('');

}

function deletetag(id) {
    $('#' + id).remove();
    tag_count--;
    $('input[name="tag[' + id + ']"]').remove();
}

function ask() {
    var title = $.trim($('#title').val());
    if (title.length < 5) {
        alert('问题标题至少5个字!');
        return;
    }
    if (title.length > 40) {
        alert('问题标题最多不超过40个字!');
        return;
    }
    var content = UE.getEditor('editor').getContentTxt();
    content = $.trim(content);
    if (content.length < 1) {
        alert("请输入问题详情");
        return;
    }
    if (tag_count < 1) {
        alert('至少一个tag！');
        return;
    }
    if (tag_count > 5) {
        alert('最多5个tag！');
        return;
    }
    content = UE.getEditor('editor').getContent();
    content = encodeURI(content);
    $("#post-text").val(content);
    $("#post-form").submit();
}