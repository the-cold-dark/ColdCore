
new object $help_prog_commands: $help_prog;

var $has_name name = ['prop, "Programming Commands", "Programming Commands"];
var $help_node body = <$ctext_frob, [[<$format, ["b", [], ["Programmer Commands Listing"], 'do_b]>, " ", <$format, ["np", [], [], 'do_np]>, "The following commands are available to programmers: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "30%,70%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_addcmd"]], ["@add-command"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Adds a command to a specific method."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_addparent"]], ["@add-parent"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Adds a parent to the target object."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_addshortcut"]], ["@add-shortcut"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Adds a shortcut to a specified command."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_addvariable"]], ["@add-variable"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Adds a variable to the object."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_ancestors"]], ["@ancestors"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Shows the objects \"tree\" of parents."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_chparent"]], ["@chp?arents"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Changes parents of object"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_chmanage"]], ["@chman?age"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Changes the manager (owner) of the object."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_chmod"]], ["@chmod"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Modifies the access flags on the object or method."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_configsetting"]], ["@config-set?ting"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Allows you to modify the options set when the setting was created."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_display"]], ["@d?isplay"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Displays general information about an object, and optionally shows methods."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_defsetting"]], ["@def-set?ting"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Creates new settings on objects."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_delcmd"]], ["@del-c?ommand"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Removes a command from the object"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_delmethod"]], ["@del-m?ethod"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Deletes a method from an object."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_delparent"]], ["@del-p?arent"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Removes a parent from an object."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_delshortcut"]], ["@del-s?hortcut"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Removes a defined shortcut to a command."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_delvariable"]], ["@del-v?ariable"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Removes a variable from the object."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_descendants"]], ["@descend?ants"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Lists the objects the have that object as an ancestor."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_dump"]], ["@dump"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["gives a complete textdump of an object"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_eval"]], ["@eval"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Used to test methods without programing them."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_grep"]], ["@grep"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Used to search methods on an object for specific text."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_hlist"]], ["@hl?ist"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Shows a help node in CML text."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_hwrite"]], ["@hw?rite"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["A one chance input to enter CML text for a help node."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_id"]], ["@id"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Summary information similar to @display"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_join"]], ["@join"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Teleports you to a user."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_list"]], ["@list"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Lists source code for the method."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_move"]], ["@move"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Moves methods or objects to another location"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_move"]], ["@copy"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Copies methods to another location"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_nh"]], ["@new-help-node"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Creates a new help node."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_program"]], ["@program"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Allows user to input data and then save and compile the text with a \".\" on a blank line."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_rehash"]], ["@rehash"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Updates your command cache."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_show"]], ["@show"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Displays methods, variables, messages, and other information about an object or method"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_spawn"]], ["@spawn"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Creates a new object"], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_trace"]], ["@trace"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Returns where and object receives an inherited method."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_undefsetting"]], ["@undef-set?ting"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Removes a setting from an object."], 'do_td]>], 'do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], [<$format, ["link", [["node", "$help_cmd_which"]], ["@which"], 'do_link]>], 'do_tt]>], 'do_td]>, <$format, ["td", [], ["Tells you where the method behind the command is."], 'do_td]>], 'do_tr]>], 'do_table]>], 'do_dfn]>], #[['links, #[["@add-command", "$help_cmd_addcmd"], ["@add-parent", "$help_cmd_addparent"], ["@add-shortcut", "$help_cmd_addshortcut"], ["@add-variable", "$help_cmd_addvariable"], ["@ancestors", "$help_cmd_ancestors"], ["@chp?arents", "$help_cmd_chparent"], ["@chman?age", "$help_cmd_chmanage"], ["@chmod", "$help_cmd_chmod"], ["@config-set?ting", "$help_cmd_configsetting"], ["@d?isplay", "$help_cmd_display"], ["@def-set?ting", "$help_cmd_defsetting"], ["@del-c?ommand", "$help_cmd_delcmd"], ["@del-m?ethod", "$help_cmd_delmethod"], ["@del-p?arent", "$help_cmd_delparent"], ["@del-s?hortcut", "$help_cmd_delshortcut"], ["@del-v?ariable", "$help_cmd_delvariable"], ["@descend?ants", "$help_cmd_descendants"], ["@dump", "$help_cmd_dump"], ["@eval", "$help_cmd_eval"], ["@grep", "$help_cmd_grep"], ["@hl?ist", "$help_cmd_hlist"], ["@hw?rite", "$help_cmd_hwrite"], ["@id", "$help_cmd_id"], ["@join", "$help_cmd_join"], ["@list", "$help_cmd_list"], ["@move", "$help_cmd_move"], ["@copy", "$help_cmd_move"], ["@new-help-node", "$help_cmd_nh"], ["@program", "$help_cmd_program"], ["@rehash", "$help_cmd_rehash"], ["@show", "$help_cmd_show"], ["@spawn", "$help_cmd_spawn"], ["@trace", "$help_cmd_trace"], ["@undef-set?ting", "$help_cmd_undefsetting"], ["@which", "$help_cmd_which"]]]]]>;
var $help_node index = $help_index_core;
var $help_node links = #[["@add-command", $help_cmd_addcmd], ["@add-parent", $help_cmd_addparent], ["@add-shortcut", $help_cmd_addshortcut], ["@add-variable", $help_cmd_addvariable], ["@ancestors", $help_cmd_ancestors], ["@chp?arents", $help_cmd_chparent], ["@chman?age", $help_cmd_chmanage], ["@chmod", $help_cmd_chmod], ["@config-set?ting", $help_cmd_configsetting], ["@d?isplay", $help_cmd_display], ["@def-set?ting", $help_cmd_defsetting], ["@del-c?ommand", $help_cmd_delcmd], ["@del-m?ethod", $help_cmd_delmethod], ["@del-p?arent", $help_cmd_delparent], ["@del-s?hortcut", $help_cmd_delshortcut], ["@del-v?ariable", $help_cmd_delvariable], ["@descend?ants", $help_cmd_descendants], ["@dump", $help_cmd_dump], ["@eval", $help_cmd_eval], ["@grep", $help_cmd_grep], ["@hl?ist", $help_cmd_hlist], ["@hw?rite", $help_cmd_hwrite], ["@id", $help_cmd_id], ["@join", $help_cmd_join], ["@list", $help_cmd_list], ["@move", $help_cmd_move], ["@copy", $help_cmd_move], ["@new-help-node", $help_cmd_nh], ["@program", $help_cmd_program], ["@rehash", $help_cmd_rehash], ["@show", $help_cmd_show], ["@spawn", $help_cmd_spawn], ["@trace", $help_cmd_trace], ["@undef-set?ting", $help_cmd_undefsetting], ["@which", $help_cmd_which]];
var $help_node nolist = 0;
var $root created_on = 846999554;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_prog_commands];
var $root manager = $help_prog_commands;


