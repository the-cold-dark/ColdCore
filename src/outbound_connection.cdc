
new object $outbound_connection: $connection;

var $connection active = 0;
var $connection buffer = `[];
var $connection daemon = 0;
var $connection host = "";
var $connection interface = 0;
var $connection line_buffer = [];
var $connection local_addr = "";
var $connection read_block = 0;
var $connection remote_addr = "";
var $connection started_at = 0;
var $connection timeout = 0;
var $root created_on = 844616370;
var $root flags = ['core, 'methods, 'code, 'variables];
var $root inited = 1;
var $root managed = [$outbound_connection];
var $root manager = $outbound_connection;
var $root quota = 100000;
var $root quota_exempt = -1;
var $root trusted = [$smtp, $dns];

driver method .connect() {
    arg task_id;
    
    $scheduler.resume(task_id, 'success);
};

driver method .failed() {
    arg task_id, reason;
    
    $scheduler.resume(task_id, reason);
};

public method .new() {
    var child, daemon, port, i;
    
    (| .perms(sender(), 'trusts) |) || (> .perms(caller(), 'trusts) <);
    child = .spawn();
    
    // do perms stuff
    child.add_writer(sender());
    child.add_writer(this());
    child.new_interface(sender());
    return child;
};

public method .new_with() {
    arg name;
    var child, daemon, port, i;
    
    (| .perms(sender(), 'trusts) |) || (> .perms(caller(), 'trusts) <);
    child = .spawn();
    catch any {
        (> child.set_objname(name) <);
    } with {
        (| child.destroy() |);
        rethrow(error());
    }
    
    // do perms stuff
    child.add_writer(sender());
    child.new_interface(sender());
    return child;
};

public method .open_connection() {
    arg host, port;
    var condition;
    
    (> .perms(sender()) <);
    (> pass(host, port) <);
    condition = $scheduler.suspend(this());
    if (condition != 'success)
        throw(condition, "Unable to open connection.");
    return condition;
};


