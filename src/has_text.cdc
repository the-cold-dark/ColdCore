
new object $has_text: $foundation;

var $has_text text = 0;
var $root created_on = 796268969;
var $root defined_settings = #[["plaintext", #[['parse, ['is_boolean]], ['format, ['format_boolean]]]]];
var $root flags = ['methods, 'code, 'fertile, 'core, 'variables];
var $root help_node = $help_obj_has_text;
var $root inited = 1;
var $root managed = [$has_text];
var $root manager = $has_text;
var $root settings = #[["plaintext", 1]];

public method ._edit_text_callback() {
    arg t, client_data;
    
    (> .perms(caller(), $editor_reference) <);
    .set_text(t);
    return ['success, ["Text set."]];
};

public method .del_line() {
    arg linestr;
    var t;
    
    // deletes "line" where line is the actual line to delete
    if ((!(.is_writable_by(sender()))) && (sender() != this()))
        throw(~perm, "Permission Denied.");
    t = .get_raw_text();
    t = t.setremove(linestr);
    .set_text(t);
};

public method .del_nline() {
    arg nline;
    var t;
    
    // deletes nline where nline is an integer reference to a list location
    if ((!(.is_writable_by(sender()))) && (sender() != this()))
        throw(~perm, "Permission Denied.");
    t = .get_raw_text();
    t = (> t.delete(nline) <);
    .set_text(t);
};

public method .del_text() {
    // deletes all text
    if ((!(.is_writable_by(sender()))) && (sender() != this()))
        throw(~perm, "Permission Denied.");
    text = [];
};

public method .edit_text() {
    var p;
    
    (> .perms(sender()) <);
    p = .get_raw_text();
    (> sender().invoke_editor(this(), '_edit_text_callback, p, []) <);
};

public method .get_raw_text() {
    // returns text
    if ((!(.is_writable_by(sender()))) && (sender() != this()))
        throw(~perm, "Permission Denied.");
    if (.get_setting("plaintext", $has_text))
        return text;
    else if (type(text) == 'frob)
        return text.uncompile();
    else
        return text;
};

root method .init_has_text() {
    text = [];
};

public method .ins_line() {
    arg txt, @loc;
    var t;
    
    // inserts txt at loc (where loc is an integer)
    if ((!(.is_writable_by(sender()))) && (sender() != this()))
        throw(~perm, "Permission Denied.");
    [(loc ?= 0)] = loc;
    t = .get_raw_text();
    if (!loc)
        t += [txt];
    else
        t = (> t.insert(loc, txt) <);
    .set_text(t);
};

public method .ins_lines() {
    arg lines, loc;
    var line, t;
    
    // inserts txt at loc (where loc is an integer)
    if ((!(.is_writable_by(sender()))) && (sender() != this()))
        throw(~perm, "Permission Denied.");
    t = .get_raw_text();
    if (type(lines) != 'list)
        throw(~type, "Lines should be passed as a list of strings.");
    for line in (lines) {
        t = (> t.insert(loc, line) <);
        ++loc;
    }
    .set_text(t);
};

public method .lines() {
    return listlen((.get_raw_text()) || []);
};

public method .set_text() {
    arg txt;
    
    // resets ,text to the list sent
    if ((!(.is_writable_by(sender()))) && (sender() != this()))
        throw(~perm, "Permission Denied.");
    if (.get_setting("plaintext", $has_text)) {
        if (type(txt) == 'string)
            text = [txt];
        else
            text = txt;
    } else {
        text = $compiler.compile_cml(txt);
    }
};

public method .text() {
    // returns text
    if ((!(.is_writable_by(sender()))) && (sender() != this()))
        throw(~perm, "Permission Denied.");
    return text;
};

root method .uninit_has_text() {
    text = [];
};


