
new object $http_daemon: $daemon;

var $daemon connection = $http_connection;
var $daemon current_port = 1180;
var $daemon listen = [[1180]];
var $dmi_data descriptions = #[];
var $http_daemon site_url = "";
var $root created_on = 809075222;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$http_daemon];
var $root manager = $http_daemon;
var $root quota = 'exempt;
var $root quota_exempt = 1;

protected method .figure_site_url() {
    var host, curr, h, port;
    
    curr = .current_ports();
    if ((h = find h in (curr) where (listlen(h) == 2))) {
        [port, host] = curr[h];
        host = $dns.hostname(host);
    } else {
        host = $dns.hostname("");
        port = (curr[1])[1];
    }
    if (port != 80)
        site_url = (host + ":") + port;
    else
        site_url = host;
    return site_url;
};

public method .site_url() {
    return site_url;
};

public method .start_listening() {
    arg @args;
    
    (> pass(@args) <);
    .figure_site_url();
};

public method .stop_listening() {
    site_url = "";
    (> pass() <);
};


