
new object $connection_interface: $network, $frob, $command_cache;

var $command_cache commands = 0;
var $command_cache shortcuts = 0;
var $connection_interface connection = 0;
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $root created_on = 809051864;
var $root flags = ['methods, 'code, 'core, 'variables];
var $root inited = 1;
var $root managed = [$connection_interface];
var $root manager = $connection_interface;
var $root quota_exempt = 1;

public method .close() {
    (> .perms(sender()) <);
    (> $sys.destroy_sender() <);
};

public method .connection() {
    return connection;
};

public method .connection_going_away() {
    arg @args;
    
    (> .close() <);
};

public method .connection_starting() {
    arg addr, port;
    
};

public method .daemon_shutdown() {
    var i;
    
    (> .perms(caller(), $connection) <);
    for i in (.children())
        (> i.close() <);
};

public method .invalid_cmd() {
    arg @args;
    
    return 'disconnect;
};

public method .linelen() {
    arg @args;
    
    return 79;
};

public method .log_traceback() {
    arg @args;
    
    return $sys.log_traceback(@args);
};

public method .new() {
    arg c;
    var i;
    
    (> .perms(caller(), $connection) <);
    i = .spawn();
    i.set_connection(c);
    return i;
};

public method .new_connection() {
    arg this, host, port;
    
};

public method .null_cmd() {
    arg @args;
    
    return 'disconnect;
};

public method .parse_line() {
    arg line;
    var cmd, c, match, parsed, i, m, a, u;
    
    catch any {
        line = line.trim();
        if (!line) {
            return .null_cmd(line);
        } else {
            cmd = line.explode();
            cmd = [line, cmd[1], ((cmd.subrange(2)).join()) || ""];
            c = (| .match_in_local_cache(@cmd) |);
            if (c && ((c[1]) == 'local)) {
                // screw duplicates, take the first match
                match = (c[2])[1];
                m = match[2];
                i = match[5];
                parsed = i.keys();
                for a in [1 .. m.length()] {
                    if (a in parsed)
                        m = m.replace(a + 2, (> $command_lib.convert_arg((i[a])[1], m[a + 2], $no_one, ((i[a])[2]) ? (((i[a])[2])[1]) : $no_one, $no_one) <));
                }
                return (> .(match[4])(@m) <);
            }
            return (> .invalid_cmd(line) <);
        }
    } with {
        if (((traceback()[1])[3]) != 'no_traceback) {
            (this['connection]).write($parse_lib.traceback(traceback()));
            return 'disconnect;
        }
    }
};

public method .send() {
    arg @args;
    
    return (> .write(@args) <);
};

public method .set_connection() {
    arg c;
    
    if (caller() != definer())
        (> .perms(sender()) <);
    connection = c;
};

public method .tell() {
    arg @args;
    
    (> .write(@args) <);
};

public method .write() {
    arg what;
    
    return connection.write(what);
};


