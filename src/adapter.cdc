
new object $adapter: $misc;

var $dmi_data descriptions = #[];
var $root created_on = 863769089;
var $root credit = ["Brad Roberts <braddr@puremagic.com>", "Bruce Mitchener, Jr. <bruce@puremagic.com>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$adapter];
var $root manager = $adapter;

public method .process_args() {
    arg given_args, takes_args;
    var final_args, converter, this_arg, this_arg_data, arg_list;
    
    final_args = #[];
    for this_arg in (takes_args.keys()) {
        this_arg_data = takes_args[this_arg];
        if (!(given_args.contains(this_arg))) {
            if ((this_arg_data[1]) != [])
                final_args = final_args.add(this_arg, (this_arg_data[1])[1]);
            else
                throw(~missingarg, ("Argument " + this_arg) + " was not specified.");
        } else if (((this_arg_data[2]).length()) == 3) {
            converter = this_arg_data[2];
            final_args = final_args.add(this_arg, (> (converter[1]).(converter[2])(given_args[this_arg], @converter[3]) <));
        } else {
            final_args = final_args.add(this_arg, given_args[this_arg]);
        }
    }
    return final_args.add('arg_list, given_args.keys());
};


