
new object $tagged_format: $plain_format;

var $dmi_data descriptions = #[];
var $root created_on = 888336074;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$tagged_format];
var $root manager = $tagged_format;

public method .do_dt() {
    arg vars, flags, args;
    
    vars = vars.add('header, "");
    [args, vars] = ._eval_ctext(args, vars);
    if ((| vars['columned] |))
        return ["\n  ", vars.add('header, pad("  " + args, 25 + ((args.length()) - ((.tag_text(args)).length()))))];
    else
        return [("\n  " + args) + "\n", vars.add('header, "")];
};

public method .tag_text() {
    arg text;
    
    throw(~override, "Override me!!!");
};


