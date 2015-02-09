
new object $help_administrators: $help_coldcore;

var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Administrators|Admins", "Administrators|Admins"];
var $help_node body = <$ctext_frob, [["This node isn't written yet"], #[]]>;
var $help_node index = $help_index_subsystem;
var $help_node links = #[];
var $root created_on = 887666903;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_administrators];
var $root manager = $help_administrators;

public method .body() {
    arg @ignored;
    var admins, a, output, def, role, c1, c2, o;
    
    admins = [];
    def = "General Administrator";
    for a in ($sys.admins()) {
        role = a.get_setting("admin-role", $admin);
        if (match_begin(role, "Arch"))
            role = "0 " + role;
        else if (role && ((role[1]) in ($string.alphabet())))
            role = "00 " + role;
        else if (!role)
            role = "000 " + def;
        admins += [[role, a]];
    }
    output = [];
    for a in (admins.sort()) {
        o = $cml_lib.format_obj_tag('look, a[2], (a[2]).name());
        c1 = $cml_lib.format_td_tag(o);
        role = strsed(a[1], "^0+ ", "");
        c2 = $cml_lib.format_td_tag(role);
        output += [$cml_lib.format_tr_tag(c1, c2)];
    }
    return $ctext_frob.new_with([$cml_lib.format_dfn_tag(["Administrators:", $cml_lib.format_p_tag(), $cml_lib.format_table_tag("25%,75%", @output)])]);
};


