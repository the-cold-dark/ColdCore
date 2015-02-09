
new object $ident_connection: $outbound_connection;

var $connection buffer = `[];
var $connection line_buffer = [];
var $connection local_addr = "";
var $connection remote_addr = "";
var $connection tid = -1;
var $connection timeout = 300;
var $ident_connection task = 0;
var $root created_on = 859834690;
var $root flags = ['core, 'methods, 'code, 'variables];
var $root inited = 1;
var $root managed = [$ident_connection];
var $root manager = $ident_connection;
var $root quota_exempt = 1;

public method .get() {
    arg @args;
    var conn;
    
    (caller() != $connection) && (> .perms(sender()) <);
    conn = .spawn();
    conn.add_writer(sender());
    return conn.get_ident(@args);
};

public method .get_ident() {
    arg host, remote_port, local_port;
    var out;
    
    (> .perms(caller(), definer()) <);
    task = task_id();
    catch any
        .open_connection(host, 113);
    with
        return [];
    .write(((remote_port + ", ") + local_port) + "\n");
    out = $scheduler.suspend(this());
    .close();
    return out.explode(":");
};

protected method .parse_line() {
    arg line;
    
    return $scheduler.resume(task, line);
};


