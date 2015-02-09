
new object $dns: $network;

var $dmi_data descriptions = #[];
var $dns async = 0;
var $dns connection = 0;
var $dns dnshost = ["127.0.0.1", 1153];
var $dns started = 0;
var $dns starting = 0;
var $dns valid_host_regexp = "^([-a-z0-9]+\.)+(gov|edu|com|org|int|mil|net|nato|arpa|[a-z][a-z])$";
var $dns valid_ip_regexp = "([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)";
var $root created_on = 867779129;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$dns];
var $root manager = $dns;
var $root trusted_by = [$outbound_connection];

public method .connection_going_away() {
    arg host, port;
    
    if (sender() != connection)
        return;
    started = 0;
    if (!starting)
        .restart();
};

public method .connection_starting() {
    arg host, port;
    
};

public method .core_dns() {
    async = 0;
    connection = 0;
    starting = 0;
    started = 0;
};

public method .hostname() {
    arg ip;
    var c, line, result;
    
    if (!ip)
        return pass();
    if (!match_regexp(ip, valid_ip_regexp))
        throw(~invip, "Invalid IP Address: " + ip);
    if (!async)
        return pass(ip);
    if (!valid(connection)) {
        if (!(.restart()))
            return pass(ip);
    }
    connection = connection.write((task_id() + ":N:") + ip);
    result = $scheduler.suspend(this());
    if ((type(result) != 'list) || (listlen(result) != 2))
        return "";
    switch (result[1]) {
        case "N":
            throw(~address, result[2]);
        case "F":
            throw(~failed, result[2]);
        case "G":
            return result[2];
        default:
            $sys.log("DNS ERROR: Invalid result: " + (result.join(":")));
    }
};

public method .ip() {
    arg hostname;
    var c, line, result;
    
    if (!hostname)
        return pass();
    if ((hostname != "localhost") && (!match_regexp(hostname, valid_host_regexp)))
        throw(~address, ("Invalid Internet Address: \"" + hostname) + "\"");
    if (!async)
        return pass(hostname);
    if (!valid(connection)) {
        if (!(.restart()))
            return pass(hostname);
    }
    connection = connection.write((task_id() + ":R:") + hostname);
    result = $scheduler.suspend(this());
    if ((type(result) != 'list) || (listlen(result) != 2))
        return "";
    switch (result[1]) {
        case "N":
            throw(~address, result[2]);
        case "F":
            throw(~failed, result[2]);
        case "G":
            return result[2];
        default:
            $sys.log("DNS ERROR: Invalid result: " + (result.join(":")));
    }
};

public method .parse_line() {
    arg line;
    var m, task, code, info;
    
    (> .perms(caller(), $connection) <);
    if ((m = regexp(line, "^([0-9]+):([a-z]):(.*)$"))) {
        [task, code, info] = m;
        task = toint(task);
        catch any {
            $scheduler.resume(task, [code, info]);
        } with {
            $sys.log("DNS ERROR: ");
            $sys.log($parse_lib.traceback(traceback()));
        }
    } else {
        $sys.log("DNS ERROR: Invalid Result from server: " + line);
    }
};

public method .restart() {
    if (starting || (!started))
        return 0;
    connection = 0;
    catch any {
        (> .startup_dns() <);
        $sys.log("** Restarting async DNS lookups at " + (dnshost.join(":")));
    } with {
        $sys.log("** Unable to restart async DNS lookups because:");
        $sys.log("** => " + ((traceback()[1])[2]));
    }
    return valid(connection);
};

public method .shutdown() {
    arg @args;
    var c;
    
    (sender() != this()) && (> .perms(caller(), 'system) <);
    c = connection;
    connection = 0;
    (| c.close() |);
    started = 0;
};

public method .startup(): forked  {
    arg @args;
    
    (> .perms(sender(), 'system) <);
    .shutdown();
    if (!async)
        return;
    catch any {
        (> .startup_dns() <);
        $sys.log("** Starting async DNS lookups at " + (dnshost.join(":")));
    } with {
        $sys.log("** Unable to startup async DNS lookups because:");
        $sys.log("** => " + ((traceback()[1])[2]));
    }
};

protected method .startup_dns() {
    var id, tmp, x;
    
    if (starting)
        return;
    started = 0;
    starting = 1;
    if (connection)
        (| connection.close() |);
    id = tosym("dns_connection");
    while ((| lookup(id) |))
        id = tosym("dns_connection_" + ++x);
    connection = $outbound_connection.new_with(id);
    if ((| connection.open_connection(@dnshost) |)) {
        starting = 0;
        started = 1;
        return;
    }
    
    // try to exec() it, then startup again
    (| $sys.startup_dnsserv() |);
    $scheduler.sleep(1);
    catch any {
        connection.open_connection(@dnshost);
        starting = 0;
    } with {
        (| connection.close() |);
        connection = 0;
        starting = 0;
        if (error() == ~refused)
            throw(~refused, "Unable to open connection to " + (dnshost.join(":")));
        else
            rethrow(error());
    }
    started = 1;
};

public method .valid_host_regexp() {
    return valid_host_regexp;
};

public method .valid_hostname() {
    arg host;
    
    return match_regexp(host, valid_host_regexp) ? 1 : 0;
};

public method .valid_ip() {
    arg ip;
    
    return match_regexp(ip, valid_ip_regexp) ? 1 : 0;
};

public method .valid_ip_regexp() {
    return valid_ip_regexp;
};


