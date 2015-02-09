
new object $no_one: $user;

var $channel_ui active_channels = #[];
var $channel_ui channel_dict = #[];
var $command_aliases command_aliases = [];
var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = [];
var $has_name name = ['prop, "No One", "No One"];
var $located location = $body_cave;
var $located obvious = 1;
var $location contents = [];
var $mail_list last_letter = 0;
var $mail_list letters = #[];
var $mail_list letters_index = #[];
var $mail_list mail = [];
var $mail_list notify = [$no_one];
var $mail_list readers = [$no_one];
var $mail_list senders = 1;
var $mail_ui current = #[['location, 0], ['list, $no_one]];
var $mail_ui subscribed = #[[$no_one, [791485891, 0]]];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$no_one];
var $root manager = $no_one;
var $root quota = 75000;
var $root quota_exempt = 1;
var $root settings = #[["home", $body_cave], ["exit-style", 'brief]];
var $root trusted = [$smtp_interface];
var $thing gender = $gender_neuter;
var $user action = "";
var $user connected_at = 0;
var $user connections = [];
var $user creation_time = 759878010;
var $user formatter = $plain_format;
var $user last_command_at = 0;
var $user modes = #[];
var $user parsers = [$command_parser];
var $user password = "*";
var $user task_connections = #[];

public method .mail_as() {
    arg from, meta, subj, body, @recips;
    var mail, l;
    
    if (!(.trusts(caller())))
        (> .perms(sender()) <);
    mail = $mail_message.new_mail();
    mail.set_subject(subj);
    mail.set_text(body);
    if (from)
        mail.set_from((<this(), [from]>));
    if (meta)
        mail.set_meta(meta);
    if (caller() == $smtp_interface)
        mail.is_frominet();
    catch any {
        mail.send(@recips);
    } with {
        // dont call .log_traceback because it calls this, recursion bad
        $sys.log((this() + " traceback: ") + ((traceback()[1])[2]));
        $sys.log((this() + " traceback: ") + traceback());
    }
};

frob method .mail_name() {
    arg frob;
    
    if (valid(frob[1]))
        return (frob[1]).mail_name();
    return frob[1];
};

frob method .name() {
    arg frob, @args;
    
    if (valid(frob[1]))
        return (frob[1]).name();
    return frob[1];
};

frob method .namef() {
    arg frob, @args;
    
    if (valid(frob[1]))
        return (frob[1]).namef(@args);
    return frob[1];
};


