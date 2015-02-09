
new object $wearable_frob: $thing_frob;

var $described prose = [];
var $has_commands remote = #[];
var $has_name name = ['normal, "Generic Wearable Frob", "a Generic Wearable Frob"];
var $located location = $trash;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'fertile, 'variables, 'core];
var $root inited = 1;
var $root managed = [$wearable_frob];
var $root manager = $wearable_frob;
var $thing gender = 0;

protected method .change_data() {
    arg this, what, new;
    
    // hairy
    if (!(this['worn])) {
        if (what != 'worn)
            return pass(this, what, new);
        else
            (this['location]).del_frob_from_contents((<this(), this>));
    } else if (valid(this['worn])) {
        (this['worn]).shed((<this(), this>));
    }
    this = dict_add(this, what, new);
    if (valid(this['worn]))
        (this['worn]).wear((<this(), this>));
    else if (valid(this['location]))
        (this['location]).add_frob_to_contents((<this(), this>));
    return (<this(), this>);
};

frob method .discard() {
    arg data;
    
    if (!(data['worn]))
        pass(data);
    if (data['worn])
        (data['worn]).shed((<this(), data>));
};

public method .new() {
    return .to_frob((pass().value()).add('worn, 0));
};

frob method .shed() {
    arg this;
    
    if (!(this['worn]))
        throw(~perm, ("You are not wearing " + (.name(this))) + ".");
    if ((this['worn]) != sender())
        throw(~perm, ((("Remove " + (.name(this))) + " from ") + sender()) + "!?");
    return .change_data(this, 'worn, 0);
};

frob method .wear() {
    arg this;
    
    if ((this['location]) != sender())
        throw(~perm, ("You are not holding " + (.name(this))) + ".");
    return .change_data(this, 'worn, sender());
};


