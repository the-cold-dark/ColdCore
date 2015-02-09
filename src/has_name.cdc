
new object $has_name: $foundation;

var $has_name name = ['normal, "named object", "a named object"];
var $has_name templates = 0;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'fertile, 'core, 'variables];
var $root inited = 1;
var $root managed = [$has_name];
var $root manager = $has_name;

public method .add_name_template() {
    arg template;
    var p, r;
    
    (> .perms(sender()) <);
    if ((r = regexp(template, "[^a-z0-9|?_-]+")))
        throw(~invtmpl, "Template contains invalid characters (allowed: a-z, 0-9, _ and -)");
    for p in (explode(template, "|")) {
        if (match_begin(name[2], p.strip()))
            throw(~redundant, ("Redundant name template part \"" + p) + "\" already matches name.");
    }
    templates = setadd(templates || [], template);
};

public method .del_name_template() {
    arg template;
    
    (> .perms(sender()) <);
    templates = setremove(templates || [], template);
    if (!templates)
        (| clear_var('templates) |);
};

public method .hname() {
    arg @args;
    
    return ((("<a href=\"/bin/describe?target=" + (.objname())) + "\">") + ((.name()).to_html())) + "</a>";
};

public method .init_has_name() {
    var objname;
    
    objname = tostr(this());
    if ((objname[1]) == "$")
        objname = substr(objname, 2);
    name = ['prop, objname, objname];
};

public method .match_name() {
    arg str;
    var m, t;
    
    if (!str)
        return 0;
    if ((m = match_begin(name[2], str)))
        return m;
    for t in (templates || []) {
        if ((m = match_template(str, t)))
            return m;
    }
    return 0;
};

public method .match_name_exact() {
    arg str;
    
    return str == (name[2]);
};

public method .name() {
    arg @args;
    
    if (!name)
        return tostr(this());
    if (!args)
        return name[3];
    switch (args[1]) {
        case 'type:
            return name[1];
        case 'noarticle:
            return name[2];
        default:
            return name;
    }
};

public method .name_templates() {
    return templates || [];
};

public method .namef() {
    arg type;
    
    switch (type) {
        case 'ref:
            return (((.name()) + " (") + this()) + ")";
        case 'xref:
            return ((this() + " (") + (.name())) + ")";
        case 'name:
            return .name();
        case 'noarticle:
            return .name('noarticle);
        default:
            return (> pass(type) <);
    }
};

public method .set_name() {
    arg new_name, @args;
    var type;
    
    (> .perms(sender()) <);
    [(type ?= 'normal)] = args;
    (> $code_lib.valid_name(new_name, type) <);
    switch (type) {
        case 'prop:
            new_name = [new_name, new_name];
        case 'uniq:
            new_name = [new_name, "the " + new_name];
        case 'normal:
            new_name = [new_name, new_name.add_indefinite()];
    }
    name = [type, @new_name];
};


