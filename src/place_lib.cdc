
new object $place_lib: $libraries;

var $place_lib build_hints = #[[1, <$ctext_frob, [["This is the do-it-all system for building places. At any time you can enter \"@abort\" to abort building. To turn off these hints \"@set experienced\" in your regular command environment.", <$format, ["hr", [], [], 'do_hr]>], #[['this, $place_lib]]]>], [2, <$ctext_frob, [["The specified destination does not exist, therefore a new one will be created with the name you specified.", <$format, ["hr", [], [], 'do_hr]>], #[['this, $place_lib]]]>], [3, <$ctext_frob, [["Name aliases can be specified on the same line as the name. This is done by separating them from the name with commas. Any number of aliases can be specified in this manner (such as \"Name, alias, alias, alias\"). Names types can be defined by appending ", <$format, ["tt", [], ["+type"], 'do_tt]>, ", where ", <$format, ["tt", [], ["type"], 'do_tt]>, " is one of ", <$format, ["tt", [], ["proper"], 'do_tt]>, ", ", <$format, ["tt", [], ["unique"], 'do_tt]>, " or ", <$format, ["tt", [], ["normal"], 'do_tt]>, ". Not specifying a type defaults to ", <$format, ["tt", [], ["normal"], 'do_tt]>, ".", <$format, ["hr", [], [], 'do_hr]>], #[['this, $place_lib]]]>], [4, <$ctext_frob, [["Realms are used to keep locations in relation with each other. To get a list of commonly known realms type ", <$format, ["tt", [], ["@realms"], 'do_tt]>, ".", <$format, ["hr", [], [], 'do_hr]>], #[['this, $place_lib]]]>], [5, <$ctext_frob, [["Coordinates are used to define a basic relation between locations by pointing in the direction each place is. They use the radial/azimuth system. More help on Coordinates can be found in help under ", <$format, ["tt", [], ["places"], 'do_tt]>, ". For now it may be easier to use a coordinate shortcut (such as ", <$format, ["tt", [], ["up"], 'do_tt]>, "). To get a list of coordinate shortcuts type ", <$format, ["tt", [], ["@shortcuts"], 'do_tt]>, " now. Note: coordinates are automatically inverted for return exits (so if you specify ", <$format, ["tt", [], ["down"], 'do_tt]>, " the return exit will use the coordinates of ", <$format, ["tt", [], ["up"], 'do_tt]>, ").", <$format, ["hr", [], [], 'do_hr]>], #[['this, $place_lib]]]>]];
var $place_lib coordinate_shortcuts = #[["n?orth", [0, 0]], ["s?outh", [180, 0]], ["e?ast", [90, 0]], ["w?est", [270, 0]], ["ne|northeast", [45, 0]], ["se|southeast", [135, 0]], ["nw|northwest", [225, 0]], ["sw|southwest", [315, 0]], ["d?own", [-1, -90]], ["u?p", [-1, 90]]];
var $place_lib default_distance = 250;
var $place_lib default_exit = $path;
var $place_lib default_path = $path;
var $place_lib default_place = $place;
var $place_lib known_realms = [$realm_of_creation];
var $place_lib opposite_directions = #[["n?orth", 2], ["s?outh", 1], ["e?ast", 4], ["w?est", 3], ["northeast|ne", 7], ["southeast|se", 8], ["southwest|sw", 5], ["northwest|nw", 6], ["up", 10], ["d?own", 9]];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$place_lib];
var $root manager = $place_lib;

public method .add_build_hint() {
    arg hint_key, hint_text;
    
    (> .perms(sender()) <);
    build_hints = build_hints.add(hint_key, hint_text);
};

public method .add_known_realm() {
    arg obj;
    
    (> .perms(sender()) <);
    known_realms += [obj];
};

public method .bfs() {
    arg source, dest;
    var e, p, q, r, s, v;
    
    if (source == dest)
        return [];
    q = [[source, []]];
    v = [];
    while ((q.length()) > 0) {
        p = q[1];
        q = q.delete(1);
        r = p[1];
        v = v + [r];
        for e in ((| r.visible_exits() |) || []) {
            s = e.dest(r);
            if (s in v)
                continue;
            if (s == dest)
                return (p[2]) + [e];
            q = q + [[s, (p[2]) + [e]]];
            refresh();
        }
    }
    throw(~noway, "I can't find a route.");
};

public method .build_hint() {
    arg hint;
    
    return build_hints[hint];
};

public method .build_hints() {
    return build_hints;
};

public method .coordinate_shortcuts() {
    return coordinate_shortcuts;
};

public method .coordinates() {
    arg str;
    var x;
    
    for x in (coordinate_shortcuts) {
        if (str.match_template(x[1]))
            return x[2];
    }
    throw(~coordnf, ("Unable to find coordinate shortcut for \"" + str) + "\".");
};

public method .del_build_hint() {
    arg hint_key;
    
    (> .perms(sender()) <);
    build_hints = build_hints.add(hint_key);
};

public method .del_known_realm() {
    arg obj;
    
    (> .perms(sender()) <);
    known_realms = known_realms.setremove(obj);
};

public method .find_invalid() {
    var l, o, r;
    
    r = [];
    for l in ($location.descendants()) {
        for o in (l.contents()) {
            if ((type(o) == 'objnum) && (!valid(o)))
                r = r + [[l, o]];
        }
    }
    return r;
};

public method .get_default() {
    arg what;
    
    what = tosym("default_" + what);
    return (> get_var(what) <);
};

public method .invert_coordinates() {
    arg radial, azimuth;
    
    radial += 180;
    if (radial > 360)
        radial = radial - 360;
    if (azimuth > 0)
        azimuth = -azimuth;
    else
        azimuth = abs(azimuth);
    return [radial, azimuth];
};

public method .is_place() {
    arg obj;
    
    if (!(obj.has_ancestor($place)))
        throw(~place, ("Object \"" + (obj.namef('ref))) + "\" is not a place.");
};

public method .known_realms() {
    return known_realms;
};

public method .makemap() {
    arg source, @args;
    var dest, e, visited, indent, retval;
    
    visited = (| (args[1]) + [source] |) || [source];
    indent = (| args[2] |) || 0;
    retval = [];
    for e in ((| source.visible_exits() |) || []) {
        dest = e.dest(source);
        retval = retval + [(((("| " * max(0, indent - 1)) + ("+-" * (indent > 0))) + (e.path_name(source))) + " to ") + (dest.namef('ref))];
        if (!(dest in visited)) {
            retval = retval + (.makemap(dest, visited, indent + 1));
            visited = visited + [dest];
        }
        refresh();
    }
    return retval;
};

public method .match_realm() {
    arg str;
    var r;
    
    for r in ($realm.descendants()) {
        if (r.match_name(str))
            return r;
    }
    return (| $object_lib.to_dbref(str) |) || 0;
};

public method .opposite_direction() {
    arg dir;
    var key, od;
    
    od = opposite_directions;
    for key in (od.keys()) {
        if (match_template(dir, key))
            return (od.keys())[od[key]];
    }
    return 0;
};

public method .region() {
    arg source;
    var e, p, q, s, v, visited;
    
    visited = #[];
    q = [source];
    v = [];
    while ((q.length()) > 0) {
        p = q[1];
        q = q.delete(1);
        v = v + [p];
        visited = visited.add(p, 1);
        for e in ((| p.visible_exits() |) || []) {
            s = e.dest(p);
            if (visited.contains(s))
                continue;
            q = q + [s];
            refresh();
        }
    }
    return v;
};

public method .regions() {
    var e, p, q, s, v, regions, source, visited;
    
    regions = [];
    visited = #[];
    for source in ($place.children()) {
        if (visited.contains(source))
            continue;
        q = [source];
        v = [];
        while ((q.length()) > 0) {
            p = q[1];
            q = q.delete(1);
            v = v + [p];
            visited = visited.add(p, 1);
            for e in ((| p.visible_exits() |) || []) {
                s = e.dest(p);
                if (visited.contains(s))
                    continue;
                q = q + [s];
                refresh();
            }
        }
        regions = regions + [v];
    }
    return regions;
};

public method .set_default() {
    arg what, value;
    
    (> .perms(sender()) <);
    what = tosym("default_" + what);
    return (> get_var(what, value) <);
};

public method .valid_coordinates() {
    arg radial, azimuth;
    
    if ((radial > 360) || (radial < (-1)))
        throw(~invcoord, "Radial coordinate must be from -1 to 360 degrees.");
    if ((azimuth > 90) || (azimuth < (-90)))
        throw(~invcoord, "Azimuth coordinate must be from 90 to -90 degrees.");
};


