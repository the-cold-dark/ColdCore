
new object $introtut_user_graffiti: $thing;

var $described prose = <$ctext_frob, [["This is a list of descriptions from people around ", <$generator, ["server_name", [], [], 'gen_servername]>, ". It is randomly sampled, and if you look at it again it will represent different descriptions."], #[]]>;
var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['prop, "graffiti", "graffiti"];
var $introtut_user_graffiti users = [];
var $located location = $introtut_desc;
var $located obvious = 1;
var $root created_on = 874175358;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$introtut_user_graffiti];
var $root manager = $introtut_user_graffiti;
var $thing gender = $gender_neuter;
var $thing lock = <$object_lock_frob, [$introtut_desc]>;

public method .core_introtut_user_graffiti() {
    var o;
    
    users = filter o in (users) where (valid(o));
};

public method .description() {
    arg flags;
    var p, i, lines, d, u, brake;
    
    p = $ctext_frob.new_with([$cml_lib.format_hr_tag()]);
    lines = [];
    if (users) {
        u = users;
    } else {
        u = [];
        d = ($user_db.database()).to_dict();
        brake = 0;
        while ((listlen(u) < 4) && (brake++ < 20)) {
            i = dict_keys(d).random();
            if (((d[i]).prose()) != "You see nothing special") {
                u += [d[i]];
                d = dict_del(d, i);
            }
        }
    }
    for i in (u)
        lines += [p, i.prose()];
    return (> pass(flags) <) + lines;
};

public method .set_users() {
    arg list;
    
    // specify a list of objects which have good descriptions for users, to
    // be used as examples.  If this list exists then the descriptions will
    // not be randomly selected.  If it is zero-length, they will be.
    (> .perms(sender()) <);
    users = list;
};

public method .users() {
    return users;
};


