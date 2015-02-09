
new object $editor_session: $misc;

var $editor_session client_data = 0;
var $editor_session finisher = 0;
var $editor_session finisher_object = 0;
var $editor_session line = 0;
var $editor_session modified = 0;
var $editor_session sender = 0;
var $editor_session text = 0;
var $root created_on = 820684587;
var $root flags = ['methods, 'code, 'fertile, 'core, 'variables];
var $root inited = 1;
var $root managed = [$editor_session];
var $root manager = $editor_session;

public method ._parse_range() {
    arg what, @args;
    var start, end, range, allow_pastend, colon;
    
    if (what == "%")
        what = "1-$";
    what = strsub(what, "$", tostr(listlen(text)));
    what = strsub(what, ".", tostr(line));
    what = strsub(what, ",", "-");
    allow_pastend = (| args[1] |) ? 1 : 0;
    if ((| args[2] |) && stridx(what, ":")) {
        what = strsub(what, ":", "-");
        colon = 1;
    }
    if (!what) {
        start = (end = line);
    } else {
        range = (> $parse_lib.range(what) <);
        start = range[1];
        if (start == 'specific)
            throw(~range, "Illegal range.");
        end = ((range[2]) == 'single) ? start : (range[2]);
    }
    if ((start < 1) || ((colon && (end < 0)) || ((!colon) && ((end > (listlen(text) + allow_pastend)) || (end < start)))))
        throw(~range, "Illegal range.");
    return [start, colon ? (-end) : end];
};

public method .abort_cmd() {
    arg @args;
    
    (> .perms(caller(), 'command) <);
    sender.quit_editor();
    return "Aborted. Editor cleared.";
};

public method .after_cmd() {
    arg cmd, tmpl, what;
    var offset;
    
    (> .perms(caller(), 'command) <);
    if (line > listlen(text))
        offset = line - listlen(text);
    if (what || match_regexp(cmd, "^[^a-z]")) {
        modified = 1;
        text = insert(text, (line + 1) - offset, what);
        line += 2 - offset;
        return ("Line " + (line - 1)) + " added.";
    } else {
        return .read_text(1 - offset, sender());
    }
};

public method .append_cmd() {
    arg cmd, tmpl, what;
    var offset;
    
    (> .perms(caller(), 'command) <);
    modified = 1;
    if (line > listlen(text)) {
        text += [what];
        return ("Line " + listlen(text)) + " added.";
    } else if (line == 1) {
        text = [what] + text;
        line = 2;
        return "Line 1 added.";
    } else {
        text = replace(text, line, (text[line]) + what);
        return ("Appended to line " + tostr(line)) + ".";
    }
};

public method .cleanup_session() {
    (> .perms(sender()) <);
    if (type(text) == 'symbol)
        return 1;
    return !modified;
};

public method .compile_errors() {
    arg @err;
    var m;
    
    if ((m = regexp(err[1], "Line ([0-9]+)"))) {
        line = min((text.length()) + 1, toint(m[1]));
        return [.list_cmd("", "", m[1])] + err;
    }
    return err;
};

public method .copy_cmd() {
    arg cmd, tmpl, args;
    var m, range, toline, copy, start, end;
    
    (> .perms(caller(), 'command) <);
    if ((m = match_template(args, "* to *")))
        [range, m, toline] = m;
    else if (listlen((m = explode(args))) > 1)
        [range, toline] = m;
    else
        toline = args;
    if (!toline)
        return "Copy to where?";
    toline = toint(toline);
    if ((toline < 1) || (toline > (listlen(text) + 1)))
        return ((("Line " + toline) + " is outside the possible range (1 .. ") + (listlen(text) + 1)) + ").";
    if (range) {
        if (!(range = (| ._parse_range(args, 'allow) |)))
            return "Illegal range, cannot copy.";
    } else if (line > listlen(text)) {
        return "Illegal range, cannot copy.";
    } else {
        range = [line, line];
    }
    [start, end] = range;
    copy = sublist(text, start, (end - start) + 1);
    text = listgraft(text, toline, copy);
    line = toline + listlen(copy);
    if (start == end)
        return ((("Line " + start) + " copied to line ") + toline) + ".";
    return ((((("Lines " + start) + " .. ") + end) + " copied to line ") + toline) + ".";
};

public method .delete_cmd() {
    arg cmd, tmpl, what;
    var start, end, gone, foo, len;
    
    (> .perms(caller(), 'command) <);
    catch any
        start = ._parse_range(what);
    with
        return "Illegal range, can't delete.";
    [start, end] = start;
    len = end - start;
    gone = sublist(text, start, (end - start) || 1);
    text = sublist(text, 1, start - 1) + sublist(text, end + 1);
    modified = 1;
    line = start;
    return ((((((("Deleted " + ((end - start) + 1)) + " line") + ((end == start) ? "" : "s")) + " (\"") + ((gone[1]).chop(20))) + "\"), current line is ") + line) + ".";
};

public method .fill_cmd() {
    arg cmd, tmpl, what;
    var start, end, width;
    
    (> .perms(caller(), 'command) <);
    what = what.explode();
    catch any
        start = ._parse_range(what[1]);
    with
        return "Illegal range, can't fill.";
    end = start[2];
    start = start[1];
    width = ((what.length()) > 1) ? ((what[2]).to_number()) : 75;
    text = ((text.subrange(1, start - 1)) + (((text.subrange(start, (end - start) + 1)).join(" ")).wrap_lines(width))) + (text.subrange(end + 1));
    modified = 1;
    line = start;
    return ("Fill completed. Current set to " + tostr(start)) + ".";
};

protected method .format_line() {
    arg lineno, @linelen__shownumbers;
    var linelen, shownumbers, prefix, prefix_size, indent, textlen;
    
    linelen = (| linelen__shownumbers[1] |) || (sender.linelen());
    shownumbers = ((linelen__shownumbers.length()) > 1) ? (linelen__shownumbers[2]) : 1;
    if (shownumbers) {
        textlen = text.length();
        if (textlen < 10) {
            prefix_size = 5;
            indent = "     ";
        } else if (textlen < 1000) {
            prefix_size = 6;
            indent = "      ";
        } else {
            prefix_size = (tostr(textlen).length()) + 3;
            indent = pad("", prefix_size);
        }
        prefix = ((((lineno == line) ? "=>" : "") + lineno) + ": ").right(prefix_size);
        return (prefix + (text[lineno])).wrap_lines(linelen, indent);
    } else {
        return (text[lineno]).wrap_lines(linelen, "");
    }
};

public method .help_cmd() {
    arg cmd, tmpl, what;
    var parse;
    
    what = what.trim();
    if (!what)
        return ["Editor commands (use 'help <cmd>' for detailed information):"] + (((($editor_parser.commands()).keys()).vcolumnize(3, (sender().linelen()) - 5)).prefix("    "));
    parse = $editor_parser.parse(sender(), what, $null_parser);
    if ((parse[1]) in ['ok, 'failed])
        return ("Unable to find editor command '" + what) + "'.";
    return ($editor_parser.command_help())[parse[3]];
};

public method .insert_cmd() {
    arg cmd, tmpl, what;
    
    (> .perms(caller(), 'command) <);
    modified = 1;
    if (what || match_regexp(cmd, "^[^a-z]")) {
        text = insert(text, line, what);
        line++;
        return ("Line " + tostr(line - 1)) + " added.";
    } else {
        return .read_text(0, sender());
    }
};

public method .is_resumable() {
    return type(text) != 'symbol;
};

public method .join_cmd() {
    arg cmd, tmpl, args;
    var range, width, sep, spos, epos;
    
    (> .perms(caller(), 'command) <);
    catch any
        range = ._parse_range(args.word(1));
    with
        return "Illegal range, can't join.";
    if (" " in args)
        sep = ((substr(args, (" " in args) + 1).trim()).unquote()) || " ";
    else
        sep = " ";
    [spos, epos] = range;
    text = (sublist(text, 1, spos - 1) + [join(sublist(text, spos, (epos - spos) + 1), sep)]) + sublist(text, epos + 1);
    modified = 1;
    line = spos;
    return ("Join completed. Current set to " + line) + ".";
};

public method .line_cmd() {
    arg cmd, tmpl, number;
    
    (> .perms(caller(), 'command) <);
    number = number.trim();
    catch ~nonum
        number = (number == "$") ? (text.length()) : (number.to_number());
    with
        return "You must set to a line number.";
    if ((number < 1) || (number > ((text.length()) + 1)))
        return "Out of range.";
    else
        line = number;
    return ("Current line set to " + tostr(line)) + ".";
};

public method .list_cmd() {
    arg cmd, tmpl, rangestr;
    var start, end, start_preview, end_postview, preview, middle, postview, linelen, i, l, lineno, rows, chop, diff, lines, first_preview_line;
    
    (> .perms(caller(), $user, definer()) <);
    if (text == [])
        return "There is no text.";
    rangestr = rangestr.trim();
    rows = (| sender().get_rows() |) || 20;
    l = text.length();
    if (!rangestr) {
        start = line;
        start_preview = (rows - 1) / 2;
        end = line;
        end_postview = rows / 2;
    } else {
        catch any
            [start, end] = ._parse_range(rangestr, 0, 1);
        with
            return "Illegal list range.";
        if (end < 1) {
            end_postview = (chop = -end);
            end = start;
        }
    }
    preview = (middle = (postview = []));
    linelen = sender.linelen();
    
    // sigh.. there's gotta be a better way to do this.. I'm still thinking.
    // this works for now, tho.  -R
    //
    // get the explicitly specified bit of text.
    for i in [start .. min(end, l)]
        middle += .format_line(i, linelen);
    
    // count any wrapped lines as taking up part of the postview.
    if (end_postview == (middle.length()))
        end_postview = 0;
    else
        end_postview -= (middle.length()) - 1;
    
    // if it's too much for the postview, take it out of the preview, too.
    if (end_postview < 0) {
        start_preview = max(start_preview + end_postview, 0);
        end_postview = 0;
    }
    
    // the following will cause [End] to always show after the current line if
    // it's the last line when the user types 'list' by itself, even if there
    // wouldn't otherwise be any space for a postview. 
    if ((!rangestr) && ((end_postview == 0) && (end == l))) {
        start_preview = max(start_preview - 1, 0);
        ++end_postview;
    }
    
    // get the preview text.
    i = start - 1;
    while (i && ((preview.length()) < start_preview)) {
        preview = (.format_line(i, linelen)) + preview;
        i -= 1;
    }
    first_preview_line = i;
    
    // if we're too close to the beginning for the full amount of preview, add
    // the excess to the postview length.
    if ((preview.length()) < start_preview)
        end_postview += start_preview - (preview.length());
    
    // get the postview text.
    for i in [end + 1 .. end + end_postview] {
        if (i > l) {
            postview += [(((l + 1) == line) ? "=>" : "") + "[End]"];
            break;
        }
        lines = .format_line(i, linelen);
        postview += lines;
        if ((postview.length()) == end_postview) {
            break;
        } else if ((postview.length()) > end_postview) {
            diff = ((postview.length()) - end_postview) + 1;
            postview = postview.subrange(1, end_postview - 1);
            if (diff == (lines.length()))
                postview += ["[..next line..]"];
            else
                postview += [((("[.." + (diff.to_english_text())) + " more row") + ((diff > 1) ? "s" : "")) + "..]"];
            break;
        }
    }
    
    // if we're too close to the end for the full amount of postview, add the
    // excess to the preview.
    if ((postview.length()) < end_postview) {
        start_preview += end_postview - (postview.length());
    
        // add to the preview text if necessary to fill the enlarged demand.
        i = first_preview_line;
        while (i && ((preview.length()) < start_preview)) {
            preview = (.format_line(i, linelen)) + preview;
            i -= 1;
        }
    }
    
    // cut preview to size.
    if ((preview.length()) > start_preview)
        preview = preview.subrange(((preview.length()) - start_preview) + 1);
    
    // if the user specified a fixed number of lines, and even with no
    // preview/postview it's too much, chop off the end of the middle portion too
    if (chop && ((middle.length()) > chop)) {
        diff = (middle.length()) - chop;
        middle = (middle.subrange(1, chop)) + [((("[.." + (diff.to_english_text())) + " more row") + ((diff > 1) ? "s" : "")) + "..]"];
    }
    return (preview + middle) + postview;
};

public method .mcp_upload() {
    arg newtext;
    var err;
    
    (> .perms(sender()) <);
    if ((> (err = sender.do_save(finisher_object, finisher, newtext, client_data)) <) == 'clear) {
        sender.quit_editor();
        return "Done. Editor cleared.";
    }
    if (type(err) != 'list)
        modified = 0;
    return err ? err : "Save completed.";
};

public method .move_cmd() {
    arg cmd, tmpl, args;
    var m, range, toline, move, start, end;
    
    (> .perms(caller(), 'command) <);
    if ((m = match_template(args, "* to *")))
        [range, m, toline] = m;
    else if (listlen((m = explode(args))) > 1)
        [range, toline] = m;
    else
        toline = args;
    if (!toline)
        return "Copy to where?";
    toline = (| ._parse_range(toline, 'allow) |);
    if ((!toline) || ((toline[1]) != (toline[2])))
        return "Invalid move destination reference.";
    toline = toline[1];
    if (range) {
        if (!(range = (| ._parse_range(args, 'allow) |)))
            return "Illegal range, cannot move.";
    } else if (line > listlen(text)) {
        return "Illegal range, cannot move.";
    } else {
        range = [line, line];
    }
    [start, end] = range;
    if ((toline == start) || ((toline == end) || ((toline > start) && (toline < end))))
        return "Source and destination lines conflict.";
    move = sublist(text, start, (end - start) + 1);
    if (toline > end) {
        text = listgraft(text, toline, move);
        text = sublist(text, 1, start - 1) + sublist(text, end + 1);
        line = toline;
    } else {
        text = sublist(text, 1, start - 1) + sublist(text, end + 1);
        text = listgraft(text, toline, move);
        line = toline + listlen(move);
    }
    if (start == end)
        return ((("Line " + start) + " moved to line ") + toline) + ".";
    return ((((("Lines " + start) + " .. ") + end) + " moved to line ") + toline) + ".";
};

public method .quit_cmd() {
    arg cmd, tmpl, @args;
    var ans;
    
    (> .perms(caller(), 'command) <);
    if (modified) {
        ans = (> sender.prompt("Discard changes? [yes] ") <);
        if (!(ans.is_boolean()))
            return "Ok.  Editor not cleared.";
    }
    sender.quit_editor();
    return "Done. Editor cleared.";
};

private method .read_text() {
    arg offset, sender;
    var newtext, start;
    
    if ((> (newtext = sender.read()) <)) {
        if (newtext == 'aborted)
            return;
        modified = 1;
        text = listgraft(text, line + offset, newtext);
        start = line + offset;
        line = (line + (newtext.length())) + offset;
        if (listlen(newtext) == 1)
            return ("Line " + start) + " added.";
        return ((("Lines " + start) + " to ") + (start + listlen(newtext))) + " added.";
    } else {
        return "Text unchanged.";
    }
};

public method .save_cmd() {
    arg cmd, tmpl, args;
    var result, m;
    
    (> .perms(caller(), $user, this()) <);
    if ((m = match_template(args, "as *")))
        return "Save as support is not yet completed.";
    catch ~perm {
        if ((> (result = sender.do_save(finisher_object, finisher, text, client_data)) <) == 'clear) {
            sender.quit_editor();
            return "Done. Editor cleared.";
        }
        if ((result[1]) == 'failure)
            return .compile_errors(@result[2]);
        modified = 0;
        return (result[2]) + ["Save completed."];
    } with {
        return (traceback()[1])[2];
    }
};

public method .sed() {
    arg start, end, search, replace, opts;
    var x, line, changed;
    
    if (end > listlen(text))
        end = listlen(text);
    for x in [start .. end] {
        line = strsed(text[x], search, replace, opts);
        if (strcmp(line, text[x])) {
            text = replace(text, x, line);
            changed++;
        }
    }
    return changed;
};

public method .send_cmd() {
    arg cmd, tmpl, args;
    var err, m, list, recip, subj, mail, ismail, ret, cd, out;
    
    (> .perms(caller(), $user, this()) <);
    ismail = client_data && ((client_data[1]) == 'mail);
    if ((m = match_template(args, "to *")))
        args = m[2];
    else
        args = args.trim('left);
    list = [];
    for recip in (args.explode_english_list()) {
        if (recip == "me") {
            list = setadd(list, sender());
        } else {
            catch ~listnf
                list = list.setadd((> $mail_lib.match_mail_recipient(recip) <));
            with
                sender().tell(("The recipient \"" + recip) + "\" is invalid.");
        }
    }
    if (!list) {
        if (ismail)
            list = client_data[2];
        else
            return "No recipients specified.";
    }
    if (ismail) {
        cd = client_data;
        cd = replace(cd, 2, list);
    } else {
        cd = ['mail, list, ""];
    }
    ret = (> sender()._edit_mail_callback(text, cd) <);
    if ((ret[1]) == 'success) {
        if (ismail)
            sender.quit_editor();
        return [ret[2], "Done. Editor Cleared."];
    } else {
        return ret[2];
    }
};

public method .session_name() {
    var tmp;
    
    // cruft this up at a later time
    switch (finisher) {
        case '_edit_method_callback:
            return ((("Method " + (client_data[1])) + ".") + (client_data[2])) + "()";
        case '_edit_messages_callback:
            return "Messages on " + (finisher_object.namef('ref));
        case '_edit_mail_callback:
            return "Mail for " + (((client_data[2]).mmap('mail_name)).to_english());
        case '_edit_variable_callback:
            return (("Object Variable " + (client_data[1])) + ",") + (client_data[2]);
        default:
            tmp = strsed(tostr(finisher), "_edit_", "");
            tmp = strsed(tmp, "_callback", "");
            return "%l/%l".format(finisher_object.name(), tmp);
    }
};

public method .startup() {
    arg fin_object, finish_method, initial_text, cdata;
    
    (> .perms(sender()) <);
    if (type(initial_text) == 'string)
        initial_text = [initial_text];
    sender = sender();
    finisher = finish_method;
    finisher_object = fin_object;
    text = initial_text;
    line = 1;
    modified = 0;
    client_data = cdata;
    if ((| (sender().local_editor()) == 'mcp |)) {
        // Next time, when you have a clever idea about edit name, check
        // it for non-method editting sessions
        sender.ptell([(("#$# edit name: " + (.session_name())) + " upload: @mcp-upload-session ") + (.name()), @text, "."], #[['nomod, 1]]);
        text = 'mcp;
        sender.store_editor();
        return 0;
    } else {
        return 1;
    }
};

public method .startup_sender(): nooverride  {
    return sender;
};

public method .store_cmd() {
    arg cmd, tmpl, @args;
    
    (> .perms(caller(), 'command) <);
    return sender.store_editor();
};

public method .sub() {
    arg start, end, search, replace, opts;
    var x, line, changed, i;
    
    if (end > listlen(text))
        end = listlen(text);
    for x in [start .. end] {
        line = strsub(text[x], search, replace, opts);
        if (strcmp(line, text[x])) {
            text = replace(text, x, line);
            changed++;
        }
    }
    return changed;
};

public method .subst_cmd() {
    arg cmd, tmpl, args;
    var start, end, opts, changed, sep, h, range;
    
    (> .perms(caller(), 'command) <);
    h = ($editor_parser.command_help())['subst_cmd];
    if (!args)
        return h;
    sep = args[1];
    args = substr(args, 2);
    args = explode(args, sep, 'keep_blanks);
    if ((!args) || (listlen(args) < 2))
        return h + ["", "! Invalid number of arguments."];
    if (text == [])
        return h + ["", "! There is no text to search and replace in."];
    if (listlen(args) > 2) {
        [opts, range] = (args[3]).regexp("([gsci]*)(.*)");
        if ((!range) && (listlen(args) > 3))
            range = args[3];
    } else {
        opts = "";
    }
    if (range) {
        catch any
            start = ._parse_range(range);
        with
            return h + ["", "! " + ((traceback()[1])[2])];
        [start, end] = start;
    } else {
        start = line;
        end = line;
    }
    if (cmd == "sed")
        changed = .sed(start, end, args[1], args[2], opts);
    else
        changed = .sub(start, end, args[1], args[2], opts);
    modified = changed;
    if (changed == 1)
        return changed + " line changed.";
    else if (changed > 1)
        return changed + " lines changed.";
    else
        return "No lines changed.";
};


