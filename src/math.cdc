
new object $math: $libraries;

var $math origin_2d = [0.0, 0.0];
var $math origin_3d = [0.0, 0.0, 0.0];
var $math pi = 3.14159;
var $math pi2 = 6.28318;
var $math transmat_2d = [[1.0, 0.0, 0.0], [0.0, 1.0, 0.0]];
var $math transmat_3d = [[1.0, 0.0, 0.0, 0.0], [0.0, 1.0, 0.0, 0.0], [0.0, 0.0, 1.0, 0.0]];
var $root created_on = 845760297;
var $root credit = ["Miroslav Silovic <silovic@zesoi.fer.hr>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root help_node = $help_obj_math;
var $root inited = 1;
var $root managed = [$math];
var $root manager = $math;

public method .add(): native;

public method .cross(): native;

public method .cylindrical_rectangular() {
    arg coords;
    
    return [(coords[1]) * cos(coords[2]), (coords[1]) * sin(coords[2]), coords[3]];
};

public method .deg_rad() {
    arg angle;
    
    return angle / 57.2958;
};

public method .distance(): native;

public method .dot(): native;

public method .ident_mat() {
    arg n;
    var x, y;
    
    return map x in [1 .. n] to (map y in [1 .. n] to ((x == y) ? 1.0 : 0.0));
};

public method .is_lower(): native;

public method .major(): native;

public method .matrix_add() {
    arg m1, m2;
    var i;
    
    return map i in [1 .. m1.length()] to (.add(m1[i], m2[i]));
};

public method .matrix_mul() {
    arg m1, m2;
    var x, y;
    
    m2 = .transpose(m2);
    return map x in (m1) to (map y in (m2) to (.dot(x, y)));
};

public method .matrix_scale() {
    arg s, m;
    var x;
    
    return map x in (m) to (.scale(s, x));
};

public method .matrix_sub() {
    arg m1, m2;
    var i;
    
    return map i in [1 .. m2.length()] to (.sub(m1[i], m2[i]));
};

public method .minor(): native;

public method .pi() {
    return pi;
};

public method .pi2() {
    return pi2;
};

public method .polar_rectangular() {
    arg coords;
    
    return [(coords[1]) * cos(coords[2]), (coords[1]) * sin(coords[2])];
};

public method .rad_deg() {
    arg angle;
    
    return angle * 57.2958;
};

public method .rectangular_cylindrical() {
    arg coords;
    var a;
    
    a = atan2(coords[2], coords[1]);
    if (a < 0)
        a += pi2;
    return [.distance(coords.subrange(1, 2), origin_2d), a, coords[3]];
};

public method .rectangular_polar() {
    arg coords;
    var a;
    
    a = atan2(coords[2], coords[1]);
    if (a < 0)
        a += pi2;
    return [.distance(coords, origin_2d), a];
};

public method .rectangular_spherical() {
    arg coords;
    var a, d;
    
    a = atan2(coords[2], coords[1]);
    if (a < 0)
        a += pi2;
    return [(d = .distance(coords, origin_3d)), a, atan2(coords[3], .distance(coords.subrange(1, 2), origin_2d))];
};

public method .rotation_mat_2d() {
    arg angle;
    var s, c;
    
    s = sin(angle);
    c = cos(angle);
    return [[c, s, 0.0], [-s, c, 0.0], [0.0, 0.0, 1.0]];
};

public method .rotation_mat_3d() {
    arg axis, angle;
    var s, c, m, tens;
    
    s = sin(angle);
    c = cos(angle);
    if (type(axis) == 'list) {
        axis = .scale(1.0 / (.distance(axis, origin_3d)), axis);
        tens = .tensor(axis, axis);
        m = .matrix_add(tens, .matrix_add(.matrix_scale(s, .skew(axis)), .matrix_scale(c, .matrix_sub(.ident_mat(3), tens))));
        return [[@m[1], 0.0], [@m[2], 0.0], [@m[3], 0.0], [0.0, 0.0, 0.0, 1.0]];
    } else {
        switch (axis) {
            case 'z:
                return [[c, s, 0.0, 0.0], [-s, c, 0.0, 0.0], [0.0, 0.0, 1.0, 0.0], [0.0, 0.0, 0.0, 1.0]];
            case 'y:
                return [[c, 0.0, -s, 0.0], [0.0, 1.0, 0.0, 0.0], [s, 0.0, c, 0.0], [0.0, 0.0, 0.0, 1.0]];
            case 'x:
                return [[1.0, 0.0, 0.0, 0.0], [0.0, c, s, 0.0], [0.0, -s, c, 0.0], [0.0, 0.0, 0.0, 1.0]];
        }
    }
};

public method .runge() {
    arg x, y, h, f, data;
    var k1, k2, k3, k4, s;
    
    // returns the next timestep for differential equation y'=f(x,y,data)
    s = sender();
    k1 = s.f(x, y, data);
    k2 = s.f(x + (0.5 * h), .add(y, .scale(0.5 * h, k1)), data);
    k3 = s.f(x + (0.5 * h), .add(y, .scale(0.5 * h, k2)), data);
    k4 = s.f(x + h, .add(y, .scale(h, k3)), data);
    return .add(y, .scale(h / 6.0, .add(.add(k1, .scale(2.0, .add(k2, k3))), k4)));
};

public method .scale(): native;

public method .scale_mat() {
    arg scale;
    
    if ((scale.length()) == 2)
        return [[scale[1], 0.0, 0.0], [0, scale[2], 0.0], [0.0, 0.0, 1.0]];
    else
        return [[scale[1], 0.0, 0.0, 0.0], [0.0, scale[2], 0.0, 0.0], [0.0, 0.0, scale[3], 0.0], [0.0, 0.0, 0.0, 1]];
};

public method .skew() {
    arg v;
    
    return [[0.0, v[3], -(v[2])], [-(v[3]), 0.0, v[1]], [v[2], -(v[1]), 0.0]];
};

public method .spherical_rectangular() {
    arg coords;
    var r, phi, theta, r1;
    
    r = coords[1];
    phi = coords[2];
    theta = coords[3];
    r1 = r * cos(theta);
    return [r1 * cos(phi), r1 * sin(phi), r * sin(theta)];
};

public method .sub(): native;

public method .tensor() {
    arg v1, v2;
    var x, y;
    
    return map x in (v1) to (map y in (v2) to (x * y));
};

public method .transform_vect() {
    arg m, v;
    var x, outvect, flag;
    
    if ((m.length()) == ((v.length()) + 1)) {
        v += [1.0];
        flag = 1;
    }
    outvect = map x in (m) to (.dot(x, v));
    return flag ? (outvect.subrange(1, (outvect.length()) - 1)) : outvect;
};

public method .translation_mat() {
    arg vector;
    var x, y;
    
    if ((vector.length()) == 2)
        return transmat_2d + [vector + [1.0]];
    else
        return transmat_3d + [vector + [1.0]];
};

public method .transpose(): native;


