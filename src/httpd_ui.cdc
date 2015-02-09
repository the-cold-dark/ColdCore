
new object $httpd_ui: $user_interfaces;

var $command_cache modules = [];
var $dmi_data descriptions = #[];
var $has_commands local = \
  #[["@list-entries", [["@list-entries", "on *", "@list-entries on <descendant of $directories>", 'list_entries_cmd, #[[2, ['descendant, [$directories]]]]]]],\
  ["@add-entry",\
    [["@add-entry", "* to *", "@add-entry <any:+t?arget> to <descendant of $directories>", 'add_entry_cmd, #[[1, ['any_opt, ["t?arget"]]], [3, ['descendant, [$directories]]]]]]],\
  ["@del-entry",\
    [["@del-entry", "* from *", "@del-entry <any> from <descendant of $directories>", 'del_entry_cmd, #[[1, ['any, []]], [3, ['descendant, [$directories]]]]]]]];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $root created_on = 887523264;
var $root credit = ["Bruce Mitchener, Jr <bruce@puremagic.com>"];
var $root flags = ['variables, 'methods, 'code, 'core, 'general_cache];
var $root inited = 1;
var $root managed = [$httpd_ui];
var $root manager = $httpd_ui;

public method .add_entry_cmd() {
    arg cmd, cmdstr, @args;
    var name, opt, prep, directory, target;
    
    [[[name], [opt]], prep, directory] = args;
    if ((opt.length()) != 4)
        return "You must specify the target object via +target.";
    target = opt[4];
    if (!(target = (| $object_lib.to_dbref(target) |)))
        return "The target must be a valid object.";
    if (!(target.is($page)))
        return "The target must be a descendant of $page.";
    directory.add_entry(name, target);
    return;
};

public method .del_entry_cmd() {
    arg cmd, cmdstr, @args;
    var name, prep, directory;
    
    [name, prep, directory] = args;
    catch ~keynf {
        directory.del_entry(name);
        sender().tell(((("Entry, '" + name) + "', removed from ") + directory) + ".");
    } with {
        sender().tell(((("Entry, '" + name) + "', was not an entry on ") + directory) + ".");
    }
    return;
};

public method .list_entries_cmd() {
    arg cmd, cmdstr, prep, directory;
    var output, x;
    
    output = map x in (directory.entries()) to ($cml_lib.format_tr_tag($cml_lib.format_td_tag(x[1]), $cml_lib.format_td_tag(x[2])));
    return $ctext_frob.new_with([("Directory entries for " + directory) + ":", $cml_lib.format_table_tag("25%,75%", @output), $cml_lib.format_sep_tag()]);
};


