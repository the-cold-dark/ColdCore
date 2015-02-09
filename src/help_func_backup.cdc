
new object $help_func_backup: $help_funcs_sys;

var $has_name name = ['prop, "backup()", "backup()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["INTEGER"], 'do_i]>, " backup()"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "This function synchronizes the running database to disk and starts an asyncrynous backup (Genesis copies the files to the file ", <$format, ["i", [], ["binary"], 'do_i]>, ".bak, where ", <$format, ["i", [], ["binary"], 'do_i]>, " is the binary database directory name specified upon bootup). This function executes atomically, and a slight pause may be noticed while it synchronizes the object cache to disk and copies the index files. ", <$format, ["np", [], [], 'do_np]>, "The return value of ", <$format, ["tt", [], ["backup()"], 'do_tt]>, " is always ", <$format, ["tt", [], ["1"], 'do_tt]>, ", and should be ignored. If a backup is in progress the error ", <$format, ["tt", [], ["~perm"], 'do_tt]>, " is thrown. The error ", <$format, ["tt", [], ["~file"], 'do_tt]>, " is thrown if there are file or directory problems. When the asyncrynous backup is finished the driver calls ", <$format, ["tt", [], ["$sys.backup_done()"], 'do_tt]>, "."], #[]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_backup];
var $root manager = $help_func_backup;


