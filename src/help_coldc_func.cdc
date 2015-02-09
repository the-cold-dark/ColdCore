
new object $help_coldc_func: $help_coldc;

var $has_name name = ['prop, "Functions", "Functions"];
var $help_node body = <$ctext_frob, [[<$format, ["table", [["cols", "18%,18%,18%,18%,18%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_funcs_buf"]], ["Buffer"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_funcs_data"]], ["Data"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_funcs_dict"]], ["Dictionary"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_funcs_err"]], ["Error"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_funcs_file"]], ["File"], 'do_link]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_funcs_list"]], ["List"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_funcs_meth"]], ["Method"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_funcs_misc"]], ["Misc"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_funcs_net"]], ["Network"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_funcs_num"]], ["Numeric"], 'do_link]>], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_funcs_obj"]], ["Object"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_funcs_str"]], ["String"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_funcs_sys"]], ["System"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_funcs_task"]], ["Task"], 'do_link]>], 'do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_funcs_var"]], ["Variable"], 'do_link]>], 'do_td]>], 'do_tr]>], 'do_table]>], #[['this, $help_coldc_func]]]>;
var $help_node index = $help_index_driver;
var $help_node links = #[["Buffer", $help_funcs_buf], ["Data", $help_funcs_data], ["Dictionary", $help_funcs_dict], ["Error", $help_funcs_err], ["File", $help_funcs_file], ["List", $help_funcs_list], ["Method", $help_funcs_meth], ["Misc", $help_funcs_misc], ["Network", $help_funcs_net], ["Numeric", $help_funcs_num], ["Object", $help_funcs_obj], ["String", $help_funcs_str], ["System", $help_funcs_sys], ["Task", $help_funcs_task], ["Variable", $help_funcs_var]];
var $help_node nolist = 0;
var $root created_on = 854058130;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_coldc_func];
var $root manager = $help_coldc_func;

public method .generate_body() {
    var k, out, funcs, max, cols, col, x, f, fdict;
    
    (definer() == sender()) || (> .perms(sender()) <);
    if ((this() != definer()) && (!(definer() in parents())))
        throw(~ack, "Don't run this on " + this());
    if (this() == definer()) {
        for k in (children())
            k.generate_body();
    }
    out = "";
    funcs = children();
    fdict = #[];
    for f in (funcs) {
        for x in ((f.name()).explode("|"))
            fdict = dict_add(fdict, x, f);
    }
    funcs = (fdict.keys()).sort();
    max = ((fdict.keys()).element_maxlength()) + 4;
    cols = 75 / max;
    if (cols < 1)
        throw(~type, (("Columns are less than one: " + cols) + " ") + max);
    col = toint((max / 75.0) * 100) + "%";
    out += "{table cols=" + col;
    if (cols > 1)
        out += ("," + col) * (cols - 1);
    out += ":";
    while (funcs) {
        refresh();
        out += "{tr:";
        for x in [1 .. cols] {
            out += "{td:";
            if (funcs) {
                f = funcs[1];
                funcs = delete(funcs, 1);
                out += ((("{link node=" + (fdict[f])) + ":") + f) + "}";
            }
            out += "}";
        }
        out += "}";
    }
    out += "}";
    .set_body(out);
};


