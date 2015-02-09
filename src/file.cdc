
new object $file: $utilities;

var $root created_on = 843324817;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$file];
var $root manager = $file;
var $root trusted = [$mime_lib];

public method .fclose() {
    return fclose();
};

public method .files() {
    arg path;
    
    return (> files(path) <);
};

public method .fopen() {
    arg @args;
    
    return fopen(@args);
};

public method .fstat() {
    arg @path;
    
    if (!path)
        throw(~perm, "Perm.");
    return (> fstat(@path) <);
};

public method .fwrite() {
    arg what;
    
    return fwrite(what);
};


