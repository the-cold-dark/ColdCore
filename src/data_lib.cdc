
new object $data_lib: $libraries;

var $root created_on = 849996459;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root help_node = $help_obj_data_lib;
var $root inited = 1;
var $root managed = [$data_lib];
var $root manager = $data_lib;

public method .data_map() {
    arg val, method, options, @args;
    var i, args, object, class;
    
    object = (| options['object] |);
    switch (type(val)) {
        case 'list:
            if ((| options['list] |))
                return object ? object.(method)(val, @args) : val.(method)(@args);
            return map i in (val) to (refresh() && (.data_map(i, method, options, @args)));
        case 'dictionary:
            if ((| options['dictionary] |))
                return object ? object.(method)(val, @args) : val.(method)(@args);
            if ((| options['keys] |))
                return hash i in (val) to ([.data_map(i[1], method, options, @args), refresh() && (.data_map(i[2], method, options, @args))]);
            return hash i in (val) to ([i[1], refresh() && (.data_map(i[2], method, options, @args))]);
        case 'frob:
            if ((| (class = options['class]) |)) {
                if ((| class(val) in class |))
                    return object ? object.(method)(val, @args) : val.(method)(@args);
                else
                    return val;
            }
            return (<class(val), (.data_map(val.value(), method, options, @args))>);
        default:
            if ((| options['all] |) || (| options[type(val)] |))
                return object ? object.(method)(val, @args) : val.(method)(@args);
            return val;
    }
};

public method .is_valid_type() {
    arg type;
    
    return type in ['integer, 'float, 'string, 'buffer, 'symbol, 'list, 'objnum, 'dictionary, 'error, 'frob];
};

public method .unparse_indent() {
    arg value;
    var s, i, len;
    
    refresh();
    switch (type(value)) {
        case 'list:
            if (!value)
                return ["[]"];
            s = map i in [1 .. (len = value.length())] to ((.unparse_indent(value[i])).affix((i < len) ? "," : "")).sum();
            s ?= [];
            if (((s.mmap('length)).sum()) < 60) {
                return [("[" + (s.join())) + "]"];
            } else {
                s = s.prefix("  ");
                s = s.replace(1, (s[1]).subrange(3));
                return (["[ "].affix(s)).affix("]");
            }
        case 'dictionary:
            s = map i in [1 .. (len = (value.keys()).length())] to ((.unparse_indent([(value.keys())[i], value[(value.keys())[i]]])).affix((i < len) ? "," : "")).sum();
            s ?= [];
            if (((s.mmap('length)).sum()) < 60) {
                return [("#[" + (s.join())) + "]"];
            } else {
                s = s.prefix("  ");
                s = s.replace(1, (s[1]).subrange(3));
                return (["#["].affix(s)).affix("]");
            }
        case 'frob:
            return (((["<"].affix(class(value))).affix(",")).affix(.unparse_indent(value.value()))).affix(">");
        default:
            return [toliteral(value)];
    }
};

public method .unparse_indent_html() {
    arg value;
    var chunk, chunk_out, out, object_parse, obj_regexp, line, word;
    
    obj_regexp = "\$[a-zA-Z0-9_]+";
    out = [];
    value = .unparse_indent(value);
    value = value.mmap('html_escape);
    for line in (value) {
        object_parse = line.global_regexp(obj_regexp);
        chunk_out = "";
        while (object_parse) {
            [chunk, (word ?= 0), @object_parse] = object_parse;
            chunk_out += chunk;
            if (word) {
                if ((| $object_lib.to_dbref(word) |))
                    chunk_out += $page_bin_index._make_string_to_display_href(word);
                else
                    chunk_out += word;
            }
        }
        out += [chunk_out];
    }
    return out;
};


