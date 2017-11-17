function setCookie(name, value) {
    var cookie_date = new Date ( );  // Текущая дата и время
    cookie_date.setTime ( cookie_date.getTime() +3600);     //seconds
    document.cookie = name + "=" + value;
    document.cookie="expires= cookie_date.toGMTString()";
    location.reload();
}
function getCookie(name) {
    var matches = document.cookie.match(new RegExp(
        "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
    ));
    return matches ? decodeURIComponent(matches[1]) : undefined;
}
function getFilter() {
    document.getElementsByName("price_down")[0].value = (getCookie("price_down")) ? getCookie("price_down") : "";
    document.getElementsByName("price_up")[0].value = (getCookie("price_up")) ? getCookie("price_up") : "";
    document.getElementsByName("alltypes")[0].checked = (getCookie("alltypes") === true.toString()) ? true : false;
    document.getElementsByName("greentea")[0].checked = (getCookie("greentea") === true.toString()) ? true : false;
    document.getElementsByName("blacktea")[0].checked = (getCookie("blacktea") === true.toString()) ? true : false;

    //document.getElementsByName("two")[0].changed = (getCookie("blacktea") === true.toString()) ? true : false;

}
function  setTextParam(obj) {
    setCookie(obj.name, document.getElementsByName(obj.name)[0].value);
}
function  setCheckParam(obj) {
    setCookie(obj.name, document.getElementsByName(obj.name)[0].checked.toString());
}