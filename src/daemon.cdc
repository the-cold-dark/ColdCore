
new object $daemon: $network;

var $daemon connection = 0;
var $daemon current_port = 0;
var $daemon current_ports = 0;
var $daemon listen = 0;
var $daemon next_connection = 0;
var $root created_on = 809051864;
var $root defined_settings = #[["connection", #[['get, ['get_connection]], ['set, ['set_connection]], ['parse, ['parse_connection_setting]]]], ["listen", #[['get, ['get_listen]], ['set, ['set_listen]], ['parse, ['parse_listen]], ['format, ['format_listen]]]]];
var $root flags = ['methods, 'code, 'core, 'variables];
var $root inited = 1;
var $root managed = [$daemon];
var $root manager = $daemon;

driver method .connect() {
    arg remote, local, socket;
    var conn;
    
    if ($sys.host_denied(remote)) {
        close_connection();
        return;
    }
    if (!valid(next_connection))
        next_connection = connection.new_connection();
    conn = next_connection;
    reassign_connection(conn);
    next_connection = connection.new_connection();
    conn.start(remote, local, socket, (current_ports[1])[1]);
};

root method .core_daemon() {
    .stop_listening();
    if (this() != definer())
        .set_setting("listen", $daemon, tostr(((.get_setting("listen", $daemon))[1])[1]));
};

public method .current_port() {
    return (current_ports[1])[1];
};

public method .current_ports() {
    return current_ports;
};

public method .format_listen() {
    arg value, @noresolv;
    var p, out;
    
    out = [];
    for p in (value) {
        if (listlen(p) > 1)
            out += [((noresolv ? (p[2]) : ($dns.hostname(p[2]))) + ":") + (p[1])];
        else
            out += [p[1]];
    }
    return out.join(", ");
};

protected method .get_connection() {
    arg @args;
    
    return connection;
};

public method .get_listen() {
    arg @args;
    
    return listen || [];
};

public method .parse_connection_setting() {
    arg value, @args;
    var obj;
    
    obj = (> $object_lib.to_dbref(value) <);
    if (!(obj.is($connection)))
        throw(~perm, "Connection object must be descended from $connection.");
    return obj;
};

public method .parse_listen() {
    arg value, @args;
    var out, p, m, port, ip;
    
    if (!value)
        throw(~parse, "Invalid listen setting, must be a list of ports or host:ports.");
    out = map p in (value.explode_english_list()) to ((> .parse_port(p) <));
    if (!out)
        throw(~parse, "Invalid listen setting, must be a list of ports or host:ports.");
    return out;
};

public method .parse_port() {
    arg str;
    var m, host, port, ip;
    
    if ((m = str.regexp("^([^:]+):(.*)$"))) {
        [host, port] = m;
        host = host.trim();
        port = port.trim();
        if (host) {
            ip = $dns.ip(host);
            if (ip == "-1")
                throw(~parse, "Unable to resolv hostname: " + host);
            host = ip;
        }
    } else {
        port = str;
        host = "";
    }
    if (!(port.is_numeric()))
        throw(~parse, "Invalid port: " + port);
    port = toint(port);
    if ((port <= 0) || (port > 65535))
        throw(~parse, ("Invalid port " + port) + " (out of range, must be 0 .. 65535)");
    if (host)
        return [port, host];
    else
        return [port];
};

protected method .set_connection() {
    arg name, definer, value, @args;
    
    connection = value;
};

protected method .set_listen() {
    arg name, definer, value;
    
    listen = value;
};

public method .shutdown() {
    arg @args;
    
    (> .perms(caller(), $sys) <);
    (> .stop_listening() <);
};

public method .start_listening() {
    arg @ports;
    var p, last, l;
    
    (> .perms(sender()) <);
    (| .stop_listening() |);
    ports ?= listen;
    current_ports = [];
    for p in (ports) {
        catch any {
            last = p;
            bind_port(@p);
            current_ports += [p];
            $sys.slog((("** Starting " + this()) + " on ") + (.format_listen([p], 1)));
        } with {
            p = (p.reverse()).join(":");
            $sys.slog((("** Unable to bind " + this()) + " to ") + p);
            if (error() != ~bind)
                $sys.log_traceback(traceback(), (("LISTEN: " + this()) + " ") + p);
        }
    }
    if (!current_ports)
        throw(~daemon, ("** " + this()) + " NOT LISTENING **");
    next_connection = connection.new_connection();
};

public method .startup(): forked  {
    arg @args;
    var match, port, rx, str, o, ports, msg;
    
    (> .perms(caller(), 'system) <);
    rx = tostr(.objname());
    rx = ("-(p)" + substr(rx, 1, ("_" in rx) - 1)) + "=(.*)";
    if (find str in (args) where ((match = regexp(str, rx)))) {
        [o, ports] = match;
        ports = .parse_port(ports);
        if (strcmp(o, "p") == 0)
            ports = listen + [ports];
    } else {
        ports = listen;
    }
    (> .start_listening(@ports) <);
};

public method .stop_listening() {
    var p;
    
    (> .perms(sender()) <);
    if (valid(connection))
        (> connection.daemon_shutdown() <);
    (| clear_var('next_connection) |);
    for p in (current_ports || [])
        (| unbind_port(p[1]) |);
    (| clear_var('current_ports) |);
};


