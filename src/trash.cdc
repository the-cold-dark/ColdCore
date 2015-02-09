
new object $trash: $located_location;

var $command_cache commands = 0;
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $described prose = <$ctext_frob, [["When you discard something, it goes here if you do not manage it."], #[]]>;
var $event_handler hooks = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['uniq, "System Trash Can", "the System Trash Can"];
var $located location = $void;
var $located obvious = 1;
var $location contents = [];
var $root created_on = 830126811;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$trash];
var $root manager = $trash;
var $thing gender = $gender_neuter;
var $trash items = #[];

public method .del_sender_from_contents() {
    pass();
    items = dict_del(items, sender());
};

public method .did_arrive() {
    arg mover, place;
    var msg;
    
    (> pass(mover, place) <);
    (| (items = items.add(sender(), time())) |);
};

public method .did_leave() {
    arg mover, place;
    
    (> pass(mover, place) <);
    (| (items = items.del(sender())) |);
};


