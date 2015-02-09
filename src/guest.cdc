
new object $guest: $user;

var $channel_ui active_channels = #[];
var $channel_ui channel_dict = #[];
var $command_aliases command_aliases = [];
var $command_cache modules = [];
var $described prose = [];
var $has_commands local = \
  #[["@request", [["@request", "*", "@request <any>", 'request_cmd, #[[1, ['any, []]]]]]]];
var $has_name name = ['prop, "Generic Guest Object", "Generic Guest Object"];
var $located location = $body_cave;
var $located obvious = 1;
var $location contents = [];
var $mail_list last_letter = 0;
var $mail_list letters = #[];
var $mail_list letters_index = #[];
var $mail_list mail = [];
var $mail_list notify = [$guest];
var $mail_list readers = 1;
var $mail_list senders = 1;
var $mail_ui current = #[['location, 0], ['list, $guest]];
var $mail_ui subscribed = #[[$guest, [791485891, 0]]];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core, 'general_cache];
var $root inited = 1;
var $root managed = [$guest];
var $root manager = $guest;
var $root quota = 75000;
var $root settings = #[["home", $body_cave]];
var $thing gender = $gender_neuter;
var $user connected_at = 0;
var $user connections = [];
var $user formatter = $plain_format;
var $user last_command_at = 0;
var $user modes = #[];
var $user parsers = [$command_parser];
var $user password = "*";
var $user task_connections = #[];

root method .init_guest() {
    .set_title(0, 0, "a guest");
};

protected method .login_notify(): forked  {
    arg connection, last;
    var msg;
    
    (| pass(connection, last) |);
    .tell(["**", "** Welcome to " + ($motd.server_name()), "**"]);
    if ((msg = $motd.welcome_notes()))
        .tell((msg.prefix("** ")) + ["**"]);
    .tell(["** If you are new to ColdCore, you may want to enter the Introductory", "** Tutorial by typing:", "**", "**     @tutorial", "**"]);
    msg = ((("GUEST: " + (.name())) + " [") + (connection.address())) + "] ";
    $channel_ui._broadcast('Admin, msg + (.user_info("email")));
};

protected method .logout() {
    arg connection;
    
    (| pass(connection) |);
    (> .destroy() <);
};

public method .request_cmd() {
    arg @args;
    var msg, ans, utypes, line, mail;
    
    (> .perms(caller(), 'command) <);
    
    // hardcoded questions for now--should eventually drop this in a
    // configurable 'schema' dict somewhere --Brandon
    .tell(["", "*" * (.linelen())]);
    .tell([">> This is the new-user request system.  You will be asked a few questions", ">> at this time.  Please answer to the best of your ability."]);
    .tell(["*" * (.linelen()), ""]);
    msg = [("Email:".pad(22)) + (.user_info("email"))];
    line = "Read Tutorial:".pad(22);
    ans = (> .prompt(">> Have you read the Introductory Tutorial? [no] ") <);
    if ((!ans) || ((ans.is_boolean()) < 1)) {
        line += "no";
        .tell(["", ">> We suggest you take some time afterwards and enter the Introductory", ">> Tutorial.  To do so, just type: @tutorial", ""]);
    } else {
        .tell("");
        line += "yes";
    }
    msg += [line];
    line = "Heard about us from: ".pad(22);
    ans = "";
    while (ans == "") {
        ans = (> .prompt((">> Where did you hear about " + ($motd.server_name())) + "? ") <);
        ans = strsed(ans, "^ +", "");
    }
    msg += (line + ans).wrap_lines(.linelen(), " " * 22);
    .tell("");
    line = "Interest is with: ".pad(22);
    ans = "";
    while (ans == "") {
        ans = (> .prompt(">> What is your reason for requesting a user? ") <);
        ans = strsed(ans, "^ +", "");
    }
    msg += (line + ans).wrap_lines(.linelen(), " " * 22);
    line = "User type: ".pad(22);
    ans = "";
    .tell("");
    utypes = ["User", "Builder", "Programmer"];
    while (!(ans in utypes)) {
        ans = (> .prompt(([">> Available user types:"] + (utypes.prefix(">>    "))) + [">> Which of the above user types are you most interested in:"]) <);
        ans = ans.strip();
    }
    msg += [line + ans];
    .tell("");
    if (ans == "Programmer") {
        ans = (> .prompt([">> By asking for Programmer permissions, do you agree never to exploit", ">> any problem or security hole which may be found by your or yourself,", ">> and to reveal any problems to the appropriate administration as soon", ">> as possible? [yes] "]) <);
        line = "Will not exploit:".pad(22);
        if ((ans.is_boolean()) != 0)
            msg += [line + "yes"];
        else
            msg += [line + "no"];
    }
    mail = $mail_message.new_mail();
    mail.set_subject("New User Request for: " + (.name()));
    mail.set_text(msg);
    catch any
        mail.send($mail_admin);
    with
        return (traceback()[1])[2];
    return ["New User Request Sent as:"] + msg;
};

protected method .title_cmd() {
    arg cmdstr, com, str;
    
    (> .perms(caller(), 'command) <);
    .tell("Guests are not allowed to change their titles.");
};


