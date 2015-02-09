
new object $changelog: $file;

var $dmi_data descriptions = #[];
var $root created_on = 906983169;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$changelog];
var $root manager = $changelog;

public method .log() {
    arg entry;
    
    if (!($changelog_group.includes(caller())))
        (> .perms(sender()) <);
    
    // just silently die if logs/ isn't there
    catch any {
        .fopen("logs/changelog", ">>");
        .fwrite((("[" + time()) + "] ") + entry);
        .fclose();
    }
};


