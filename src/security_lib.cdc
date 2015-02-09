
new object $security_lib: $libraries;

var $dmi_data descriptions = #[];
var $root created_on = 864002483;
var $root credit = ["Brad Roberts <braddr@puremagic.com>", "Bruce Mitchener, Jr. <bruce@puremagic.com>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$security_lib];
var $root manager = $security_lib;

public method .bounce_to_auth() {
    arg interface, destination;
    var user;
    
    if (!(.check_userdb_with_optional(interface)))
        return ['redirect, destination];
    else
        return 0;
};

public method .check_userdb_with_optional() {
    arg interface;
    var user, auth, req;
    
    if (!(| (auth = interface.get_info('browser_auth)) |))
        return 0;
    if (!(| (user = $user_db.search((auth[2])[1])) |))
        return 0;
    if (!(user.check_password((auth[2])[2])))
        return 0;
    interface.set_info('run_as, user);
    return 1;
};

public method .check_userdb_with_password() {
    arg interface;
    var user, auth, req;
    
    if (!(| (auth = interface.get_info('browser_auth)) |))
        return ['basic, (interface.get_info('directory_object)).get_realm()];
    if (!(| (user = $user_db.search((auth[2])[1])) |))
        return [auth[1], (interface.get_info('directory_object)).get_realm()];
    if (!(user.check_password((auth[2])[2])))
        return [auth[1], (interface.get_info('directory_object)).get_realm()];
    interface.set_info('run_as, user);
    return 0;
};


