
new object $help_cmds: $help_core;

var $has_name name = ['prop, "Commands", "Commands"];
var $help_node body = <$ctext_frob, [["This node is simply a place holder, and should not be linked in through an index or anything. If you see it, something has gone wrong."], #[['this, $help_cmds]]]>;
var $help_node group = 1;
var $help_node holder = 1;
var $help_node links = #[];
var $help_node nolist = 1;
var $root created_on = 847128224;
var $root flags = ['variables, 'methods, 'code, 'core, 'fertile];
var $root inited = 1;
var $root managed = [$help_cmds];
var $root manager = $help_cmds;

public method .nolist() {
    arg @args;
    
    // all 'command' nodes are nolist
    return 1;
};

public method .top_of_help_hierarchy() {
    return definer() == this();
};


