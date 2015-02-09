
new object $help_node: $has_name;

var $foundation edit_types = ["help"];
var $has_name name = ['uniq, "help_node", "the help_node"];
var $help_node body = 0;
var $help_node group = 0;
var $help_node holder = 0;
var $help_node index = 0;
var $help_node links = 0;
var $help_node nolist = 1;
var $root created_on = 796268969;
var $root defined_settings = #[["nolist", #[['get, ['nolist]], ['set, ['set_nolist]], ['parse, ['is_boolean]], ['format, ['format_boolean]]]], ["group", #[['get, ['group]], ['set, ['set_group]], ['parse, ['is_boolean]], ['format, ['format_boolean]]]], ["index", #[['get, ['get_index_setting]], ['set, ['set_index_setting]], ['parse, ['parse_index_setting]], ['format, ['format_index]]]], ["holder", #[['get, ['get_holder_setting]], ['set, ['set_holder_setting]], ['parse, ['is_boolean]], ['format, ['format_boolean]]]]];
var $root flags = ['methods, 'code, 'variables, 'core];
var $root help_node = $help_obj_help_node;
var $root inited = 1;
var $root managed = [$help_node];
var $root manager = $help_node;
var $root trusted_by = [$help_index_driver, $help_index_core, $help_index_cmds, $help_index_subsystem, $help_index_function, $help_index_objects, $help_updates, $help_sys_weather, $help_sys_weather_attributes, $help_sys_climate, $help_weather_system];

public method ._edit_help_callback() {
    arg text, client_data;
    
    (> .perms(caller(), $editor_reference) <);
    .set_body(text);
    return ['success, ["Help node body set."]];
};

protected method ._set_index() {
    arg i;
    
    if (index)
        (| index.del_help_node(this()) |);
    if (!i) {
        clear_var('index);
        return;
    }
    index = i;
    (> index.add_help_node(this()) <);
};

public method .body() {
    return body;
};

public method .edit_help() {
    var p;
    
    (> .perms(sender()) <);
    p = (.body()).uncompile();
    (> sender().invoke_editor(this(), '_edit_help_callback, p, []) <);
};

public method .format_index() {
    arg value;
    
    if (!value)
        return "";
    return (((value.name()) + " INDEX (") + value) + ")";
};

protected method .get_holder_setting() {
    arg @args;
    
    return holder;
};

protected method .get_index_setting() {
    arg @args;
    
    return index || 0;
};

public method .group() {
    arg @args;
    
    return !group;
};

public method .holder() {
    return holder;
};

public method .html_node_name() {
    arg @this;
    var name, index, hname;
    
    if (this() == definer())
        return "";
    name = ((.parents())[1]).html_node_name();
    if (this)
        hname = (.name()).word(1, "|");
    else if (holder)
        hname = ("<i>" + ((.name()).word(1, "|"))) + "</i>";
    else
        hname = ((("<a href=\"/bin/help?node=" + this()) + "\">") + ((.name()).word(1, "|"))) + "</a>";
    if (!name)
        return hname;
    return (name + ": ") + hname;
};

public method .index() {
    return index;
};

public method .index_going_away() {
    (> .perms(caller(), $help_index) <);
    (| clear_var('index) |);
};

root method .init_help_node() {
    links = #[];
    .set_body(["This node isn't written yet"]);
};

public method .links() {
    return links || #[];
};

public method .node_going_away() {
    var node;
    
    (> .perms(caller(), $help_node) <);
    node = sender();
    
    // do something intelligent with the text body as well
    links = links.del(node);
};

public method .node_name() {
    var name;
    
    if (this() == definer())
        return "";
    name = ((.parents())[1]).node_name();
    if (!name)
        return (.name()).word(1, "|");
    return (name + ": ") + ((.name()).word(1, "|"));
};

public method .nolist() {
    arg @args;
    
    return nolist;
    
    // whether or not this node should be listed as a 'descendant' node of
    // its parent.
};

protected method .parse_index_setting() {
    arg value, @args;
    var i;
    
    if (!value)
        return 0;
    if ((value[1]) == "$") {
        i = (> $object_lib.to_dbref(value) <);
        if (!(i.has_ancestor($help_index)))
            throw(~bad, ("\"" + (i.namef('ref))) + "\" is not a help index.");
    } else {
        value = strsed(value, " *index *", "");
        if (!(i = $help_index.match_children(value)))
            throw(~bad, ("\"" + value) + "\" is not a help index.");
    }
    return i;
};

public method .set_body() {
    arg new_body;
    var new_body, anchors, key, keys, values, value;
    
    (> .perms(sender()) <);
    
    // Compile a string into help ctext
    new_body = $compiler.compile_cml(new_body);
    body = new_body;
    anchors = (| new_body.get_var('links) |) || #[];
    body = (<$ctext_frob, [body._ctext(), (| (body.vars()).del('links) |) || (body.vars())]>);
    keys = anchors.keys();
    values = anchors.values();
    links = #[];
    for key in (keys)
        links = links.add(key, $object_lib.to_dbref(anchors[key]));
    if ((!(.has_ancestor($help_index))) && (!(this() == $help_updates)))
        $help_updates.touched();
};

protected method .set_group() {
    arg name, definer, value, @args;
    
    // invert it, more db friendly this way since 99% of the nodes want groups
    value = !value;
    if (value)
        group = value;
    else
        (| clear_var('group) |);
};

protected method .set_holder_setting() {
    arg name, definer, value, @args;
    
    if (value)
        holder = 1;
    else if (holder)
        clear_var('holder);
};

public method .set_index() {
    arg index;
    
    (> .perms(sender()) <);
    return (> ._set_index(index) <);
};

protected method .set_index_setting() {
    arg name, definer, value, @args;
    
    ._set_index(value);
};

public method .set_name() {
    arg new, @ignore;
    var old;
    
    if ("=" in new)
        throw(~perm, "You cannot have \"=\" in a help node name.");
    old = .name();
    (> pass(new, 'prop) <);
    if (index)
        index.node_changed_name(old);
};

protected method .set_nolist() {
    arg name, definer, value, @args;
    
    nolist = value;
};

public method .small_name() {
    return ((.name()).word(1, "|")).word(1);
};

public method .top_of_help_heirarchy() {
    return definer() == this();
};

public method .traverse() {
    var n, out;
    
    // traverse the higherarchy with a depth-first priority rather than width
    out = [this()];
    for n in (children())
        out += n.traverse();
    return out;
};

root method .uninit_help_node() {
    var obj;
    
    if (index)
        (| index.node_going_away() |);
    links = #[];
    body = [];
    $help_updates.touched();
};


