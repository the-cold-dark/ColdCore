
new object $bug_handler: $misc;

var $bug_handler ticker = 0;
var $bug_handler ticket = 143;
var $bug_handler unclaimed_tally = 35;
var $dmi_data descriptions = #[];
var $root created_on = 866643320;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$bug_handler];
var $root manager = $bug_handler;
var $root quota_exempt = 1;

public method .add_bug() {
    arg category, title, reporter, text;
    var bug;
    
    // Spawn a new bug and fill it with information:
    // Create a new bug object:
    if (!(category.is($bug_report)))
        throw(~stop, "Category must be a descendant of $bug_report.");
    bug = category.spawn();
    if (!bug)
        throw(~stop, "Unable to spawn new bug object!");
    
    // Set the bug information:
    bug.set_reporter(reporter);
    bug.set_text(text);
    bug.set_ticket_number(.ticket());
    .increase_ticket();
};

public method .calculate_owned_by() {
    arg who;
    var category, bug, tally;
    
    // Return the number of bugs owned by 'who':
    tally = 0;
    for category in ($bug_handler.categories()) {
        for bug in (category.children()) {
            if ((!(bug.fixed())) && ((bug.owner()) == who))
                tally++;
            refresh();
        }
    }
    return tally;
};

public method .categories() {
    // Why? I don't know:
    return $bug_report.children();
};

public method .dismiss() {
    arg what;
    
    what.chparents($dismissed_bugs);
};

public method .increase_ticket() {
    ticket++;
};

public method .info() {
    var cat, repnum;
    
    // Report information on the bug handler:
    repnum = 0;
    for cat in (.categories())
        repnum = repnum + ((cat.children()).length());
    return ["Next Ticket Number: " + tostr(ticket), "Total Categories: " + tostr((.categories()).length()), "Total Bug Reports: " + tostr(repnum)];
};

public method .rehash_unclaimed_tally() {
    var category, bug;
    
    unclaimed_tally = 0;
    for category in ($bug_handler.categories()) {
        for bug in (category.children()) {
            if ((!(bug.fixed())) && (!(bug.owner())))
                unclaimed_tally++;
            refresh();
        }
    }
};

public method .ticket() {
    return ticket;
};

public method .unclaimed_tally() {
    return unclaimed_tally;
};


