
new object $mail_db: $registry, $mail_root;

var $db database = #[["news", $mail_list_news], ["bugs", $mail_list_bugs], ["admin", $mail_admin], ["tracebacks", $mail_list_tracebacks], ["postmaster", $mail_postmaster]];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'core, 'variables];
var $root inited = 1;
var $root managed = [$mail_db];
var $root manager = $mail_db;
var $root trusted = [$mail_list];

root method .core_mail_db() {
    .set_database(#[["news", $mail_list_news], ["bugs", $mail_list_bugs], ["admin", $mail_admin], ["tracebacks", $mail_list_tracebacks], ["postmaster", $mail_postmaster]]);
};

public method .mail_name() {
    arg obj;
    
    return "*" + (obj.name());
};

public method .valid_recipient() {
    arg recip;
    
    if (recip.has_ancestor($mail_list))
        return 1;
    return 0;
};


