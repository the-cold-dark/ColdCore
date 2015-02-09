
new object $player: $user;

var $channel_ui active_channels = #[];
var $channel_ui channel_dict = #[];
var $command_aliases command_aliases = [];
var $command_cache modules = [];
var $described prose = [];
var $has_commands local = \
  #[["@sheet|@score", [["@sheet|@score", "*", "@sheet|@score <any>", 'sheet_cmd, #[[1, ['any, []]]]]]],\
  ["@new-char?acter",\
    [["@new-char?acter", "*", "@new-char?acter <any>", 'new_character_cmd, #[[1, ['any, []]]]]]],\
  ["@char?acters",\
    [["@char?acters", "*", "@char?acters <any>", 'characters_cmd, #[[1, ['any, []]]]]]],\
  ["@del-char?acter",\
    [["@del-char?acter", "*", "@del-char?acter <any>", 'del_character_cmd, #[[1, ['any, []]]]]]]];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['proper, "player", "player"];
var $located location = $body_cave;
var $located obvious = 1;
var $location contents = [];
var $mail_list mail = [];
var $mail_list notify = [$player];
var $mail_list readers = [$player];
var $mail_list senders = 1;
var $mail_ui current = #[['location, 0], ['list, $player]];
var $mail_ui subscribed = #[[$player, [813278562, 0]], [$mail_list_news, [813278562, 0]]];
var $player character = 0;
var $player characters = 0;
var $player chargen_origin = 0;
var $root created_on = 809926794;
var $root flags = ['core, 'methods, 'code, 'variables, 'general_cache];
var $root inited = 1;
var $root managed = [$player];
var $root manager = $player;
var $root quota = 75000;
var $root settings = #[["home", $body_cave]];
var $thing gender = $gender_neuter;
var $user action = "";
var $user connected_at = 0;
var $user connections = [];
var $user formatter = $plain_format;
var $user last_command_at = 0;
var $user parsers = [$command_parser];
var $user password = "*";
var $user task_connections = #[];

public method .abort_charcmd() {
    arg @args;
    
    .tell("** Aborting Character Generation, cleaning up...");
    catch any
        character.destroy();
    with
        .tell(["** Unable to destroy character sheet:", (traceback()[1])[1]]);
    clear_var('character);
    .del_parser($chargen_parser);
    if (chargen_origin)
        .move_to(chargen_origin);
    else
        .move_to($world.starting_place());
    (| clear_var('chargen_origin) |);
};

public method .attribute(): nooverride, synchronized  {
    arg attribute;
    
    if (caller() != definer())
        (> .perms(sender(), $storyteller) <);
    return get_var(attribute);
};

public method .character() {
    return character;
};

public method .characters() {
    return characters;
};

public method .characters_cmd() {
    arg @args;
    var out, c, x, line;
    
    (> .perms(caller(), 'command) <);
    out = [];
    for x in [1 .. listlen(characters || [])] {
        c = characters[x];
        line = (c == character) ? "*" : " ";
        out += [strfmt("%2r: %s ", x, line) + (c.namef('ref))];
    }
    if (!out)
        out = ["    <None>"];
    return (["Characters:"] + out) + ["---"];
};

public method .dead() {
    return dead;
};

public method .del_character_cmd() {
    arg cmdstr, cmd, str;
    var delchar, x, yesno, name;
    
    (> .perms(caller(), 'command) <);
    catch any {
        delchar = characters.match_object(str);
    } with {
        if ((x = str.is_numeric()) && (delchar = (| characters[x] |))) {
            // Good
        } else {
            return [("Syntax: " + cmd) + " <character>", ("    OR: " + cmd) + " <character index>"];
        }
    }
    name = delchar.namef('ref);
    yesno = (> (.prompt(("Delete " + name) + "? [no] ")).is_boolean() <);
    if (yesno <= 0)
        return "Ok, Aborting...";
    catch any
        delchar.destroy();
    with
        return [("** Unable to destroy character " + name) + ":", (traceback()[1])[1]];
    characters = setremove(characters, delchar);
    return ((("Deleted " + name) + ", ") + listlen(characters)) + " characters remaining.";
};

public method .done_charcmd() {
    arg @args;
    
    .tell("** Done Generating, cleaning up...");
    characters += [character];
    clear_var('character);
    .del_parser($chargen_parser);
    if (chargen_origin)
        .move_to(chargen_origin);
    else
        .move_to($world.starting_place());
    (| clear_var('chargen_origin) |);
};

public method .format_score() {
    arg base, cur;
    
    return pad((base == cur) ? tostr(base) : ((cur + "/") + base), 8);
};

public method .help_charcmd() {
    arg @args;
    
    .tell("** Special commands: HELP, LOWER, RAISE, SHEET, DONE and ABORT");
    .tell("** As well as +X and -X as shortcuts for raise and lower");
    .tell("** All other normal commands are available");
};

protected method .lower_attribute() {
    arg attribute, difference;
    var new;
    
    new = (get_var(attribute)[1]) - difference;
    set_var(attribute, get_var(attribute).replace(1, new));
};

public method .lower_charcmd() {
    arg @args;
    var attr, amt, syn, msg;
    
    syn = ["Syntax: lower <attribute> <amount>", "    OR: -<amount> <attribute>", "    OR: -<attribute>"];
    if (listlen(args) == 1) {
        if ((args[1]).is_numeric())
            return syn;
        attr = args[1];
        amt = 1;
    } else if (listlen(args) == 2) {
        [attr, amt] = args;
    } else {
        return syn;
    }
    amt = toint(amt);
    attr = (| attr.to_symbol() |);
    if (!(attr in ($character.attributes())))
        return "Invalid Attribute: " + attr;
    if (type((amt = character.ok_to_lower_initial(attr, amt))) == 'string)
        return amt;
    character.set_attribute(attr, amt);
    return (("Set " + uppercase(tostr(attr))) + " to ") + amt;
};

public method .new_character_cmd() {
    arg @args;
    
    (> .perms(caller(), 'command) <);
    if (character)
        return ("You already have a character active (" + character) + ")";
    catch any
        character = $character.new();
    with
        return ["Unable to enter character creation:", (traceback()[1])[2]];
    characters ?= [];
    (.location()).announce((.name()) + " fades away to generate a new character.", this());
    chargen_origin = .location();
    .move_to($nowhere);
    .add_parser($chargen_parser);
    .tell("** Raw character generation subsystem, will get better later");
    .tell("** Based off En Requiem: http://web.roguetrader.com/EnRequiem/");
    .tell("** type 'help' for help");
};

protected method .raise_attribute() {
    arg attribute, difference;
    var new;
    
    new = (get_var(attribute)[1]) + difference;
    if (new > (get_var(attribute)[2]))
        new = get_var(attribute)[2];
    set_var(attribute, get_var(attribute).replace(1, new));
};

public method .raise_charcmd() {
    arg @args;
    var attr, amt, syn, msg;
    
    syn = ["Syntax: raise <attribute> <amount>", "    OR: +<amount> <attribute>", "    OR: +<attribute>"];
    if (listlen(args) == 1) {
        if ((args[1]).is_numeric())
            return syn;
        attr = args[1];
        amt = 1;
    } else if (listlen(args) == 2) {
        [attr, amt] = args;
    } else {
        return syn;
    }
    amt = toint(amt);
    attr = (| attr.to_symbol() |);
    if (!(attr in ($character.attributes())))
        return "Invalid Attribute: " + attr;
    if (type((amt = character.ok_to_raise_initial(attr, amt))) == 'string)
        return amt;
    character.set_attribute(attr, amt);
    return (("Set " + uppercase(tostr(attr))) + " to ") + amt;
};

public method .set_attribute() {
    arg attribute, value;
    
    (> .perms(sender()) <);
    set_var(attribute, [value, value]);
};

public method .sheet_charcmd() {
    arg @args;
    var tot, group, line, x, out;
    
    tot = map x in ($character.attributes()) to ((character.attribute(x))[1]);
    tot = tot.sum();
    out = ["", ((("Attribute Points Remaining: " + (115 - tot)) + " (") + tot) + " of 115)"];
    tot = map x in ($character.physical_attributes()) to ((character.attribute(x))[1]);
    tot = tot.sum();
    out += [((("                  Physical: " + (56 - tot)) + " (") + tot) + ", cap 56)"];
    tot = map x in ($character.mental_attributes()) to ((character.attribute(x))[1]);
    tot = tot.sum();
    out += [((("                    Mental: " + (56 - tot)) + " (") + tot) + ", cap 56)"];
    tot = map x in ($character.meta_attributes()) to ((character.attribute(x))[1]);
    tot = tot.sum();
    out += [((("                 Meta-Phys: " + (30 - tot)) + " (") + tot) + ", cap 30)"];
    return (character.format_sheet()) + out;
};

protected method .sheet_cmd() {
    arg cmdstr, cmd, args;
    var t, out, g;
    
    (> .perms(caller(), 'command) <);
    if (args && (!(.is($storyteller))))
        return "Only storytellers can see other players stats.";
    if (!character)
        return "You do not have a character active.";
    return character.format_sheet();
};


