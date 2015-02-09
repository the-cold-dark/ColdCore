
new object $housekeeper: $utilities;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$housekeeper];
var $root manager = $housekeeper;

public method .did_disconnect() {
    var task_queue, task;
    
    if (caller() != $user)
        throw(~perm, "Permission denied");
    
    // Are we removing users?
    if (($world.get_setting("cleanup-disconnected-users", $world)) == 0) {
        return;
    } else {
        // because of guests
        if (valid(sender()))
            $scheduler.add_task(300, 'move_user_home, sender());
    }
};

public method .move_user_home() {
    arg who;
    var home, curloc;
    
    who.poll_semaphore('cleanup);
    if (who.connected())
        return;
    (| who.cleanup_sessions() |);
    curloc = who.location();
    home = who.home();
    if (curloc == home)
        return;
    (| who.move_to(home) |) || (> who.move_to($body_cave) <);
    curloc.did_housekeep(who);
    who.release_semaphore('cleanup);
};


