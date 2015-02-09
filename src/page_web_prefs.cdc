
new object $page_web_prefs: $page;

var $dmi_data descriptions = #[['submit_new, #[['args, #[["www-show-descriptions", [[], []]], ["www-show-line-num", [[], []]], ["www-show-methods", [[], []]], ["www-show-variables", [[], []]]]]]]];
var $page_web_prefs prefs = [["Show line numbers in methods", "www-show-line-num"], ["Show methods on object displays", "www-show-methods"], ["Show variables on object displays", "www-show-variables"], ["Show descriptions on object displays", "www-show-descriptions"]];
var $root created_on = 868020037;
var $root credit = ["Brad Roberts <braddr@puremagic.com>", "Bruce Mitchener, Jr. <bruce@puremagic.com>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$page_web_prefs];
var $root manager = $page_web_prefs;

public method .config() {
    arg header, info, args;
    var text, user, value, boolean, pref;
    
    user = info['run_as];
    text = [@.build_header(header, info, args, "Configure Web Preferences")];
    text += ["<form action=\"/desktop/web_prefs/submit_new\" method=\"post\">"];
    text += ["<table><tr><th>Preference</th><th>Yes</th><th>No</th></tr>"];
    for pref in (prefs) {
        value = user.get_setting(pref[2], $www_preferences);
        text += [((("<tr><td>" + (pref[1])) + "</td>") + (map boolean in ([1, 0]) to (((((("<td><input type=\"radio\" name=\"" + (pref[2])) + "\" value=\"") + (boolean ? "1" : "0")) + "\" ") + ((value == boolean) ? "checked" : "")) + "></td>").join(""))) + "</tr>"];
    }
    text += ["</table>"];
    text += ["<input type=submit name=\"Submit new preferences\"><input type=reset>"];
    text += ["</form>", @.build_footer(header, info, args)];
    return [text];
};

public method .submit_new() {
    arg header, info, args;
    var pref, user;
    
    user = info['run_as];
    for pref in (prefs.slice(2))
        user.set_www_preferences(pref, args[pref]);
    return ['redirect, @header["Referer"]];
};


