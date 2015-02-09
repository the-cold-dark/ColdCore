
new object $mail_admin: $mail_list;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "admin", "admin"];
var $mail_list last_received_on = 0;
var $mail_list mail = [];
var $mail_list notify = [];
var $mail_list readers = 0;
var $mail_list senders = 1;
var $root created_on = 869072525;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$mail_admin];
var $root manager = $mail_admin;

public method .list_is_readable_by() {
    arg who;
    
    return (> pass(who) <) || ($sys.is_admin(who));
};


