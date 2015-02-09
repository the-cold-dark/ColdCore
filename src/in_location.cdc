
new object $in_location: $located_location;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = [];
var $foundation defined_msgs = #[["open", #[['branches, ["general", "actor", "inside"]]]], ["close", #[['branches, ["general", "actor", "inside"]]]]];
var $foundation msgs = #[["open", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " opens ", <$generator, ["this", [], [], 'gen_this]>, "."], #[]]>], ["inside", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " opens ", <$generator, ["this", [], [], 'gen_this]>, "."], #[]]>], ["actor", <$ctext_frob, [["You open ", <$generator, ["this", [], [], 'gen_this]>, "."], #[]]>]]], ["close", #[["inside", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " closes ", <$generator, ["this", [], [], 'gen_this]>, "."], #[]]>], ["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " closes ", <$generator, ["this", [], [], 'gen_this]>, "."], #[]]>], ["actor", <$ctext_frob, [["You close ", <$generator, ["this", [], [], 'gen_this]>, "."], #[]]>]]]];
var $has_commands local = #[];
var $has_commands remote = #[["open", [["open", "*", "open <this>", 'open_cmd, #[[1, ['this, []]]]]]], ["close", [["close", "*", "close <this>", 'close_cmd, #[[1, ['this, []]]]]]]];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "in_location", "in_location"];
var $located location = $nowhere;
var $located obvious = 1;
var $location contents = [];
var $root created_on = 809991552;
var $root defined_settings = #[["locked", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]], ["lockable", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]], ["closable", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]], ["closed", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]]];
var $root flags = ['methods, 'code, 'variables, 'core, 'fertile];
var $root inited = 1;
var $root managed = [$in_location];
var $root manager = $in_location;
var $root settings = #[["locked", 0], ["lockable", 0], ["closable", 0], ["closed", 0]];
var $thing gender = $gender_neuter;

public method .close_cmd() {
    arg cmdstr, cmd, this;
    var vars, m;
    
    if (.get_setting("closable", $in_location)) {
        if (.get_setting("closed", $in_location)) {
            return ((.name()).capitalize()) + " is already closed.";
        } else {
            .set_setting("closed", $in_location, "yes");
            vars = #[["$actor", sender()], ["actor", sender().name()], ["$this", this()], ["this", .name()], ["$inside", this()]];
            m = .eval_message("close", $in_location, vars);
            (.location()).announce(m, sender());
            .announce(m, sender());
            return m;
        }
    } else {
        return ((.name()).capitalize()) + " cannot be closed.";
    }
};

public method .description() {
    arg flags;
    var line;
    
    if ((sender().location()) == this()) {
        return (> .inside_description(flags) <);
    } else {
        if (.get_setting("closed", $in_location))
            line = (((.gender()).pronoun('ps)).capitalize()) + " is closed.";
        else
            line = (("Inside " + (.name())) + " you see: ") + ((.contents()).map_to_english('name));
        return (> pass(flags) <) + [line];
    }
};

public method .open_cmd() {
    arg cmdstr, cmd, this;
    var vars, m;
    
    if (.get_setting("closable", $in_location)) {
        if (.get_setting("closed", $in_location)) {
            .set_setting("closed", $in_location, "no");
            vars = #[["$actor", sender()], ["actor", sender().name()], ["$this", this()], ["this", .name()], ["$inside", this()]];
            m = .eval_message("open", $in_location, vars);
            (.location()).announce(m, sender());
            .announce(m, sender());
            return m;
        } else {
            return ((.name()).capitalize()) + " is already opened.";
        }
    } else {
        return ((.name()).capitalize()) + " cannot be opened.";
    }
};


