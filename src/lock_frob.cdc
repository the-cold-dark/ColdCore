
new object $lock_frob: $logic_frob;

var $lock_frob lock_types = [["inside", $inside_lock_frob], ["indirect", $indirect_lock_frob], ["owner", #-1692], ["carry", $carry_lock_frob], ["parent", $parent_lock_frob]];
var $lock_frob names = 0;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root managed = [$lock_frob];
var $root manager = $lock_frob;

public method .add_name() {
    arg type, name;
    
    (> .perms(sender(), 'manager) <);
    if (!names)
        names = #[];
    names = names.add(type, name);
};

public method .lock_name() {
    arg value, @type;
    
    [(type ?= 'default)] = type;
    if (type == 'literal)
        type = 'default;
    return (| names[type] |) || (names['default]);
};

public method .new_with() {
    arg str;
    
    return (> .parse(str, sender()) <);
};

public method .parse() {
    arg s, who;
    var stack, lock, n, m, obj, type, i;
    
    stack = [];
    s = " " + s;
    s = strsed(s, "&([^&])", "&&%1", "g");
    s = strsed(s, "\|([^\|])", "||%1", "g");
    s = strsub(s, " or ", " || ");
    s = strsub(s, " and ", " && ");
    s = strsub(s, " not ", " !");
    s = strsub(s, " xor ", " ^^");
    while (1) {
        // Look for valid prefixes.
        while (1) {
            (s = s.trim()) || throw(~parse, "String ends unexpectedly.");
            if ((s[1]) == "(") {
                stack = ['open, @stack];
                s = s.subrange(2);
            } else if ((s[1]) == "!") {
                if (stack && ((stack[1]) == 'not))
                    stack = stack.subrange(2);
                else
                    stack = ['not, @stack];
                s = s.subrange(2);
            } else {
                break;
            }
        }
    
        // Look for an object name or tag
        m = regexp(s, "^([^)&|]+)(.*)");
        if (!m)
            throw(~parse, "Null object obj_name.");
        s = m[2];
        lock = (m[1]).trim();
        if (!lock)
            throw(~parse, "Null object obj_name.");
    
        // try and match it
        type = $object_lock_frob;
        for i in (lock_types) {
            if (lock.match_begin((i[1]) + ":")) {
                type = i[2];
                lock = lock.subrange(((i[1]).length()) + 2);
                break;
            }
        }
        switch (lock) {
            case "any", "true", "anybody", "yes":
                lock = $true_lock_frob.new();
            case "none", "false", "nobody", "no":
                lock = $false_lock_frob.new();
            default:
                if ((obj = (| who.match_environment(lock) |)))
                    lock = type.new_lock(obj);
                else
                    throw(~parse, ("Invalid lock tag \"" + lock) + "\"");
        }
        stack = [lock, @stack];
    
        // Loop until no more reduction to be done.
        while (1) {
            // Process negations, ands, ors.
            while (1) {
                if ((stack.length()) < 2)
                    break;
                if ((stack[2]) == 'not)
                    stack = [$not_lock_frob.new_lock(stack[1]), @stack.subrange(3)];
                else if ((stack[2]) == 'and)
                    stack = [$and_lock_frob.new_lock(stack[1], stack[3]), @stack.subrange(4)];
                else if ((stack[2]) == 'or)
                    stack = [$or_lock_frob.new_lock(stack[1], stack[3]), @stack.subrange(4)];
                else
                    break;
            }
    
            // Close parens, if necessary; otherwise stop.
            if ((!s) || ((s[1]) != ")"))
                break;
            while (s && ((s[1]) == ")")) {
                if (((stack.length()) < 2) || ((stack[2]) != 'open))
                    throw(~parse, "Misplaced right parenthesis.");
                stack = [stack[1], @stack.subrange(3)];
                s = (s.subrange(2)).trim();
            }
        }
    
        // Are we done?
        if (!s) {
            if ((stack.length()) > 1)
                throw(~parse, "Unmatched left parentheses.");
            return stack[1];
        }
    
        // No, we're at a conjunction.
        if ((s[1]) == "&") {
            stack = ['and, @stack];
            s = s.subrange(3);
        } else if ((s[1]) == "|") {
            stack = ['or, @stack];
            s = s.subrange(3);
        } else {
            throw(~parse, "Illegal character following right parenthesis.");
        }
    }
};

public method .set_lock_name() {
    arg name;
    
    (> .perms(sender(), 'manager) <);
    lock_name = name;
};


