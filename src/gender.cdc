
new object $gender: $has_name;

var $gender apronouns = 0;
var $gender cgender_name = 0;
var $gender context = [];
var $gender gender = 0;
var $gender gender_name = 0;
var $gender has = 0;
var $gender number = 0;
var $gender person = 0;
var $gender pronouns = 0;
var $gender vpronouns = 0;
var $has_name name = ['normal, "Gendered Object", "a Gendered Object"];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'core, 'variables];
var $root inited = 1;
var $root managed = [$gender];
var $root manager = $gender;

public method .apronouns() {
    return apronouns;
};

public method .cml_pronouns() {
    return cml_pronouns;
};

public method .context() {
    return context;
};

public method .gender() {
    return gender;
};

public method .gender_name() {
    arg @caps;
    
    [(caps ?= 'null)] = caps;
    switch (caps) {
        case 'caps:
            return cgender_name;
        default:
            return gender_name;
    }
};

root method .init_gender() {
    cgender_name = "";
    gender_name = "";
    
    // these should be inited by hand, later.
    pronouns = #[['pr, "itself"], ['pp, "its"], ['po, "it"], ['ps, "it"], ['pq, "its"], ['prc, "Itself"], ['ppc, "Its"], ['poc, "It"], ['psc, "It"], ['pqc, "Its"], ['have, "has"]];
};

public method .number() {
    return number;
};

public method .pronoun() {
    arg pronoun;
    
    return (> pronouns[pronoun] <);
};

public method .pronouns() {
    return pronouns;
};

public method .set_gender_names() {
    arg name, cname;
    
    .perms(sender());
    cgender_name = cname;
    gender_name = name;
};

public method .set_pronouns() {
    arg nmbr, ps, po, pp, pq, pr, psc, poc, ppc, pqc, prc;
    var x;
    
    .perms(sender(), 'manager);
    pronouns = #[['pr, pr], ['pp, pp], ['po, po], ['ps, ps], ['pq, pq], ['prc, prc], ['ppc, ppc], ['poc, poc], ['psc, psc], ['pqc, pqc]];
    number = nmbr;
    context = [ps, po, pp, pq, pr, psc, poc, ppc, pqc, prc];
};

public method .vpronouns() {
    return vpronouns;
};


