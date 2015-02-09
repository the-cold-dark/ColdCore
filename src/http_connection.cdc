
new object $http_connection: $inbound_connection;

var $connection active = 0;
var $connection buffer = `[27];
var $connection daemon = 0;
var $connection host = "";
var $connection interface = $http_interface;
var $connection line_buffer = [];
var $connection read_block = 0;
var $connection started_at = 0;
var $connection timeout = 0;
var $http_connection buffer = 0;
var $http_connection line_buffer = 0;
var $http_connection reading = 0;
var $root created_on = 809075134;
var $root flags = ['methods, 'code, 'core, 'variables];
var $root inited = 1;
var $root managed = [$http_connection];
var $root manager = $http_connection;
var $root quota_exempt = 1;

public method .handle_POST_input() {
    arg len;
    var body;
    
    if (buflen(buffer) < len) {
        reading = 300;
        while ((buflen(buffer) < len) && --reading) {
            $scheduler.sleep(1);
            refresh();
        }
        if (buflen(buffer) < len) {
            buffer = `[];
            status = 400;
            reading = 0;
            throw(~timeout, "Timeout on receiving POST request");
        }
    }
    body = buf_to_strings(subbuf(buffer, 1, len));
    buffer = subbuf(buffer, len + 1);
    if ((`[13, 10] in buffer) == 1)
        buffer = subbuf(buffer, 3);
    if ((body[listlen(body)]) == `[])
        body = delete(body, listlen(body));
    else
        body = replace(body, listlen(body), buf_to_str(body[listlen(body)]));
    reading = 0;
    return body;
};

root method .init_http_connection() {
    buffer = `[];
    line_buffer = [];
};

driver method .parse() {
    arg incoming;
    var l, line, i, t, int, sub;
    
    catch any {
        buffer += incoming;
        int = .interface();
        while (!reading) {
            if (!(i = `[13, 10] in buffer))
                break;
            sub = subbuf(buffer, 1, i - 1);
            line = buf_to_str(sub);
            buffer = subbuf(buffer, i + 2);
            (> int.parse_line(line) <);
        }
    } with {
        int.set_status(500);
        int.respond($parse_lib.html_traceback(traceback(), 500));
    }
};

public method .start() {
    arg @args;
    
    .set_timeout(0);
    return (> pass(@args) <);
};


