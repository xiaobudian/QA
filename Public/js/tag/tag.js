/**
 * Created by Administrator on 2015.12.4.
 */
$(function () {

    $("#tagfilter").keyup(function () {
        finished($('#tagfilter').val());
    })
});
var request = null;
function finished(txt) {
    $("#tags_list").html('');
    if (request) {
        request.abort();
    }
    request = $.ajax({
        type: "POST",
        url: "/index.php/Home/Tag/filter",
        data: {filter: txt},
        dataType: "html",
        success: function (result) {
            var domelement = $(result);
            $("#tags_list").html(domelement);
            if (txt == "") {
                $(".pager").show();
            } else {
                $(".pager").hide();
            }

        }
    });
}