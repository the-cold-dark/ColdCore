
new object $help_obj_robot_methods: $help_obj_robot;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Robot Methods", "Robot Methods"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "Public Methods:", <$format, ["br", [], [], 'do_br]>, <$format, ["dl", [], [<$format, ["dt", [], [".", <$format, ["method", [["robot.parse_line", 1]], ["parse_line"], 'do_method]>, "(", <$format, ["var", [], ["line"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Accepts a line of text and treats it as if it had been typed by a user."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.tell", 1]], ["tell"], 'do_method]>, "(what, [", <$format, ["var", [], ["who"], 'do_var]>, "])"], 'do_dt]>, <$format, ["dd", [], ["Standard 'tell method for receiving input."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.event_notify", 1]], ["event_notify"], 'do_method]>, "(", <$format, ["var", [], ["event"], 'do_var]>, ", ", <$format, ["var", [], ["origin"], 'do_var]>, ", [", <$format, ["var", [], ["args"], 'do_var]>, "])"], 'do_dt]>, <$format, ["dd", [], [], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.startup", 1]], ["startup"], 'do_method]>, "()"], 'do_dt]>, <$format, ["dd", [], [], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.active", 1]], ["active"], 'do_method]>, "()"], 'do_dt]>, <$format, ["dd", [], ["Returns a dictionary of the active reactions."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.activate_reaction", 1]], ["activate_reaction"], 'do_method]>, "(", <$format, ["var", [], ["id"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Given an ", <$format, ["var", [], ["id"], 'do_var]>, ", activates that reaction."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.tell_traceback", 1]], ["tell_traceback"], 'do_method]>, "([", <$format, ["var", [], ["args"], 'do_var]>, "])"], 'do_dt]>, <$format, ["dd", [], [], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.add_reaction", 1]], ["add_reaction"], 'do_method]>, "([", <$format, ["var", [], ["args"], 'do_var]>, "])"], 'do_dt]>, <$format, ["dd", [], [], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.del_reaction", 1]], ["del_reaction"], 'do_method]>, "(", <$format, ["var", [], ["id"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], [], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.reactions", 1]], ["reactions"], 'do_method]>, "()"], 'do_dt]>, <$format, ["dd", [], ["Returns a dictionary of all defined reactions."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.match_type", 1]], ["match_type"], 'do_method]>, "(", <$format, ["var", [], ["type"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], [], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.reactions_cmd", 1]], ["reactions_cmd"], 'do_method]>, "(", <$format, ["var", [], ["cmdstr"], 'do_var]>, ", ", <$format, ["var", [], ["cmd"], 'do_var]>, ", ", <$format, ["var", [], ["this"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Command for listing information about the reactions on the robot."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.update_reaction", 1]], ["update_reaction"], 'do_method]>, "(", <$format, ["var", [], ["id"], 'do_var]>, ", ", <$format, ["var", [], ["part"], 'do_var]>, ", ", <$format, ["var", [], ["value"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], [], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.deactivate_reaction", 1]], ["deactivate_reaction"], 'do_method]>, "(", <$format, ["var", [], ["id"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Given an ", <$format, ["var", [], ["id"], 'do_var]>, ", deactivates that reaction."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.connected", 1]], ["connected"], 'do_method]>, "()"], 'do_dt]>, <$format, ["dd", [], ["If the robot is active, returns true, otherwise false."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.connected_time", 1]], ["connected_time"], 'do_method]>, "([", <$format, ["var", [], ["args"], 'do_var]>, "])"], 'do_dt]>, <$format, ["dd", [], [], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.idle_time", 1]], ["idle_time"], 'do_method]>, "([", <$format, ["var", [], ["args"], 'do_var]>, "])"], 'do_dt]>, <$format, ["dd", [], [], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.activate_reaction_cmd", 1]], ["activate_reaction_cmd"], 'do_method]>, "(", <$format, ["var", [], ["cmdstr"], 'do_var]>, ", ", <$format, ["var", [], ["cmd"], 'do_var]>, ", ", <$format, ["var", [], ["int"], 'do_var]>, ", ", <$format, ["var", [], ["prep"], 'do_var]>, ", ", <$format, ["var", [], ["this"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Command for activating a reaction on the robot."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.deactivate_reaction_cmd", 1]], ["deactivate_reaction_cmd"], 'do_method]>, "(", <$format, ["var", [], ["cmdstr"], 'do_var]>, ", ", <$format, ["var", [], ["cmd"], 'do_var]>, ", ", <$format, ["var", [], ["int"], 'do_var]>, ", ", <$format, ["var", [], ["prep"], 'do_var]>, ", ", <$format, ["var", [], ["this"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Command for deactivating a reaction on the robot."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.add_reaction_cmd", 1]], ["add_reaction_cmd"], 'do_method]>, "(", <$format, ["var", [], ["cmdstr"], 'do_var]>, ", ", <$format, ["var", [], ["cmd"], 'do_var]>, ", ", <$format, ["var", [], ["str"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Command for adding a new reaction to the robot."], 'do_dd]>], 'do_dl]>, "Protected Methods:", <$format, ["br", [], [], 'do_br]>, <$format, ["dl", [], [<$format, ["dt", [], [".", <$format, ["method", [["robot.react_command", 1]], ["react_command:react_command"], 'do_method]>, "(", <$format, ["var", [], ["str"], 'do_var]>, ", ", <$format, ["var", [], ["match"], 'do_var]>, ", ", <$format, ["var", [], ["sender"], 'do_var]>, ", ", <$format, ["var", [], ["cmd"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], [], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.react_subcmd", 1]], ["react_subcmd"], 'do_method]>, "(", <$format, ["var", [], ["str"], 'do_var]>, ", ", <$format, ["var", [], ["match"], 'do_var]>, ", ", <$format, ["var", [], ["sender"], 'do_var]>, ", ", <$format, ["var", [], ["cmd"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], [], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.check_reactions", 1]], ["check_reactions"], 'do_method]>, "(", <$format, ["var", [], ["type"], 'do_var]>, ", ", <$format, ["var", [], ["str"], 'do_var]>, ", ", <$format, ["var", [], ["sender"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], [], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.update_active", 1]], ["update_active"], 'do_method]>, "(", <$format, ["var", [], ["key"], 'do_var]>, ", ", <$format, ["var", [], ["id"], 'do_var]>, ", ", <$format, ["var", [], ["value"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], [], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.remove_active", 1]], ["remove_active"], 'do_method]>, "(", <$format, ["var", [], ["key"], 'do_var]>, ", ", <$format, ["var", [], ["id"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], [], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.do_reaction", 1]], ["do_reaction"], 'do_method]>, "(", <$format, ["var", [], ["str"], 'do_var]>, ", ", <$format, ["var", [], ["match"], 'do_var]>, ", ", <$format, ["var", [], ["id"], 'do_var]>, ", ", <$format, ["var", [], ["sender"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], [], 'do_dd]>], 'do_dl]>, "Private Methods:", <$format, ["br", [], [], 'do_br]>, <$format, ["dl", [], [<$format, ["dt", [], [".", <$format, ["method", [["robot.check_reaction_args", 1]], ["check_reaction_args"], 'do_method]>, "(", <$format, ["var", [], ["method"], 'do_var]>, ", ", <$format, ["var", [], ["template"], 'do_var]>, ", ", <$format, ["var", [], ["type"], 'do_var]>, ", ", <$format, ["var", [], ["chance"], 'do_var]>, ", ", <$format, ["var", [], ["times"], 'do_var]>, ", ", <$format, ["var", [], ["hook"], 'do_var]>, ", ", <$format, ["var", [], ["min"], 'do_var]>, ", ", <$format, ["var", [], ["max"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Type checking method."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.check_reaction_hook", 1]], ["check_reaction_hook"], 'do_method]>, "(", <$format, ["var", [], ["hook"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Type checking method."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.check_reaction_hook_method", 1]], ["check_reaction_hook_method"], 'do_method]>, "(", <$format, ["var", [], ["method"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Type checking method."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.check_reaction_hook_args", 1]], ["check_reaction_hook_args"], 'do_method]>, "(", <$format, ["var", [], ["args"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Type checking method."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.check_reaction_min", 1]], ["check_reaction_min"], 'do_method]>, "(", <$format, ["var", [], ["min"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Type checking method."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.check_reaction_max", 1]], ["check_reaction_max"], 'do_method]>, "(", <$format, ["var", [], ["max"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Type checking method."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.check_reaction_matchwith", 1]], ["check_reaction_matchwith"], 'do_method]>, "(", <$format, ["var", [], ["method"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Type checking method."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.check_reaction_template", 1]], ["check_reaction_template"], 'do_method]>, "(", <$format, ["var", [], ["template"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Type checking method."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.check_reaction_type", 1]], ["check_reaction_type"], 'do_method]>, "(", <$format, ["var", [], ["type"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Type checking method."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.check_reaction_chance", 1]], ["check_reaction_chance"], 'do_method]>, "(", <$format, ["var", [], ["chance"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Type checking method."], 'do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["robot.check_reaction_times", 1]], ["check_reaction_times"], 'do_method]>, "(", <$format, ["var", [], ["times"], 'do_var]>, ")"], 'do_dt]>, <$format, ["dd", [], ["Type checking method."], 'do_dd]>], 'do_dl]>], #[]]>;
var $help_node index = $help_index_objects;
var $help_node links = #[];
var $root created_on = 888050905;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_obj_robot_methods];
var $root manager = $help_obj_robot_methods;


