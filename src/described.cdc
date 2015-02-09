
new object $described: $has_name, $has_commands;

var $described prose = [];
var $dmi_data descriptions = #[];
var $foundation edit_types = ["prose"];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = ['uniq, "Generic Described Object", "the Generic Described Object"];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root inited = 1;
var $root managed = [$described];
var $root manager = $described;

public method ._edit_prose_callback() {
    arg text, client_data;
    
    (> .perms(caller(), $editor_reference) <);
    catch ~parse
        .set_prose(text);
    with
        return ['failure, ["Error: " + ((traceback()[1])[2])]];
    return ['success, ["Description set."]];
};

public method .configure() {
    arg set;
    var p, end, ctext, s, still, type;
    
    set = (> pass(set) <);
    s = sender();
    still = ("Do you still want to describe " + (.name())) + "? [no] ";
    if (!(set.contains('described_prose))) {
        while (!end) {
            if (.is($path))
                type = "exit ";
            else if (.is($place))
                type = "place ";
            else
                type = "";
            p = s.read((("Describe " + type) + (.name())) + ", Enter \".\" to finish or \"@abort\" to abort description.");
            if (p == 'aborted) {
                end = !(s.prompt_yesno(still, 0));
            } else {
                catch any {
                    ctext = (> $compiler.compile_cml(p) <);
                    s.tell(["You submitted the following description:", ""]);
                    s.tell(ctext);
                    s.tell("");
                    if (!(end = s.prompt_yesno("Keep this description? [yes] ")))
                        ctext = 0;
                } with {
                    s.tell(["The following CML compiler error occurred:", "  ", (traceback()[1])[2]]);
                    end = !(s.prompt_yesno(still, 0));
                }
            }
        }
        if (ctext)
            .set_prose(ctext);
        set = set.add('described_prose, 1);
    }
    return set;
};

protected method .description() {
    arg flags;
    var out, name;
    
    out = $ctext_frob.new_with([$cml_lib.format_subj_tag(.name())]);
    if ((| flags['prose] |))
        return [out.append(.prose())];
    return [out];
};

public method .edit_prose() {
    var p;
    
    (> .perms(sender()) <);
    p = .prose();
    if (type(p) == 'frob)
        p = p.uncompile();
    (> sender().invoke_editor(this(), '_edit_prose_callback, p, []) <);
};

public method .get_description(): nooverride  {
    arg @dflags;
    var flags, f;
    
    flags = #[['prose, 1], ['actor, sender()]];
    if (dflags && (type(dflags[1]) == 'dictionary))
        flags = dict_union(flags, dflags[1]);
    return .description(flags);
};

public method .get_detail() {
    arg name;
    var details, d, matches;
    
    details = (| (.prose()).get_var('details) |);
    if (!details)
        throw(~nodetail, ("No \"" + name) + "\" in your environment.");
    matches = [];
    for d in (details.keys()) {
        if (match_begin(d, name))
            matches += [d];
    }
    if (!matches)
        throw(~nodetail, ("No \"" + name) + "\" in your environment.");
    if (listlen(matches) != 1)
        throw(~ambig, (("\"" + name) + "\" can match ") + (matches.to_english()));
    return (<$ctext_frob, [details[matches[1]], #[['this, this()]]]>);
};

root method .init_described() {
    prose = [];
};

public method .prose() {
    arg @no_default;
    
    return ((type(prose) == 'frob) ? (prose.set_var('this, this())) : prose) || (no_default ? 0 : "You see nothing special");
};

public method .set_prose() {
    arg new;
    
    (> .perms(sender()) <);
    if (new != 0) {
        switch (type(new)) {
            case 'string, 'list:
                new = (> $compiler.compile_cml(new) <);
            case 'frob:
                // we'll let this pass by unharmed -- potentially dangerous
            default:
                throw(~invalid, "Prose can be submitted as CML or Ctext");
        }
    }
    prose = new;
};

root method .uninit_described() {
    prose = 0;
};


