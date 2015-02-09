
new object $social: $user_interfaces;

var $command_cache modules = [];
var $foundation defined_msgs = #[["bow", #[['branches, ["actor", "general", "victim"]]]]];
var $foundation msgs = #[["bow", #[["actor", <$ctext_frob, [["You bow to ", <$generator, ["victim", [], [], 'gen_victim]>, "."], #[]]>], ["victim", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " bows to you."], #[]]>], ["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " bows to ", <$generator, ["victim", [], [], 'gen_victim]>, "."], #[]]>]]]];
var $has_commands local = \
  #[["bow", [["bow", "*", "bow <object>", 'social_cmd, #[[1, ['object, []]]]]]]];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $root created_on = 838260513;
var $root flags = ['variables, 'methods, 'code, 'core, 'general_cache];
var $root inited = 1;
var $root managed = [$social];
var $root manager = $social;
var $user_interfaces links = 2;

public method .social_cmd() {
    arg cmdstr, cmd, @who;
    var vars, i, n, s;
    
    (> .perms(caller(), 'command) <);
    s = sender();
    vars = #[["$actor", s], ["actor", s.name()]];
    n = 0;
    for i in (who) {
        if ((| i.name() |)) {
            vars = (vars.add(n ? ("$victim_" + n) : "$victim", i)).add(n ? ("victim_" + n) : "victim", i.name());
            n++;
        }
    }
    (s.location()).announce(.eval_message(cmd, $social, vars));
};


