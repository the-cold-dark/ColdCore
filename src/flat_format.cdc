
new object $flat_format: $wrapped_format;

var $root created_on = 858615622;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$flat_format];
var $root manager = $flat_format;

public method .do_link() {
    arg vars, flags, args;
    
    return ._eval_ctext(args[1], vars);
};

public method .do_th() {
    arg vars, flags, args;
    var tblinfo, rinfo, col, cols, rows, w, n, max;
    
    rows = (| toint(flags.getkey("rowspan")) |) || 1;
    cols = (| toint(flags.getkey("colspan")) |) || 1;
    rinfo = vars['rinfo];
    tblinfo = vars['table_info];
    col = (tblinfo[2]) + 1;
    n = [];
    max = listlen(tblinfo[1]);
    while (rinfo[col]) {
        col++;
        n += [[0, (tblinfo[1])[col], []]];
    }
    w = ((tblinfo[1]).subrange(col, cols)).sum();
    tblinfo = tblinfo.replace(2, (col + cols) - 1);
    vars = (vars.add('table_info, tblinfo)).add('header, "");
    [args, vars] = .eval_indented(args, vars, 0, w);
    return [(n + [[rows, w, args.explode("\n", 1)]]) + ($list.make(cols - 1, [rows, 0, []])), vars];
};

public method .format() {
    arg data, vars;
    var str, len, line, out;
    
    str = (> (._eval_ctext(data, vars))[1] <);
    if ((strlen(str) < 2) || (substr(str, strlen(str) - 1) != "\n"))
        str += "\n";
    
    // ugly and inneficient--use a client people
    len = (vars['receiver]).linelen();
    out = "";
    for line in (explode(str, "\n", 1))
        out += (line.wrap_line(len, "")) + "\n";
    return str_to_buf(out);
};


