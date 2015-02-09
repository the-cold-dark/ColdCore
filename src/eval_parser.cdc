
new object $eval_parser: $user_parsers;

var $root created_on = 847137598;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$eval_parser];
var $root manager = $eval_parser;
var $user_parsers priority = 500;

public method .evaluate() {
    arg user, str;
    var ep, vars, v, reg, r;
    
    ep = user.eval_prefix();
    vars = (ep.keys()).join(", ");
    v = (ep.values()).join();
    if (match_begin(str, "var") && (reg = regexp(str, "var ([^;]+)"))) {
        str = strsed(str, "var ([^;]+);", "");
        str = ((((("var " + vars) + ", ") + (reg.join(","))) + ";") + v) + str;
    } else if ("return" in str) {
        str = ((("var " + vars) + ";") + v) + str;
    } else {
        str = strsed(str, " *;* *$", "");
        str = ((((("var " + vars) + ";") + v) + "return (> ") + str) + " <);";
    }
    r = (> user.evaluate(str, user, user) <);
    r = r[2];
    if ((r[1]) == 'errors)
        throw(~evalerr, "Eval error: " + (r[2]));
    return r[2];
};

public method .parse() {
    arg u, str, next_parser, @other_parsers;
    var out, l, eval;
    
    if (("`" in str) && (!match_begin(str, ";"))) {
        str = strsub(str, "\`", "<#QUOTED-TICK#>");
        out = str.explode_delimited("`", "`");
        eval = out[2];
        str = "";
        for l in (out[1]) {
            if (type(l) == 'integer)
                str += (> .evaluate(u, eval[l]) <);
            else
                str += l;
        }
        str = strsub(str, "<#QUOTED-TICK#>", "`");
    }
    return next_parser.parse(u, str, @other_parsers);
};


