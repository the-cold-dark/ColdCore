
new object $object_lib: $libraries;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root help_node = $help_obj_object_lib;
var $root inited = 1;
var $root managed = [$object_lib];
var $root manager = $object_lib;
var $root trusted = [];

public method .format_method_header() {
    arg obj, method, opt, flags, access;
    var f;
    
    if (access) {
        // shorten it a little
        access = tostr(access);
        access = strsub(access, "protected", "prot");
        access = strsub(access, "public", "pub");
        opt += ((opt ? " " : "") + "+access=") + access;
    }
    f = flags.join(",");
    
    // shorten it a little
    f = strsub(f, "nooverride", "noover");
    if (f)
        opt += ((opt ? " " : "") + "+flags=") + f;
    return (((("@program " + obj) + ".") + method) + "() ") + opt;
};

public method .format_object() {
    arg obj, chop;
    var len, line, out, c;
    
    if (type(obj) == 'frob)
        return ["Frob " + (obj.namef('ref))];
    c = obj.created_on();
    out = ["Object:   " + (obj.namef('xref)), "Created:  " + (c ? ctime(c) : "(Before Time)"), (("Quota:    " + (obj.quota())) + " bytes") + ((obj.quota_exempt()) ? " ** exempt **" : ""), "Perms:    " + (((obj.flags()).prefix("+")).join()), ("Size:     " + ((obj.size()).to_english())) + " bytes (on disk)", "Manager:  " + (.get_name(obj.manager(), 'namef, ['xref]))];
    line = obj.writers('literal);
    if ((line.length()) != 1)
        line = "Writers:  " + (line.to_english("(none)"));
    else
        line = "Writer:   " + ((line[1]).namef('xref));
    if (chop)
        line = line.chop(chop);
    out += [line];
    line = (obj.trusted('literal)) || [];
    if (listlen(line)) {
        line = "Trusts:   " + (line.to_english("(none)"));
        if (chop)
            line = line.chop(chop);
        out += [line];
    }
    line = obj.parents();
    if ((line.length()) > 1)
        line = "Parents:  " + ((line.mmap('namef, 'xref)).to_english());
    else if (!line)
        line = "Parents:  (none)";
    else
        line = "Parent:   " + ((line[1]).namef('xref));
    if (chop)
        line = line.chop(chop);
    out += [line];
    if (obj.has_ancestor($located))
        out += ["Location: " + (.get_name(obj.location(), 'namef, ['xref]))];
    if ((obj.is($path)) && (obj.ways()))
        out += ["Paths:    " + (((obj.ways()).mmap('join, " => ")).join(", "))];
    return out;
};

public method .get_name() {
    arg obj, @args;
    var meth;
    
    // get_name(obj, 'method, [args]) (3rd arg must be a list)
    if ((type(obj) == 'frob) && (!valid(frob_class(obj))))
        return toliteral(obj);
    if ((type(obj) != 'frob) && (!valid(obj)))
        return toliteral(obj);
    [(meth ?= 'name), (args ?= [])] = args;
    return obj.(meth)(@args);
};

public method .list_to_objlist() {
    arg args;
    var out, x, obj;
    
    out = #[['valid, []], ['invalid, []]];
    for x in (args) {
        obj = (| .to_dbref(x) |);
        if (obj)
            out = out.add_elem('valid, obj);
        else
            out = out.add_elem('invalid, x);
    }
    return out;
};

public method .parse_method_flags() {
    arg flags;
    
    return (((" " + (('nooverride in flags) ? "!" : "-")) + (('forked in flags) ? "f" : "-")) + (('locked in flags) ? "l" : "-")) + (('native in flags) ? "n" : "-");
};

public method .see_perms() {
    arg obj, @args;
    var str, flag, who, encapsulate, flags;
    
    [(encapsulate ?= ["[", "]"])] = args;
    str = encapsulate[1];
    flags = obj.flags();
    if ('core in flags) {
        flags = flags.setremove('core);
        str += "*";
    } else {
        str += "-";
    }
    if ('fertile in flags) {
        flags = flags.setremove('fertile);
        str += "f";
    } else {
        str += "-";
    }
    if ('methods in flags) {
        flags = flags.setremove('methods);
        str += "m";
    } else {
        str += "-";
    }
    if ('variables in flags) {
        flags = flags.setremove('variables);
        str += "v";
    } else {
        str += "-";
    }
    if ('code in flags) {
        flags = flags.setremove('code);
        str += "c";
    } else {
        str += "-";
    }
    for flag in (flags)
        str += (tostr(flag)[1]).uppercase();
    return str + (encapsulate[2]);
};

public method .str_to_objlist() {
    arg args;
    var out, x, obj;
    
    if ("," in args)
        args = args.explode_english_list();
    else
        args = args.explode();
    return .list_to_objlist(args);
};

public method .to_dbref() {
    arg obj;
    var dbref;
    
    switch (type(obj)) {
        case 'string:
            if (!obj)
                throw(~invdbref, "Invalid object reference \"\".");
            if ((obj[1]) == "$") {
                obj = obj.subrange(2);
                dbref = (| lookup(tosym(obj)) |);
            } else if ((obj[1]) == "#") {
                obj = substr(obj, 2);
                if (obj.is_numeric())
                    dbref = (| toobjnum(toint(obj)) |);
                else
                    throw(~objnf, ("Cannot find object \"#" + obj) + "\".");
            } else {
                dbref = toint(obj[1]);
                if (dbref || (obj == "0"))
                    dbref = toobjnum(dbref);
                else
                    dbref = (| lookup(obj) |);
            }
            if (!dbref) {
                dbref = (obj.replace(" ", "_")).lowercase();
                catch ~symbol
                    dbref = tosym(dbref);
                with
                    throw(~symbol, ("Object reference '" + dbref) + "' is invalid.");
                dbref = (> lookup(dbref) <);
            }
            return dbref;
        case 'objnum:
            return obj;
        default:
            return (> lookup(obj) <);
    }
};


