
new object $cml_lib: $libraries;

var $cml_lib br = <$format, ["br", [], [], 'do_br]>;
var $cml_lib hr = <$format, ["hr", [], [], 'do_hr]>;
var $cml_lib p = <$format, ["p", [], [], 'do_p]>;
var $cml_lib sep = <$format, ["hr", [["sep", "3"]], [], 'do_hr]>;
var $dmi_data descriptions = #[];
var $root created_on = 863748283;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$cml_lib];
var $root manager = $cml_lib;

public method .fmt_b() {
    arg contents;
    
    return (<$format, ["b", [], [contents], 'do_b]>);
};

public method .fmt_br() {
    return br;
};

public method .fmt_dfn() {
    arg args;
    
    return (<$format, ["dfn", [], args, 'do_dfn]>);
};

public method .fmt_form() {
    arg form, @flags;
    
    return (<$format, ["form", flags, form, 'do_form]>);
};

public method .fmt_hr() {
    arg @flags;
    
    if (flags)
        return (<$format, ["hr", flags, [], 'do_hr]>);
    return hr;
};

public method .fmt_href() {
    arg url, str;
    
    return (<$format, ["a", [["href", url]], [str], 'do_href]>);
};

public method .fmt_input() {
    arg @flags;
    
    return (<$format, ["input", flags, [], 'do_input]>);
};

public method .fmt_invoke() {
    arg object, method, name;
    
    return (<$format, ["invoke", [["object", object], ["method", method]], [name], 'do_invoke]>);
};

public method .fmt_obj() {
    arg context, object, name, @args;
    var opt, src;
    
    if (args) {
        [opt, (src ?= sender())] = args;
        return (<$format, ["obj", [["context", context], ["name", name], ["options", opt]], [object, src], 'do_obj]>);
    } else {
        return (<$format, ["obj", [["context", context], ["name", name]], [object], 'do_obj]>);
    }
};

public method .fmt_p() {
    return p;
};

public method .fmt_pre() {
    arg args;
    
    return (<$format, ["pre", [], [args], 'do_pre]>);
};

public method .fmt_quote() {
    arg args;
    
    return (<$format, ["quote", [], [args], 'do_quote]>);
};

public method .fmt_sep() {
    return sep;
};

public method .fmt_subj() {
    arg text, @level;
    
    [(level ?= 4)] = level;
    return (<$format, ["subj", [["level", level]], [text], 'do_subj]>);
};

public method .fmt_table() {
    arg cols, @contents;
    
    return (<$format, ["table", [["cols", cols]], contents, 'do_table]>);
};

public method .fmt_td() {
    arg contents, @flags;
    var spanning, color;
    
    return (<$format, ["td", flags, [contents], 'do_td]>);
};

public method .fmt_textarea() {
    arg contents, @flags;
    
    return (<$format, ["textarea", flags, [contents], 'do_textarea]>);
};

public method .fmt_tr() {
    arg @contents;
    
    return (<$format, ["tr", [], contents, 'do_tr]>);
};

public method .format_br_tag() {
    return br;
};

public method .format_dfn_tag() {
    arg args;
    
    return (<$format, ["dfn", [], args, 'do_dfn]>);
};

public method .format_hr_tag() {
    return hr;
};

public method .format_invoke_tag() {
    arg object, method, name;
    
    return (<$format, ["invoke", [["object", object], ["method", method]], [name], 'do_invoke]>);
};

public method .format_obj_tag() {
    arg context, object, name, @args;
    var opt, src;
    
    if (args) {
        [opt, (src ?= sender())] = args;
        return (<$format, ["obj", [["context", context], ["name", name], ["options", opt]], [object, src], 'do_obj]>);
    } else {
        return (<$format, ["obj", [["context", context], ["name", name]], [object], 'do_obj]>);
    }
};

public method .format_p_tag() {
    return p;
};

public method .format_pre_tag() {
    arg args;
    
    return (<$format, ["pre", [], [args], 'do_pre]>);
};

public method .format_sep_tag() {
    return sep;
};

public method .format_subj_tag() {
    arg text, @level;
    
    [(level ?= 4)] = level;
    return (<$format, ["subj", [["level", level]], [text], 'do_subj]>);
};

public method .format_table_tag() {
    arg cols, @contents;
    
    return (<$format, ["table", [["cols", cols]], contents, 'do_table]>);
};

public method .format_td_tag() {
    arg contents, @flags;
    var spanning, color;
    
    return (<$format, ["td", flags, [contents], 'do_td]>);
};

public method .format_tr_tag() {
    arg @contents;
    
    return (<$format, ["tr", [], contents, 'do_tr]>);
};

public method .gen_english() {
    arg list;
    
    return (<$generator, ["english", [], list, 'gen_english]>);
};

public method .gen_join() {
    arg list, @sep;
    
    [(sep ?= ", ")] = sep;
    return (<$generator, ["join", [["separator", sep]], list, 'gen_join]>);
};

public method .generate_english_tag() {
    arg list;
    
    return (<$generator, ["english", [], list, 'gen_english]>);
};

public method .generate_join_tag() {
    arg list, @sep;
    
    [(sep ?= ", ")] = sep;
    return (<$generator, ["join", [["separator", sep]], list, 'gen_join]>);
};


