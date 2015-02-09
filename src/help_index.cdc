
new object $help_index: $has_name, $registry, $help_node;

var $db database = #[];
var $has_name name = ['prop, "Index", "Index"];
var $help_index dirty = 1;
var $help_node body = <$ctext_frob, [[], #[]]>;
var $help_node holder = 1;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$help_index];
var $root manager = $help_index;

public method .add_help_node() {
    arg node;
    var part;
    
    if ((caller() != $help_node) && (!(.is_writable_by(caller()))))
        throw(~perm, "Permission denied.");
    for part in ((node.name()).explode("|"))
        .insert(part, node);
};

public method .body() {
    var key, out, body, col, db;
    
    body = pass();
    if (dirty || (!body)) {
        (| clear_var('dirty) |);
        db = .database();
        out = ["{table cols=25%,25%,25%,25%:"];
        for key in ((db.keys()).sort()) {
            if (!col)
                out += ["{tr:"];
            out += [((("{td:{link node=" + (db[key])) + ":") + key) + "}}"];
            if (col == 3) {
                out += ["}"];
                col = 0;
            } else {
                col++;
            }
        }
        if (col != 0)
            out += ["}}"];
        else
            out += ["}"];
        .set_body(out);
        body = pass();
    }
    return body;
};

root method .core_help_index(): nooverride  {
    .set_body("");
    .clean_database();
    dirty++;
};

public method .del_help_node() {
    arg node;
    var part;
    
    if ((!(caller() in [$help_node, definer()])) && ((!(.is_writable_by(sender()))) && (sender() != this())))
        throw(~perm, "Permission denied.");
    for part in ((node.name()).explode("|"))
        .remove(part);
};

public method .html_node_name() {
    arg @args;
    
    return .node_name();
};

root method .init_help_index() {
    .add_trusted($help_node);
};

public method .insert() {
    arg name, obj;
    
    (> pass(name, obj) <);
    dirty++;
};

public method .node_changed_name() {
    arg old;
    var node, part;
    
    (> .perms(caller(), $help_node) <);
    node = sender();
    for part in (old.explode("|"))
        (| .remove(part) |);
    for part in ((node.name()).explode("|"))
        (| .insert(part, node) |);
};

public method .node_going_away() {
    (> .perms(caller(), $help_node) <);
    .del_help_node(sender());
};

public method .node_name() {
    return (.name()) + " INDEX";
};

public method .remove() {
    arg name;
    
    (> pass(name) <);
    dirty++;
};

public method .reset_index() {
    var v, part, dbv;
    
    (> .perms(sender()) <);
    dirty++;
    dbv = ((.database()).values()).compress();
    .set_database(#[]);
    for v in (dbv) {
        if (valid(v)) {
            for part in ((v.name()).explode("|"))
                (| .insert(part, v) |);
        }
    }
};

public method .strip_key() {
    arg key;
    
    anticipate_assignment();
    return key.strip("!#$%^&*()");
};

root method .uninit_help_index() {
    var key;
    
    for key in ((.database()).keys())
        (.match_exact(key)).index_going_away();
};


