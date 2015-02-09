
new object $help_func_fread: $help_funcs_file;

var $has_name name = ['prop, "fread()", "fread()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["STRING|BUFFER"], 'do_i]>, " fread([", <$format, ["i", [], ["INTEGER block"], 'do_i]>, "])"], 'do_tt]>], 'do_dfn]>, <$format, ["p", [], [], 'do_p]>, "Read from the existing file bound to this object. If the file is a binary file, a buffer is returned. If the file is a text file (default), a string is returned. If the file is at the end, the ", <$format, ["tt", [], ["~eof"], 'do_tt]>, " error is thrown. With binary files an optional block size may be specified. The default block size is 512 characters. Example: ", <$format, ["dfn", [], [<$format, ["quote", [], ["\n        catch ~eof {\n            while (1) {\n                line = fread();\n                .tell(line);\n            }\n        }\n"], 'do_quote]>], 'do_dfn]>], #[]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384456;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_func_fread];
var $root manager = $help_func_fread;


