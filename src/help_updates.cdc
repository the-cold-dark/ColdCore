
new object $help_updates: $help_coldcore;

var $has_name name = ['prop, "Updates", "Updates"];
var $help_node body = <$ctext_frob, [[], #[]]>;
var $help_node index = $help_index_subsystem;
var $help_node links = #[];
var $help_node nolist = 0;
var $help_updates cleanup_time = 2592000;
var $help_updates dirty = 2;
var $help_updates update_list = [[935820000, [$help_theme]]];
var $root created_on = 848537316;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_updates];
var $root manager = $help_updates;
var $root trusted = [$help_node];

public method .body() {
    var i, j, out, body;
    
    body = pass();
    if (dirty || (!body)) {
        if (!update_list) {
            out = ["There weren't any recent updates."];
        } else {
            out = ["{dl:"];
            for i in (update_list) {
                j = map j in (i[2]) to ([j.name(), "" + j]).sort();
                out += [((("{dt:" + ($time.format("%d-%b-%Y", i[1]))) + "}{dd:") + (map j in (j) to (strfmt("{link node=%l:%l}", j[2], j[1])).to_english())) + "}"];
            }
            out += ["}"];
        }
        .set_body(out);
        body = pass();
        dirty = 0;
    }
    return body;
};

root method .core_help_updates() {
    dirty = 1;
    update_list = [];
    .set_body([]);
};

public method .touched() {
    var i, j, t;
    
    (> .perms(caller(), 'trusts) <);
    dirty++;
    t = localtime();
    t = (((t[1]) - (t[2])) - (60 * (t[3]))) - (3600 * (t[4]));
    if ((i = t in (update_list.slice(1))))
        update_list = update_list.replace(i, [(update_list[i])[1], ((update_list[i])[2]).setadd(sender())]);
    else
        update_list += [[t, [sender()]]];
    update_list = map i in (update_list || []) to ([i[1], filter j in (i[2]) where ((| j.has_ancestor($help_node) |))]);
    update_list = filter i in (update_list || []) where ((i[2]) && ((i[1]) > (t - cleanup_time)));
};


