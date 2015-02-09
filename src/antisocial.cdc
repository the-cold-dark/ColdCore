
new object $antisocial: $user_interfaces;

var $antisocial antisocial_msgs = #[["feh", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " kicks ", <$generator, ["who", [], [], 'gen_who]>, " rather firmly in the kiester."], #[['this, $antisocial]]]>]];
var $command_cache modules = [];
var $foundation defined_msgs = #[["ice", #[['branches, ["general", "actor", "who"]]]], ["eye", #[['branches, ["general", "actor", "who"]]]], ["pat", #[['branches, ["general", "actor", "who"]]]], ["pummel", #[['branches, ["general", "actor", "who"]]]], ["prod", #[['branches, ["general", "actor", "who"]]]], ["kick", #[['branches, ["general", "actor", "who"]]]], ["hug", #[['branches, ["general", "actor", "who"]]]], ["beat", #[['branches, ["general", "actor", "who"]]]], ["hit", #[['branches, ["general", "actor", "who"]]]], ["peer", #[['branches, ["general", "actor", "who"]]]], ["bite", #[['branches, ["general", "actor", "who"]]]], ["nip", #[['branches, ["general", "actor", "who"]]]], ["poke", #[['branches, ["general", "actor", "who"]]]], ["bonk", #[['branches, ["general", "actor", "who"]]]], ["fart", #[['branches, ["general", "actor", "who"]]]], ["bounce", #[['branches, ["general", "actor", "who"]]]]];
var $foundation msgs = #[["ice", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " pours a bucket of ice water over ", <$generator, ["who", [], [], 'gen_who]>, "'s head."], #[]]>], ["actor", <$ctext_frob, [["You pour a bucket of ice water over ", <$generator, ["who", [], [], 'gen_who]>, "'s head."], #[]]>], ["who", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " pours a bucket of ice water over your head."], #[]]>]]], ["eye", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " eyes ", <$generator, ["who", [], [], 'gen_who]>, " warily."], #[]]>], ["actor", <$ctext_frob, [["You eye ", <$generator, ["who", [], [], 'gen_who]>, " warily."], #[]]>], ["who", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " eyes you warily."], #[]]>]]], ["pat", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " pats ", <$generator, ["who", [], [], 'gen_who]>, " onna head."], #[]]>], ["actor", <$ctext_frob, [["You pat ", <$generator, ["who", [], [], 'gen_who]>, " onna head."], #[]]>], ["who", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " pats you onna head."], #[]]>]]], ["pummel", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " pummels ", <$generator, ["who", [], [], 'gen_who]>, " into a milky white substance."], #[]]>], ["actor", <$ctext_frob, [["You pummel ", <$generator, ["who", [], [], 'gen_who]>, " into a milky white substance."], #[]]>], ["who", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " pummels you into a milky white substance. ouch."], #[]]>]]], ["prod", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " prods ", <$generator, ["who", [], [], 'gen_who]>, " with a cowpoke."], #[]]>], ["actor", <$ctext_frob, [["You prod ", <$generator, ["who", [], [], 'gen_who]>, " with a cowpoke."], #[]]>], ["who", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " prods you with a cowpoke. ouch."], #[]]>]]], ["kick", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " kicks ", <$generator, ["who", [], [], 'gen_who]>, " firmly in the kiester."], #[]]>], ["actor", <$ctext_frob, [["You kick ", <$generator, ["who", [], [], 'gen_who]>, " firmly in the kiester."], #[]]>], ["who", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " kicks you firmly in the kiester."], #[]]>]]], ["hug", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " bear hugs ", <$generator, ["who", [], [], 'gen_who]>, "."], #[]]>], ["actor", <$ctext_frob, [["You bear hug ", <$generator, ["who", [], [], 'gen_who]>, "."], #[]]>], ["who", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " bear hugs you. oif."], #[]]>]]], ["beat", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " pulls out a stick and beats the ", <$generator, ["who", [], [], 'gen_who]>, " repeatedly."], #[]]>], ["actor", <$ctext_frob, [["You pull out a stick and beat the ", <$generator, ["who", [], [], 'gen_who]>, " repeatedly."], #[]]>], ["who", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " pulls out a stick and beats you repeatedly."], #[]]>]]], ["hit", #[["general", <$ctext_frob, [["Boldly, ", <$generator, ["actor", [], [], 'gen_actor]>, " pulls out a stick and beats the ", <$generator, ["who", [], [], 'gen_who]>, " repeatedly."], #[]]>], ["actor", <$ctext_frob, [["Boldly, you pull out a stick and beat the ", <$generator, ["who", [], [], 'gen_who]>, " repeatedly."], #[]]>], ["who", <$ctext_frob, [["Boldly, ", <$generator, ["actor", [], [], 'gen_actor]>, " pulls out a stick and beats you repeatedly. oif."], #[]]>]]], ["peer", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " peers suspiciously at ", <$generator, ["who", [], [], 'gen_who]>, "."], #[]]>], ["actor", <$ctext_frob, [["You peer suspiciously at ", <$generator, ["who", [], [], 'gen_who]>, "."], #[]]>], ["who", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " peers suspiciously at you."], #[]]>]]], ["bite", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " BITES ", <$generator, ["who", [], [], 'gen_who]>, "."], #[]]>], ["actor", <$ctext_frob, [["You BITE ", <$generator, ["who", [], [], 'gen_who]>, "."], #[]]>], ["who", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " BITES you."], #[]]>]]], ["nip", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " nips at ", <$generator, ["who", [], [], 'gen_who]>, "."], #[]]>], ["actor", <$ctext_frob, [["You nip at ", <$generator, ["who", [], [], 'gen_who]>, "."], #[]]>], ["who", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " nips at you."], #[]]>]]], ["poke", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " firmly jabs ", <$generator, ["pro", [["actor", 1]], ["pp"], 'gen_pro]>, " index finger into ", <$generator, ["who", [], [], 'gen_who]>, "'s ribs."], #[]]>], ["actor", <$ctext_frob, [["You jab your index finger firmly into ", <$generator, ["who", [], [], 'gen_who]>, "'s ribs."], #[]]>], ["who", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " firmly jabs ", <$generator, ["pro", [["actor", 1]], ["pp"], 'gen_pro]>, " index finger into your ribs. oif."], #[]]>]]], ["bonk", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " maliciously bonks ", <$generator, ["who", [], [], 'gen_who]>, " onna head."], #[]]>], ["actor", <$ctext_frob, [["You maliciously bonk ", <$generator, ["who", [], [], 'gen_who]>, " onna head."], #[]]>], ["who", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " maliciously bonks you onna head. oif."], #[]]>]]], ["fart", #[["general", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " farts in ", <$generator, ["who", [], [], 'gen_who]>, "'s general direction."], #[]]>], ["actor", <$ctext_frob, [["You fart in ", <$generator, ["who", [], [], 'gen_who]>, "'s general direction."], #[]]>], ["who", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " farts in your general direction."], #[]]>]]], ["bounce", #[["who", <$ctext_frob, [[<$generator, ["actor", [], [], 'gen_actor]>, " bounces towards you obnoxiously!"], #[]]>], ["general", <$ctext_frob, [["You bounce obnoxiously towards ", <$generator, ["who", [], [], 'gen_who]>, "!"], #[]]>]]]];
var $has_commands local = \
  #[["ice", [["ice", "*", "ice <object>", 'anti_cmd, #[[1, ['object, []]]]]]],\
  ["eye",\
    [["eye", "*", "eye <object>", 'anti_cmd, #[[1, ['object, []]]]]]],\
  ["fart",\
    [["fart", "*", "fart <object>", 'anti_cmd, #[[1, ['object, []]]]]]],\
  ["kick",\
    [["kick", "*", "kick <object>", 'anti_cmd, #[[1, ['object, []]]]]]],\
  ["pat",\
    [["pat", "*", "pat <object>", 'anti_cmd, #[[1, ['object, []]]]]]],\
  ["pummel",\
    [["pummel", "*", "pummel <object>", 'anti_cmd, #[[1, ['object, []]]]]]],\
  ["poke",\
    [["poke", "*", "poke <object>", 'anti_cmd, #[[1, ['object, []]]]]]],\
  ["prod",\
    [["prod", "*", "prod <object>", 'anti_cmd, #[[1, ['object, []]]]]]],\
  ["bonk",\
    [["bonk", "*", "bonk <object>", 'anti_cmd, #[[1, ['object, []]]]]]],\
  ["hug",\
    [["hug", "*", "hug <object>", 'anti_cmd, #[[1, ['object, []]]]]]],\
  ["hit",\
    [["hit", "*", "hit <object>", 'anti_cmd, #[[1, ['object, []]]]]]],\
  ["peer",\
    [["peer", "*", "peer <object>", 'anti_cmd, #[[1, ['object, []]]]]]],\
  ["bite",\
    [["bite", "*", "bite <object>", 'anti_cmd, #[[1, ['object, []]]]]]],\
  ["nip",\
    [["nip", "*", "nip <object>", 'anti_cmd, #[[1, ['object, []]]]]]],\
  ["bounce",\
    [["bounce", "*", "bounce <object>", 'anti_cmd, #[[1, ['object, []]]]]]]];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $root created_on = 838182893;
var $root flags = ['variables, 'methods, 'code, 'fertile, 'core, 'general_cache];
var $root inited = 1;
var $root managed = [$antisocial];
var $root manager = $antisocial;

public method .anti_cmd() {
    arg cmdstr, cmd, @who;
    var message, vars, victim, m, s;
    
    (> .perms(caller(), 'command) <);
    s = sender();
    vars = #[["$actor", s], ["actor", s.name()]];
    if (who)
        vars = (vars.add("$who", who[1])).add("who", (who[1]).name());
    (s.location()).announce(s.eval_message(cmd, definer(), vars));
};

public method .antisocial_msgs() {
    return antisocial_msgs;
};

public method .set_antisocial() {
    arg name, message;
    var mes, partial, compiler;
    
    (> .perms(sender(), 'writer) <);
    if (!antisocial_msgs)
        antisocial_msgs = #[];
    compiler = $compiler;
    message = compiler.compile_cml(message);
    antisocial_msgs = antisocial_msgs.add(name, message);
};

public method .test() {
    arg @who;
    var vars, m, message;
    
    if (who)
        who = .match_environment(who[1]);
    vars = #[["$actor", this()], ["actor", .name()], ["$who", who], ["who", who.name()]];
    message = (definer().antisocial_msgs())["feh"];
    m = message.set_vars(vars);
    .tell(m);
    .announce(m, this());
};


