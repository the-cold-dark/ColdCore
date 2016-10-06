
new object $note: $thing, $has_text;

var $described prose = [];
var $dmi_data descriptions = #[['read, #[['arg_order, ["who", "numbered"]], ['args, #[["who", [[$no_one], []]], ["numbered", [[0], [$converters, 'to_num, []]]]]], ['auth, 'none]]]];
var $foundation edit_types = ["text"];
var $has_commands remote = #[["erase", [["erase", "*", "erase <this>", 'erase_cmd, #[[1, ['this, []]]]], ["erase", "* on|from *", "erase <string> on|from <this>", 'erase_on_cmd, #[[1, ['any, []]], [3, ['this, []]]]]]], ["read|nread", [["read|nread", "*", "read|nread <this>", 'read_cmd, #[[1, ['this, []]]]]]], ["write", [["write", "on *", "write on <this>", 'write_cmd, #[[2, ['this, []]]]], ["write", "at * on *", "write at <string> on <this>", 'write_at_cmd, #[[2, ['any, []]], [4, ['this, []]]]]]], ["copy", [["copy", "from * to *", "copy from <this> to <any>", 'copy_cmd, #[[2, ['this, []]], [4, ['any, []]]]]]]];
var $has_name name = ['uniq, "Generic Note", "the Generic Note"];
var $has_text text = [];
var $located location = $void;
var $located obvious = 1;
var $note separator = 0;
var $root created_on = 796268969;
var $root defined_settings = #[["private", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]]];
var $root flags = ['core, 'fertile, 'code, 'methods, 'variables];
var $root inited = 1;
var $root managed = [$note];
var $root manager = $note;
var $root settings = #[["private", 0]];
var $thing gender = $gender_neuter;

protected method .add_text() {
    arg ntext, who, @args;
    
    // if at they should be an int defining where to insert.
    if (ntext) {
        if (ntext == 'aborted)
            return;
        if (args) {
            if (!(| .ins_lines(ntext, args[1]) |))
                who.tell(("There are not that many lines in " + (.name())) + ".");
        } else {
            .set_text((.get_raw_text()) + ntext);
        }
        who.tell(((("Line" + (((ntext.length()) == 1) ? "" : "s")) + " added to ") + (.name())) + ".");
    } else {
        who.tell("Text not added.");
    }
};

public method .copy_cmd() {
    arg cmdstr, cmd, from, this, prep, dest;
    var obj, what;
    
    // this method is outdated, needs to be rewritten.
    // it probably doesn't even work.
    if (!(.trusts(sender())))
        return sender().tell(("You cannot read the text on " + (.namef('ref))) + ".");
    dest = $parse_lib.ref(dest);
    obj = dest[3];
    if (!(obj.is_writable_by(sender())))
        return .tell(("!  " + (obj.namef('ref))) + " is not writable by you.");
    if ((obj.has_ancestor($note)) && (!(dest[4])))
        obj.add_text(text, sender());
    if ((dest[1]) == 'method) {
        catch any {
            dest = (> tosym(dest[4]) <);
            if (what) {
                obj.(dest)(text, sender());
                sender().tell(((("Text copied to " + obj) + ".") + dest) + "().");
            } else {
                if (!((| tosym(dest) |) in (obj.variables())))
                    return .tell(("!  variable '" + dest) + " not found");
                obj.eval([(dest + " = ") + (.text())]);
            }
        } with {
            sender().tell_error((traceback()[1])[2]);
        }
    }
    sender().tell("Text copied from " + (.name()));
};

public method .description() {
    arg flags;
    
    if (dict_contains(flags, 'nonote))
        return (> pass(flags) <);
    return (> pass(flags) <) + [$ctext_frob.new_with(["You see some writing on the note, and may be able to ", $cml_lib.format_invoke_tag(tostr(this()), "read", "read"), " it..."])];
};

public method .erase_cmd() {
    arg cmdstr, cmd, this;
    var line, nline, len;
    
    (> .perms(sender()) <);
    .del_text();
    
    // if cmd is null, this method was called by an editor originally.
    if (cmd)
        sender().tell(("All text cleared from " + (.name())) + ".");
};

public method .erase_on_cmd() {
    arg cmdstr, cmd, str, prep, this;
    var line, nline, who, len, oldline;
    
    (> .perms(sender()) <);
    who = sender();
    if (!str)
        return who.tell("You must erase either a line, line number, or all");
    catch any {
        if ($string.match_begin("all", str)) {
            .del_text();
    
            // if cmd is null, this method was called by an editor
            if (cmd)
                who.tell(("All text cleared from " + (.name())) + ".");
        } else {
            if (((str.explode()).length()) > 1)
                nline = toint((str.explode())[2]);
            else
                nline = toint(str);
            oldline = (.get_raw_text())[nline];
            .del_nline(nline);
            line = ("Line " + tostr(nline)) + " (\"";
            len = (who.linelen()) - (25 + ((.name()).length()));
            line += $string.chop(oldline, len);
            line = (line + "\") erased from ") + (.name());
            who.tell(line);
        }
    } with {
        switch (error()) {
            case ~range:
                who.tell("There are not that many lines in the text.");
            default:
                who.tell("Oops: " + ((traceback()[1])[2]));
        }
    }
};

root method .init_note() {
    .del_flag('variables);
};

public method .read() {
    arg who, numbered;
    var text, prose, output, br;
    
    output = $ctext_frob.new_with([]);
    br = $cml_lib.format_br_tag();
    if ((.get_setting("private", $note)) && (!(.trusts(who))))
        return [("You cannot read " + (.name())) + "."];
    output = output.append([$cml_lib.format_subj_tag(.name(), 2), br]);
    output = output.append([.prose(), br]);
    output = output.append([.separator()]);
    text = .text();
    if ((!(.get_setting("plaintext", $has_text))) && (type(text) == 'frob)) {
        output = output.append(text.append(br));
    } else {
        if (numbered && text)
            text = $list.numbered_text(text);
        text = text ? text : ["", "(nothing)", ""];
        output = output.append([$cml_lib.format_pre_tag($cml_lib.generate_join_tag(text, br)), br]);
    }
    output = output.append([.separator()]);
    return output;
};

public method .read_cmd() {
    arg cmdstr, cmd, @args;
    var who, numbered;
    
    numbered = (cmd == "nread") ? 1 : 0;
    return (.read(sender(), numbered)).append(["You finish reading " + (.name())]);
};

public method .separator() {
    return $cml_lib.format_sep_tag();
    return (type(separator) == 'string) ? separator : "---";
};

public method .set_separator() {
    arg newsep;
    
    .perms(sender(), 'manager);
    separator = newsep;
};

public method .write_at_cmd() {
    arg cmdstr, cmd, at, str, prep, this;
    var who, line, lines, syn;
    
    (> .perms(sender()) <);
    who = sender();
    syn = ((("`" + cmd) + " at [line] <line number> on ") + this) + "`";
    str = str.explode();
    if ((str[1]) == "line")
        str = str.delete(1);
    line = $string.is_numeric(str[1]);
    if (!at)
        $parse_lib.tell_error(("Unknown line \"" + (str[1])) + "\".", syn, who);
    lines = .lines();
    if (line > (lines + 1))
        $parse_lib.tell_error(("There are only " + tostr(lines)) + " lines!", syn, who);
    .add_text(who.read(), who, line);
};

public method .write_cmd() {
    arg cmdstr, cmd, @args;
    var who, line;
    
    if (!(.is_writable_by(sender())))
        return ("You do not have permission to write on " + (.name())) + ".";
    who = sender();
    line = "Now writing on " + (.name());
    line += ", enter \".\" to finish and \"@abort\" to abort.";
    .add_text(who.read(line), who);
};

public method .write_str_cmd() {
    arg cmdstr, cmd, str, prep, this;
    
    (> .perms(sender()) <);
    if (!str)
        return ("Nothing to write on " + (.name())) + "!";
    .add_text([str], sender());
};


