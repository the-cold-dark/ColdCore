
new object $tkmoo_format: $tagged_format;

var $dmi_data descriptions = #[];
var $root created_on = 888299262;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$tkmoo_format];
var $root manager = $tkmoo_format;

public method ._eval_ctext() {
    arg data, vars, @unexpand;
    var out, uflags, token;
    
    out = "";
    if (type(data) != 'list)
        data = [data];
    for token in (data) {
        refresh();
        switch (type(token)) {
            case 'frob:
                switch (class(token)) {
                    case $generator:
                        [token, vars] = ((| vars['evaluator] |) || $bs_eval).eval_generator(token, vars);
                        if (type(token) == 'string) {
                            out += token;
                        } else {
                            [token, vars] = ._eval_ctext(token, vars, 1);
                            out += token;
                        }
                    case $format:
                        [token, vars] = .eval_formatter(token, vars);
                        out += token;
                }
            case 'string:
                out += unexpand ? token : (.escape(token));
            case 'list:
                [token, vars] = ._eval_ctext(token, vars, @unexpand);
                out += token;
            default:
                out += token;
        }
    }
    return [out, vars];
};

public method .build_link_tag() {
    arg command, text;
    
    command = (((toliteral(command).replace("\\", "\\\\")).replace("{", "\{")).replace("}", "\}")).replace("\\", "\\\\");
    text = (((toliteral(text).replace("\\", "\\\\")).replace("{", "\{")).replace("}", "\}")).replace("\\", "\\\\");
    return ((("{link {command " + command) + "} {text ") + text) + "}}";
};

public method .do_detail() {
    arg vars, flags, args;
    var det;
    
    det = flags.getkey("name");
    return [.build_link_tag("look at " + det, det), vars];
};

public method .do_link() {
    arg vars, flags, args;
    var node;
    
    [args, vars] = ._eval_ctext([args[1]], vars);
    node = (| flags.getkey("node") |);
    if (node)
        return [.build_link_tag("@help " + node, args), vars];
    return [">>ERROR: Invalid help node<<", vars];
};

public method .do_method() {
    arg vars, flags, args;
    var out, vars, m;
    
    m = (flags[1])[1];
    [out, vars] = ._eval_ctext(args, vars);
    return [((("{link {command \"@list $" + m) + "\"} {text \"") + out) + "\"}}", vars];
};

public method .do_obj() {
    arg vars, flags, args;
    var gateway, argname, output, context, object, name, options, command, text;
    
    name = flags.getkey("name");
    [name, vars] = ._eval_ctext([name], vars);
    context = flags.getkey("context");
    options = (| flags.getkey("options") |);
    object = args[1];
    if (type(context) == 'string)
        context = tosym(context);
    if (options && (type(options) == 'string))
        options = tosym(options);
    switch (context) {
        case 'look:
            if (options) {
                switch (options) {
                    case 'exit:
                        command = object.name('noarticle);
                        text = name;
                    case 'contained:
                        command = (("look " + ((object.location()).name('noarticle))) + "'s ") + (object.name('noarticle));
                        text = name;
                }
            } else {
                command = "look " + (object.name('noarticle));
                text = name;
            }
        case 'display:
            command = "go " + (object.name());
            text = name;
            command = "@display " + object;
            text = name;
        case 'exit:
            command = "go " + (object.name());
            text = name;
    }
    return [.build_link_tag(command, text), vars];
};

public method .escape() {
    arg token;
    
    return (token.replace("{", "\{")).replace("}", "\}");
};

public method .tag_text() {
    arg tag;
    var match;
    
    match = tag.match_pattern("* \{text \"*\"\}*");
    if (match)
        return match[2];
    return tag;
    
    // this used to throw:
    // throw(~invtag, "Tag had no text field.");
};


