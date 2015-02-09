
new object $rect: $frob;

var $root created_on = 843360251;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$rect];
var $root manager = $rect;

public method .inside() {
    arg point, box;
    
    return ($math.is_lower(point, box[2])) && ($math.is_lower(box[1], point));
};

public method .intersection() {
    arg r1, r2;
    
    // Doesn't check for validity
    return [$math.major(r1[1], r2[1]), $math.minor(r1[2], r2[2])];
};

public method .nondegenerate() {
    arg r1;
    
    return $math.is_lower(@r1);
};

public method .rect_size() {
    arg r1;
    var i, s;
    
    s = 0.0;
    for i in ($math.sub(@r1))
        s += i;
    return -s;
};

public method .union() {
    arg r1, r2;
    
    return [$math.minor(r1[1], r2[1]), $math.major(r1[2], r2[2])];
};


