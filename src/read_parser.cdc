
new object $read_parser: $frob;

var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$read_parser];
var $root manager = $read_parser;

public method .add() {
    arg dict, @args;
    
    return (<this(), ((> dict.add(@args) <))>);
};

public method .command() {
    arg dict;
    
    return (| dict['command] |) || "";
};

public method .lines() {
    arg dict;
    
    return dict['lines];
};

public method .new_with() {
    arg task_id, count;
    
    return (<this(), #[['lines, []], ['status, 'not_done], ['count, count], ['task_id, task_id]]>);
};

public method .parse() {
    arg dict, line;
    var line, result;
    
    // checks the incoming line to see if its a keeper, or a command.
    if ((dict['count]) == 'one) {
        dict = dict.add_elem('lines, line);
        return (<this(), (dict.add('status, 'done))>);
    } else {
        return (<this(), (.parse_line(dict, line))>);
    }
};

public method .parse_line() {
    arg dict, line;
    var cmd;
    
    if (!line) {
        // we have to do this as such, because of logic (shrug)
        dict = dict.add('status, 'not_done);
        return dict.add_elem('lines, line);
    } else if ((line[1]) == ".") {
        if (((line.length()) > 1) && ((line[2]) == "."))
            line = line.subrange(2);
        else if ((line.length()) == 1)
            return dict.add('status, 'done);
    
        //// No, bad Brandon, Bad, no scooby snack
        //// Decomment this if you want '>' to escape commands when reading
        //   } else if (line[1] == ">") {
        //       if (line.length() > 1 && line[2] == ">") {
        //           line = line.subrange(2);
        //       } else {
        //           dict = dict.add('command, line.subrange(2));
        //           return dict.add('status, 'pass_command);
        //       }
    } else if (line == "@abort") {
        return dict.add('status, 'abort);
    }
    dict = dict.add('status, 'not_done);
    return dict.add_elem('lines, line);
};

public method .status() {
    arg dict;
    
    return dict['status];
};

public method .task_id() {
    arg dict;
    
    return dict['task_id];
};


