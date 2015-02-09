
new object $file: $utilities;

var $root created_on = 843324817;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$file];
var $root manager = $file;
var $root trusted = [$mime_lib];

public method .close() {
    // add in locks... $mutex?
    return (> .fclose() <);
};

public method .fchmod() {
    arg @args;
    
    return fchmod(@args);
};

public method .fclose() {
    return fclose();
};

public method .feof() {
    arg @args;
    
    return feof(@args);
};

public method .fflush() {
    arg @args;
    
    return fflush(@args);
};

public method .files() {
    arg path;
    
    return (> files(path) <);
};

public method .fmkdir() {
    arg @args;
    
    return fmkdir(@args);
};

public method .fopen() {
    arg @args;
    
    return (> fopen(@args) <);
};

public method .fread() {
    arg @args;
    
    return (> fread(@args) <);
};

public method .fremove() {
    arg @args;
    
    return fremove(@args);
};

public method .frename() {
    arg @args;
    
    return frename(@args);
};

public method .frmdir() {
    arg @args;
    
    return frmdir(@args);
};

public method .fseek() {
    arg @args;
    
    return fseek(@args);
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

public method .open() {
    arg @args;
    
    // add in locks... $mutex?
    return (> .fopen(@args) <);
};


