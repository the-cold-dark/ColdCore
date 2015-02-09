
new object $argroup: $has_name;

var $argroup last_id = 360;
var $argroup requests = #[];
var $dmi_data descriptions = #[];
var $has_name name = ['prop, "Problem Group", "Problem Group"];
var $root created_on = 891385398;
var $root credit = ["Created 31-Mar-1998, Brandon Gillespie"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$argroup];
var $root manager = $argroup;

public method .add_request() {
    arg request;
    var info;
    
    requests = dict_add(requests, request.id(), request.general_info());
    return request;
};

root method .core_argroup() {
    requests = #[];
};

public method .del_request() {
    arg id;
    
    if (dict_contains(requests, id))
        requests = dict_del(requests, id);
};

root method .init_argroup() {
    requests = #[];
};

public method .next_id() {
    // last_id is only tracked on the definer
    if (this() != definer())
        throw(~perm, "You have no business calling this method.");
    return ++last_id;
};

public method .request_claimed() {
    arg who;
    var id;
    
    (> .perms(caller(), $action_request) <);
    id = sender().id();
    requests = dict_add(requests, id, replace(requests[id], 5, who));
};

public method .request_resolved() {
    arg when;
    var id;
    
    (> .perms(caller(), $action_request) <);
    id = sender().id();
    requests = dict_add(requests, id, replace(requests[id], 2, when));
};

public method .requests() {
    return requests;
};

public method .submit_request() {
    arg summary, text, tb;
    var id, request;
    
    id = $argroup.next_id();
    request = $action_request.submit_request(id, summary, text, tb, sender());
    return .add_request(request);
};


