
new object $editor_reference: $has_commands;

var $editor_reference active_editor = 0;
var $editor_reference bg_sessions = 0;
var $has_commands local = \
  #[["@mcp-upload-session", [["@mcp-upload-session", "*", "@mcp-upload-session <descendant of $editor_session>", 'mcp_upload_cmd, #[[1, ['descendant, [$editor_session]]]]]]],\
  ["@edit",\
    [["@edit", "*", "@edit <any>", 'edit_cmd, #[[1, ['any, []]]]]]]];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $root created_on = 820684615;
var $root defined_settings = #[["local-editor", #[['parse, ['parse_local_editor]]]]];
var $root flags = ['methods, 'code, 'fertile, 'core, 'variables];
var $root inited = 1;
var $root managed = [$editor_reference];
var $root manager = $editor_reference;
var $root settings = #[["local-editor", 'none]];

public method .active_editor() {
    return active_editor;
};

public method .background_editor_sessions() {
    return bg_sessions || [];
};

public method .cleanup_sessions() {
    arg @disregard;
    var out, s;
    
    (sender() == $housekeeper) || (> .perms(sender(), this()) <);
    out = [];
    for s in (bg_sessions || []) {
        if (valid(s)) {
            if (s.cleanup_session())
                s.destroy();
            else
                out = setadd(out, s);
        }
    }
    bg_sessions = out;
    if (valid(active_editor) && (active_editor.cleanup_session())) {
        active_editor.destroy();
        clear_var('active_editor);
    }
    return "Clean and invalid sessions cleared.";
};

public method .do_save() {
    arg @info;
    
    // The purpose of this method is to ensure that save is ran with
    // this user's perms
    if ((!(sender().has_ancestor($editor_session))) || (!((sender().startup_sender()) == this())))
        throw(~perm, "Permission denied");
    return (> (info[1]).(info[2])(info[3], info[4]) <);
};

protected method .edit() {
    arg ref, opts, type;
    
    if (.active_editor()) {
        .tell("Storing active editor..");
        .store_editor();
    }
    catch ~quota
        return .new_editor_session(ref, opts, type);
    with
        return ["You do not have enough quota remaining."];
};

public method .edit_cmd() {
    arg cmdstr, com, args;
    var syn, num, sess, out, type, i, e, bg;
    
    (> .perms(caller(), 'command) <);
    syn = "@edit <object reference> [+type=...]";
    args = args.trim();
    if (!args) {
        // list sessions
        out = [];
        e = .active_editor();
        if (e) {
            if ($editor_parser in (.parsers()))
                out += ["** %0 " + (e.session_name())];
            else
                out += ["   %0 " + (e.session_name())];
        }
        bg = .background_editor_sessions();
        for sess in [1 .. listlen(bg)]
            out += [(("   %" + sess) + " ") + ((bg[sess]).session_name())];
        if (out)
            return ["Editor Sessions:"] + out;
        return "No editor sessions.";
    } else if ((args[1]) == "%") {
        // resume session
        args = substr(args, 2);
        if ((!args) || ((args[1]) == " ")) {
            num = 0;
        } else {
            catch ~nonum
                num = (> args.to_number() <);
            with
                return (traceback()[1])[2];
        }
        if (!num) {
            if (.active_editor())
                return .reinvoke_editor(.active_editor(), "%0");
            else if (.background_editor_sessions())
                sess = (.background_editor_sessions())[1];
            else
                return "No sessions to resume.";
        } else {
            if ((listlen((.background_editor_sessions()) || []) < num) || (num < 0))
                return ("There is not an editor session %" + num) + ".";
            sess = (.background_editor_sessions())[num];
        }
        return .reinvoke_editor(sess, "%" + num);
    } else {
        args = (> $parse_lib.opt(args, "t?ype", "c?lean") <);
        if ((i = "c?lean" in ((args[2]).slice(1))))
            return .cleanup_sessions();
        if ((i = "t?ype" in ((args[2]).slice(1))))
            type = ((args[2])[i])[4];
        type ?= "any";
        catch ~objnf, ~namenf, ~ambig, ~symbol
            args = replace(args, 1, (> $parse_lib.ref((args[1]).join()) <));
        with
            return (traceback()[1])[2];
        return .edit(@args, type);
    }
};

public method .edit_sessions_notify() {
    var e, s, bg;
    
    if (bg_sessions) {
        .tell("<editor> Use @edit to resume the following editor sessions:");
        e = .active_editor();
        if (e) {
            if ($editor_parser in (.parsers()))
                .tell("<editor> ** %0 " + (e.session_name()));
            else
                .tell("<editor>    %0 " + (e.session_name()));
        }
        bg = .background_editor_sessions();
        for s in [1 .. listlen(bg)]
            .tell((("<editor>    %" + s) + " ") + ((bg[s]).session_name()));
    } else if (.active_editor()) {
        .tell("<editor> Disconnected from an active session. Use @edit %0 to resume.");
    }
};

public method .invoke_editor() {
    arg object, method, initial_text, cdata;
    
    // finishing object, finishing method, initial text, client data;
    if (active_editor != 0)
        throw(~misc, "Editor already active");
    (> object.perms(sender()) <);
    active_editor = $editor_session.spawn();
    if (active_editor.startup(object, method, initial_text, cdata))
        .add_parser($editor_parser);
};

public method .local_editor() {
    return .get_setting("local-editor", $editor_reference);
};

protected method .mcp_upload_cmd() {
    arg cmdstr, cmd, session;
    var text, status, tmp;
    
    (> .perms(caller(), 'command) <);
    text = (| .read("Reading the editor session text...") |);
    if (type(text) != 'list)
        return "Upload failed.";
    if (!(session in bg_sessions))
        return "Illegal session - upload failed.";
    tmp = active_editor;
    active_editor = session;
    catch any {
        status = session.mcp_upload(text);
    } with {
        .tell_traceback(traceback());
        status = "Compilation failed.";
    }
    active_editor = tmp;
    return status[2];
};

public method .parse_local_editor() {
    arg value, @args;
    var styles;
    
    value = (| (styles = #[["None", 'none], ["MCP", 'mcp]])[value] |);
    if (!value)
        throw(~wrong, "Local editor must be one of: " + ((styles.keys()).to_english("", " or ")));
    return value;
};

public method .quit_editor() {
    if (active_editor == 0)
        throw(~misc, "No active editor.");
    .perms(sender(), active_editor);
    .del_parser($editor_parser);
    active_editor.destroy();
    clear_var('active_editor);
};

protected method .reinvoke_editor() {
    arg @session;
    var i, t, name;
    
    t = "";
    [(session ?= active_editor), (name ?= "")] = session;
    if (session == 0)
        return "No session to resume.";
    bg_sessions ?= [];
    if (active_editor && ((active_editor != session) || (!(| session.is_resumable() |))))
        t = (.store_editor()) + " ";
    if ((!valid(session)) || (!(session in (bg_sessions + [active_editor])))) {
        active_editor = 0;
        return "Invalid session - editor cleared.";
    }
    if (!(| session.is_resumable() |))
        return "The session is not resumable, you can use '@edit +clean' to remove it";
    active_editor = session;
    bg_sessions = bg_sessions.setremove(active_editor);
    bg_sessions = filter i in (bg_sessions) where (valid(i));
    .add_parser($editor_parser);
    return [t, ("Resumed editing " + ((.active_editor()).session_name())) + ".", "Type 'help' to list available commands."];
};

public method .store_editor() {
    var t;
    
    if (active_editor) {
        (sender() == this()) || (> .perms(sender(), active_editor) <);
        .del_parser($editor_parser);
        bg_sessions = (bg_sessions ? bg_sessions : []).setadd(active_editor);
        t = active_editor;
        active_editor = 0;
        return "Editor session %s saved.".format(t);
    }
    return "No active editor.";
};


