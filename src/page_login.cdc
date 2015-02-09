
new object $page_login: $page;

var $dmi_data descriptions = #[['generate, #[['args, #[]], ['auth, [$security_lib, 'check_userdb_with_password, []]]]]];
var $root created_on = 867750868;
var $root credit = ["Brad Roberts <braddr@puremagic.com>", "Bruce Mitchener, Jr. <bruce@puremagic.com>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$page_login];
var $root manager = $page_login;

public method .generate() {
    arg header, info, args;
    
    return ['redirect, "/desktop/"];
};


