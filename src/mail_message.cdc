
new object $mail_message: $has_text, $mail_root;

var $mail_message creator = 0;
var $mail_message delivered = 0;
var $mail_message frominet = 0;
var $mail_message header = #[];
var $mail_message meta = 0;
var $mail_message readers = [];
var $mail_message rfc822_size = 0;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'fertile, 'core, 'variables];
var $root inited = 1;
var $root managed = [$mail_message];
var $root manager = $mail_message;
var $root quota_exempt = 1;
var $root trusted_by = [$smtp];

public method .add_reader(): nooverride  {
    arg who;
    
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    readers = setadd(readers, who);
};

public method .add_recipient(): nooverride  {
    arg whom;
    var current;
    
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    current = (| header['rcpt] |) || [];
    if ((| whom in current |))
        throw(~type, "Recipient is already in the list of recipients");
    header = dict_add(header, 'rcpt, setadd(current, whom));
};

public method .body() {
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    return .text();
};

public method .creator() {
    return creator;
};

public method .del_recipient(): nooverride  {
    arg whom;
    var rcpts;
    
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    rcpts = (header['rcpt]).setremove(whom);
    if (!rcpts)
        .destroy();
    else
        header = header.add('rcpt, rcpts);
};

public method .did_read(): nooverride  {
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    if ($guest in (sender().parents()))
        return;
    readers = setadd(readers, sender());
};

public method .format(): nooverride  {
    arg @metainfo;
    var output, o, h, line, br, sep, i;
    
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    h = .header();
    o = [];
    br = $cml_lib.format_br_tag();
    sep = $cml_lib.format_sep_tag();
    if (metainfo) {
        for i in (meta || [])
            o += [$cml_lib.format_tr_tag($cml_lib.format_td_tag(("I-" + (i[1])) + ":"), $cml_lib.format_td_tag(i[2]))];
    }
    o += [$cml_lib.format_tr_tag($cml_lib.format_td_tag("From:"), $cml_lib.format_td_tag($object_lib.get_name(h['from], 'mail_name)))];
    o += [$cml_lib.format_tr_tag($cml_lib.format_td_tag("To:"), $cml_lib.format_td_tag(((h['rcpt]).omap($mail_lib, 'mail_name)).to_english()))];
    o += [$cml_lib.format_tr_tag($cml_lib.format_td_tag("When:"), $cml_lib.format_td_tag($time.format("%I:%M %p %d-%b-%Y", h['time])))];
    o += [$cml_lib.format_tr_tag($cml_lib.format_td_tag("Subject:"), $cml_lib.format_td_tag(h['subj]))];
    output = [$cml_lib.format_table_tag("18%,82%", @o), sep, map line in (.text()) to ([line, br]), sep];
    return $ctext_frob.new_with(output);
};

public method .format_rfc822() {
    var out, x, line;
    
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    if (.meta()) {
        out = [];
        for x in (.meta())
            out += [((x[1]) + ": ") + (x[2])];
    } else {
        out = ["Date: " + ($time.format("%a, %e %b %Y %T %Z", .time()))];
        out += ["From: " + ($smtp.get_email_address(.from()))];
        out += ["To: " + (((.recipients()).omap($smtp, 'get_email_address)).join(", "))];
        out += [((("Message-ID: <" + (.unique_id())) + "@") + ($sys.server_info('server_hostname))) + ">"];
        out += ["Subject: " + (.subject())];
        out += ["X-UIDL: " + (.unique_id())];
    }
    out += [""];
    for line in (.body()) {
        refresh();
        if ((line.length()) > 79)
            out += line.wrap_lines(75);
        else
            out += [line];
    }
    return out;
};

public method .from(): nooverride  {
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    return (| header['from] |) || $no_one;
};

public method .has_read(): nooverride  {
    arg who;
    
    return who in readers;
};

public method .header(): nooverride  {
    var h, d;
    
    (> .perms(sender()) <);
    h = #[['from, $no_one], ['rcpt, [$no_one]], ['subj, "<none>"], ['time, 0]];
    for d in (header)
        h = h.add(@d);
    return h;
};

root method .init_mail_message() {
    header = #[];
    readers = [];
    .set_flags([]);
};

public method .is_frominet() {
    if (sender() == $no_one)
        frominet = 1;
};

public method .meta(): nooverride  {
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    return meta || [];
};

public method .new_mail(): nooverride  {
    var new, suffix;
    
    // if (!$mail_lib.has_mail_perms(caller()))
    //     (> .perms(sender()) <);
    if (definer() != this())
        throw(~perm, "Only spawn mail from $mail_message.");
    suffix = tosym("mail_" + (.get_obj_suffix()));
    new = (> $sys.spawn_selfmanager(suffix, sender()) <);
    
    // since anybody can create mail, do some tracking..
    new.set_creator(user());
    return new;
};

public method .readers(): nooverride  {
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    return readers;
};

public method .recipients(): nooverride  {
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    return (| header['rcpt] |) || [$no_one];
};

public method .rfc822_size() {
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    if (!rfc822_size)
        rfc822_size = ((.format_rfc822()).to_buffer()).length();
    return rfc822_size;
};

public method .send() {
    arg @recips;
    var r, valid, invalid, from;
    
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    if (delivered)
        throw(~delivered, "This mail has already been delivered.");
    if (!recips)
        recips = .recipients();
    if (((recips.length()) == 1) && ((recips[1]) == $no_one))
        throw(~norcpt, "No recipients specified.");
    
    // Cache RFC822 size
    .rfc822_size();
    valid = [];
    invalid = [];
    for r in (recips) {
        if (r.has_ancestor($mail_list))
            valid += [r];
        else
            invalid += [r];
    }
    if (invalid)
        throw(~invrcpt, "Invalid mail recipients: " + (invalid.mmap('name)), invalid);
    recips = valid;
    invalid = [];
    
    // ok, now that we have that cleared up, lets set pertinent info...
    .set_time(time());
    if ((!(.from())) || (sender() != $no_one))
        .set_from(sender());
    
    // and now to finalize the recipients
    for r in (recips) {
        if ((r.list_is_inet()) && (!frominet)) {
            from = (sender().user_info("name")) || (sender().name());
            from += (" <" + (sender().user_info("email"))) + ">";
            r = r.get_setting("inet-list", $mail_list);
            $smtp.sendmail(from, r, header['subj], .body());
            delivered++;
        } else if (r.list_is_sendable_by(sender())) {
            r.add_mail();
            .add_recipient(r);
            delivered++;
        } else {
            invalid += [r];
        }
    }
    if (!delivered)
        throw(~delivered, "Unable to deliver message.");
    return invalid;
};

private method .set_creator() {
    arg who;
    
    creator = who;
};

public method .set_from(): nooverride  {
    arg whom;
    
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    header = header.add('from, whom);
};

public method .set_meta(): nooverride  {
    arg new_meta;
    
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    meta = new_meta;
};

public method .set_recipients(): nooverride  {
    arg whom;
    
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    header = header.add('rcpt, whom);
};

public method .set_subject(): nooverride  {
    arg what;
    
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    header = header.add('subj, what);
};

public method .set_time(): nooverride  {
    arg time;
    
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    header = header.add('time, time);
};

public method .subject(): nooverride  {
    return (| header['subj] |) || "<none>";
};

protected method .text() {
    return (> pass() <) || ["", "(no message)", ""];
};

public method .time(): nooverride  {
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    return (| header['time] |) || 0;
};

root method .uninit_mail_message() {
    var r;
    
    for r in (.recipients())
        (| r.del_mail(this(), 'mail_destroyed) |);
    header = #[];
    readers = [];
};

public method .unique_id() {
    if (!($mail_lib.has_mail_perms(caller())))
        (> .perms(sender()) <);
    if (!(header.contains('uidl)))
        header = header.add('uidl, $mail_lib.generate_unique_id(this()));
    return header['uidl];
};


