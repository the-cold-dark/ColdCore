
new object $help_theme: $help_coldcore;

var $has_name name = ['prop, "Theme", "Theme"];
var $help_node body = <$ctext_frob, [["This node needs to be written, use @help-list and @help-write"], #[]]>;
var $help_node index = $help_index_core;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 847060976;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_theme];
var $root manager = $help_theme;

root method .core_help_theme() {
    .set_body(["This node needs to be written, use @help-list and @help-write"]);
};


