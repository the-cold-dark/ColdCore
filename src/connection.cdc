
new object $connection: $network;

var $connection active = 0;
var $connection buffer = `[];
var $connection daemon = 0;
var $connection debugees = 0;
var $connection foreign_addr = 0;
var $connection host = "";
var $connection interface = 0;
var $connection line_buffer = 0;
var $connection local_addr = 0;
var $connection local_port = 0;
var $connection port = 0;
var $connection read_block = [];
var $connection remote_addr = 0;
var $connection remote_name = 0;
var $connection remote_port = 0;
var $connection started_at = 0;
var $connection tid = 0;
var $connection timeout = 0;
var $root created_on = 809051864;
var $root defined_settings = #[["interface", #[['get, ['get_interface]], ['set, ['set_interface]], ['parse, ['parse_interface]]]]];
var $root flags = ['methods, 'code, 'core, 'variables];
var $root inited = 1;
var $root managed = [$connection];
var $root manager = $connection;

public method .abort_reading_block() {
    (> .perms(sender()) <);
    read_block = read_block.add('lines, 'aborted);
    .finish_reading_block();
};

public method .active() {
    return active;
};

public method .active_since() {
    return active;
};

public method .address() {
    arg @nolookup;
    var name;
    
    (> .perms(sender()) <);
    return remote_addr;
    if (!remote_name) {
        name = (| $dns.hostname(remote_addr) |);
        if (name)
            remote_name = name;
        else
            remote_name = remote_addr;
    }
    return remote_name;
};

public method .change_connection_interface() {
    arg old, new;
    var i;
    
    (> .perms(caller(), $connection) <);
    if (old)
        sender().del_writer((| class(old) |) || old);
    sender().add_writer((| class(new) |) || new);
};

public method .change_interface() {
    arg new;
    var old;
    
    (> .perms(sender()) <);
    (> .perms(caller(), $login_interface) <);
    if (interface) {
        old = interface;
        old.connection_going_away(.address(), remote_port);
    }
    interface = new;
    (.manager()).change_connection_interface(old, new);
    interface.connection_starting(.address(), remote_port);
};

public method .close() {
    (sender() != this()) && (> .perms(sender()) <);
    (> $sys.destroy_sender() <);
};

public method .cwritef() {
    arg fname;
    
    (> .perms(sender()) <);
    (> cwritef(fname) <);
};

public method .daemon_shutdown() {
    var c;
    
    // called by $daemon.stop_listening()
    (> .perms(caller(), $daemon) <);
    for c in (.children())
        (> c.close() <);
    (> interface.daemon_shutdown() <);
};

driver method .disconnect() {
    .close();
};

protected method .do_timeout() {
    if (!timeout)
        return;
    .write(("Timeout (" + tostr(timeout)) + ")");
    .close();
};

public method .finish_reading_block() {
    var task_id, lines;
    
    (> .perms(sender()) <);
    task_id = read_block.task_id();
    lines = read_block.lines();
    read_block = 0;
    $scheduler.resume(task_id, lines);
};

protected method .get_ident() {
    return $ident_connection.get(remote_addr, remote_port, local_port);
};

protected method .get_interface() {
    arg @args;
    
    return interface;
};

root method .init_connection() {
    buffer = `[];
    local_addr = (remote_addr = "");
    line_buffer = [];
    timeout = 300;
    tid = -1;
    
    // remove all flags
    .set_flags([]);
};

public method .interface() {
    (caller() == $daemon) || (> .perms(sender()) <);
    return interface;
};

public method .interface_going_away() {
    if ((sender() != interface) && (sender() != (| class(interface) |)))
        throw(~perm, sender() + " is not the interface.");
    interface = 0;
    (> $sys.destroy_sender() <);
};

public method .is_reading_block() {
    return read_block ? 1 : 0;
};

public method .new_connection() {
    var new, i;
    
    (> .perms(caller(), $daemon) <);
    new = .spawn();
    i = interface.new(new);
    new.add_writer(sender());
    new.add_writer(interface);
    new.add_writer((| class(i) |) || i);
    new.add_writer(this());
    new.new_interface(i);
    return new;
};

public method .new_interface() {
    arg obj;
    
    (> .perms(sender()) <);
    interface = obj;
};

protected method .open_connection() {
    arg host, port;
    
    (> open_connection(host, port) <);
};

driver method .parse() {
    arg incoming;
    var lines, line, index;
    
    lines = buf_to_strings(buffer + incoming);
    index = listlen(lines);
    buffer = lines[index];
    lines = delete(lines, index);
    line_buffer += lines;
    while (line_buffer) {
        line = line_buffer[1];
        line_buffer = delete(line_buffer, 1);
        (| .parse_line(line) |);
    }
};

public method .parse_interface() {
    arg value, @args;
    var obj;
    
    obj = (> $object_lib.to_dbref(value) <);
    return obj;
};

protected method .parse_line() {
    arg line;
    
    if (read_block) {
        read_block = read_block.parse(line);
        line = .rehash_read_status();
        if ((!line) && (line != ""))
            return;
    }
    if ((interface.parse_line(line)) == 'disconnect)
        (> .close() <);
};

private method .push_buffered(): forked  {
    var line;
    
    // called when a read() suspends the connection--to finish unbuffering i/o
    while (line_buffer) {
        line = line_buffer[1];
        line_buffer = delete(line_buffer, 1);
        (| .parse_line(line) |);
    }
};

protected method .rehash_read_status() {
    switch (read_block.status()) {
        case 'abort:
            .abort_reading_block();
        case 'not_done:
            // do nothing
        case 'done:
            .finish_reading_block();
        case 'pass_command:
            return read_block.command();
    }
    return 0;
};

protected method .set_active() {
    arg value;
    
    active = value;
};

public method .set_daemon() {
    arg obj;
    
    (> .perms(sender()) <);
    daemon = obj;
};

protected method .set_interface() {
    arg name, definer, value, @args;
    
    interface = value;
};

public method .set_remote_port() {
    arg port;
    
    (> .perms(sender()) <);
    remote_port = port;
};

public method .set_timeout() {
    arg seconds;
    
    (> .perms(sender(), interface, this()) <);
    timeout = seconds;
    if (!timeout)
        (| clear_var('timeout) |);
};

public method .start() {
    arg remote, local, rport, lport;
    
    // Make this method 'fork' from the regular thread stack
    (> .perms(caller(), $daemon) <);
    active = time();
    remote_addr = remote;
    remote_port = rport;
    local_addr = local;
    local_port = lport;
    
    //    if (timeout)
    //        $scheduler.add_task(timeout, 'do_timeout);
    interface.connection_starting(.address(), remote_port);
};

public method .start_reading_block() {
    arg count;
    
    (> .perms(sender()) <);
    read_block = $read_parser.new_with(task_id(), count);
    (| .push_buffered() |);
    return (> $scheduler.suspend(this()) <);
};

public method .timeout() {
    return timeout;
};

root method .uninit_connection() {
    (| close_connection() |);
    active = 0;
    if (interface)
        (| interface.connection_going_away(remote_addr, remote_port) |);
    interface = 0;
    if (read_block) {
        read_block = read_block.add('lines, 'disconnected);
        .finish_reading_block();
    }
    if (tid != (-1))
        $scheduler.del_task(tid);
    tid = 0;
};

public method .write() {
    arg what, @how;
    var elem, sep;
    
    sep = ('non_terminated in how) ? `[] : `[13, 10];
    switch (type(what)) {
        case 'string:
            what = strings_to_buf([what], sep);
        case 'list:
            what = strings_to_buf(what, sep);
        case 'buffer:
        default:
            throw(~type, "Write: strings, list of strings and buffers.");
    }
    cwrite(what);
};

public method .write_buffer() {
    arg buffer;
    
    if ((sender() != interface) && (sender() != (| class(interface) |)))
        throw(~perm, sender() + " cannot write this connection.");
    if (type(buffer) != 'buffer)
        throw(~type, "Argument must be a buffer.");
    cwrite(buffer);
};

public method .write_string() {
    arg string;
    
    if ((sender() != interface) && (sender() != (| class(interface) |)))
        throw(~perm, sender() + " cannot write this connection.");
    if (type(string) != 'string)
        throw(~type, "Argument must be a string.");
    cwrite($buffer.from_string(string));
};

public method .write_strings() {
    arg strings;
    
    if ((sender() != interface) && (sender() != (| class(interface) |)))
        throw(~perm, sender() + " cannot write this connection.");
    if (type(strings) != 'list)
        throw(~type, "Argument must be a list of strings.");
    cwrite($buffer.from_strings(string));
};


