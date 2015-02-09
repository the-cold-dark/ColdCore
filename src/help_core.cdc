
new object $help_core: $help_node;

var $has_name name = ['prop, "Core Help Root", "Core Help Root"];
var $help_node body = <$ctext_frob, [["This node isn't written yet"], #[['this, $help_core]]]>;
var $help_node holder = 1;
var $help_node links = #[];
var $help_node nolist = 1;
var $root created_on = 848184185;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_core];
var $root manager = $help_core;

public method .node_name() {
    var name;
    
    // just reprog this for now, later we should have a 'top of tree' setting
    if (this() == definer())
        return "";
    name = ((.parents())[1]).node_name();
    if (!name)
        return (.name()).word(1, "|");
    return (name + ": ") + ((.name()).word(1, "|"));
};


