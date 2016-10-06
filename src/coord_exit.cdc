
new object $coord_exit: $exit;

var $coord_exit coordinates = 0;
var $described prose = [];
var $exit dest = $nowhere;
var $exit lock = <$true_lock_frob, []>;
var $exit source = $nowhere;
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $root created_on = 848977724;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$coord_exit];
var $root manager = $coord_exit;

public method .configure() {
    arg set;
    var s, radial, azimuth, distance, ans, c, dist, m;
    
    set = (> pass(set) <);
    if (set.contains('exit_coordinates))
        return set;
    s = sender();
    if (!(| s.get_setting("experienced", $user) |))
        s.tell($place_lib.build_hint(5));
    while (1) {
        ans = (> s.prompt(((("Exit coordinates for " + (.name())) + " (to ") + ((.dest()).name())) + ") ") <);
        if (ans == "@skip")
            return set;
        if (ans == "@shortcuts") {
            s.tell(["-- Coordinate Shortcuts:", map c in ($place_lib.coordinate_shortcuts()) to (strfmt(" %20l %7l %s", c[1], @c[2]))]);
            continue;
        }
        if (!ans) {
            s.tell("Invalid Coordinates.");
            continue;
        }
        catch ~coordnf, ~invcoord {
            if (ans.is_numeric()) {
                ans = ans.explode_english_list();
                if ((ans.length()) != 2) {
                    s.tell("Separate coordinates with a comma.");
                    continue;
                }
                if ((!((ans[1]).is_numeric())) || (!((ans[2]).is_numeric()))) {
                    s.tell("Invalid coordinates.");
                    continue;
                }
                if ((!((ans[1]).is_numeric())) || (!((ans[2]).is_numeric()))) {
                    s.tell("Invalid coordinates.");
                    continue;
                }
                radial = toint(ans[1]);
                azimuth = toint(ans[2]);
            } else {
                ans = $place_lib.coordinates(ans);
                radial = ans[1];
                azimuth = ans[2];
            }
            (> $place_lib.valid_coordinates(radial, azimuth) <);
        } with {
            s.tell((traceback()[1])[2]);
            continue;
        }
    }
    while (!dist) {
        ans = (> s.prompt(("Distance from center of room (metric) [" + ($place_lib.get_default('distance))) + "] ") <);
        if (!ans)
            dist = $place_lib.get_default('distance);
        else if (ans == "@skip")
            return set;
        else if ((m = match_regexp(ans, "^ *([0-9]+) *M *$")))
            dist = toint(m[1]) * 100;
        else if ((m = match_regexp(ans, "^ *([0-9]+) *C?M? *$")))
            dist = toint(m[1]);
        else
            s.tell("Distance must be either centimeters (cm) or meters (m).");
    }
    coordinates = [radial, azimuth, dist];
    return set.add('exit_coordinates);
};

public method .coordinates() {
    return coordinates || [0, 0, 0];
};

public method .uninit_coord_exit() {
    (| clear_var('coordinates) |);
};


