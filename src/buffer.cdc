
new object $buffer: $libraries;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$buffer];
var $root manager = $buffer;
var $root trusted = [];

public method .break_lines() {
    arg buf;
    var i, sub, out;
    
    // break a buffer by \r or \n but keep its sub contents as buffers
    out = [];
    while ((i = 10 in buf)) {
        sub = subbuf(buf, 1, i - 1);
        buf = subbuf(buf, i + 1);
        while ((i = 13 in sub)) {
            if (buflen(sub) == i)
                sub = subbuf(sub, 1, i - 1);
            else
                sub = subbuf(sub, 1, i - 1) + subbuf(sub, i + 1);
        }
        out += [sub];
    }
    if (buf) {
        while ((i = 13 in buf)) {
            if (buflen(buf) == i)
                buf = subbuf(buf, 1, i - 1);
            else
                buf = subbuf(buf, 1, i - 1) + subbuf(buf, i + 1);
        }
        if (buf)
            out += [buf];
    }
    return out;
};

public method .from_list() {
    arg list;
    var buf, i;
    
    // this differs from $list.to_buffer()
    buf = `[];
    for i in (list)
        buf += `[i];
    return buf;
};

public method .from_string(): native;

public method .from_strings(): native;

public method .length(): native;

public method .replace(): native;

public method .subrange(): native;

public method .to_list() {
    arg buf;
    var i, list;
    
    return map i in [1 .. buflen(buf)] to (buf[i]);
};

public method .to_string(): native;

public method .to_strings(): native;

public method .bufsub(): native;
