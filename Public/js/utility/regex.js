/**
 * Created by Administrator on 2015.12.2.
 */
function Regex() {
    this.checkemail = function (str) {
        var pattern = new RegExp("^[0-9a-z][_.0-9a-z-]{0,31}@([0-9a-z][0-9a-z-]{0,30}[0-9a-z]\.){1,4}[a-z]{2,4}$");
        if (pattern.test(str))
            return true;
        else
            return false;
    }
}