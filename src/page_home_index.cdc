
new object $page_home_index: $page;

var $dmi_data descriptions = #[];
var $root created_on = 863765377;
var $root credit = ["Brad Roberts <braddr@puremagic.com>", "Bruce Mitchener, Jr. <bruce@puremagic.com>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$page_home_index];
var $root manager = $page_home_index;

public method .generate() {
    arg header, info, args;
    var user, page;
    
    user = (| $user_db.search(substr(info['path_info], 2)) |);
    if (user) {
        catch ~private {
            page = user.get_setting("rl-home-page", $user_info);
            if ((page[1]) && (page[2])) {
                if (substr(page[2], 1, 7) != "http://")
                    page = page.replace(2, "http://" + (page[2]));
                return ['redirect, page[2]];
            }
        } with {
            return [(header['interface]).response(404, "User's homepage is private")];
        }
    } else {
        return [(header['interface]).response(404, "User not found")];
    }
};


