
new object $help_ui: $user_interfaces;

var $command_cache modules = [];
var $has_commands local = \
  #[["@help", [["@help", "*", "@help <any>", 'help_cmd, #[[1, ['any, []]]]]]]];
var $has_commands shortcuts = #[["?*", ['help_cmd, ["?", 1]]]];
var $help_ui current = 1;
var $help_ui history = [$help_coldcore];
var $help_ui index = 0;
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'fertile, 'variables, 'core];
var $root inited = 1;
var $root managed = [$help_ui];
var $root manager = $help_ui;

protected method ._back_help_node() {
    var pos;
    
    pos = current - 1;
    if (pos >= 1) {
        current = pos;
        return history[current];
    }
    throw(~nonode, "You are at the start of your help node history, use \"??\" to list the history.");
};

protected method ._forward_help_node() {
    var pos;
    
    pos = current + 1;
    if ((pos <= ($help_lib.history_cap())) && (pos <= (history.length()))) {
        current = pos;
        return history[current];
    }
    throw(~nonode, "You are at the end of your help node history, use \"??\" to list the history.");
};

protected method ._help_node_history() {
    var node, line;
    
    .tell("Help node history:");
    for node in [1 .. history.length()] {
        line = "   ";
        if (node == current)
            line = "=> ";
        catch any {
            .tell(line + ((history[node]).name()));
        } with {
            history = history.delete(node);
            .set_help_node(history[1]);
            .tell(line + ">> ERROR: INVALID NODE IN HISTORY <<");
        }
    }
    .tell("---");
};

protected method ._navigate_node_history() {
    arg str;
    var node, r, hist, match;
    
    while ((r = regexp(str, "^ *([<>]) *([^<>]*) *"))) {
        if (r[2]) {
            if ((r[1]) == "<")
                hist = (sublist(history, 1, current - 1).reverse()) + (sublist(history, current).reverse());
            else
                hist = sublist(history, current + 1) + sublist(history, 1, current);
            r = r[2];
            for node in (hist) {
                if (node.match_name(r)) {
                    .set_help_node(node);
                    match++;
                    break;
                }
            }
            if (!match)
                throw(~nonode, ("There is no node \"" + r) + "\" in your history.");
        } else if ((r[1]) == "<") {
            (| .set_help_node(._back_help_node()) |);
        } else {
            (| .set_help_node(._forward_help_node()) |);
        }
        str = strsed(str, "^ *([<>]) *([^<>]*) *", "");
    }
    return history[current];
};

protected method .clear_help_history() {
    (| clear_var('history) |);
    (| clear_var('current) |);
};

public method .current_node() {
    return history[current];
};

public method .find_help_in_group() {
    arg str;
    var sibling, node;
    
    node = (.current_node()) || ($help_lib.default_node());
    if (node.group()) {
        for sibling in (((node.parents())[1]).children()) {
            if ((sibling == node) || ((sibling.nolist()) || (sibling.holder())))
                continue;
            if (sibling.match_name(str))
                return sibling;
        }
    }
    throw(~nonode, ("Unable to find group node \"" + str) + "\".");
};

public method .find_help_in_index() {
    arg str;
    var indices, i, node, index, matches, len;
    
    // get from $help_lib to keep in a consistent prioritized order
    indices = $help_lib.indices();
    
    // put the 'current' node at the end, and use it first
    if ((i = sender().help_index())) {
        indices = setremove(indices, i);
        indices = setadd(indices, i);
    }
    
    // loop through the indices backwards
    len = listlen(indices);
    matches = [];
    for i in [1 .. len] {
        i = (len - i) + 1;
        catch any {
            if ((node = (| (indices[i]).exact_match(str) |))) {
                // return the first perfect match
                return node;
            } else if ((node = (> (indices[i]).match_begin(str) <))) {
                matches = setadd(matches, node);
            }
        } with {
            if (error() == ~ambig)
                matches += ((traceback()[1])[3]) || [];
        }
    }
    if (listlen(matches) == 1)
        return matches[1];
    else if (matches)
        throw(~ambig, "More than one match.", matches);
    throw(~nonode, ("Unable to find help on \"" + str) + "\".");
};

public method .find_help_in_links() {
    arg str;
    var links, node, index;
    
    links = ((| .current_node() |) || ($help_lib.default_node())).links();
    for node in (links.keys()) {
        if (match_begin(node, str)) {
            node = links[node];
            return node;
        }
    }
    throw(~nonode, ("Unable to find link \"" + str) + "\".");
};

public method .fmt_help_from() {
    arg from;
    var node, c, name;
    
    c = .task_connection();
    for node in (from.traverse()) {
        name = (node.name()).word(1, "|");
        c.write(["", name, "=" * strlen(name)]);
        if (!(node.holder()))
            c.write($parse_lib.filter_ctext(node.body(), #[['formatter, $flat_format]]));
    }
};

protected method .help_cmd() {
    arg cmdstr, cmd, args;
    var o, opt, optval, way, node, links, i;
    
    (> .perms(caller(), 'command) <);
    o = #[["?", "h?istory"], ["<", "b?ack"], [">", "f?orward"], ["!", "fix"], ["#", "l?inks"], ["^", "u?p"]];
    args = (> $parse_lib.opt(args, @o.values()) <);
    opt = args[2];
    args = args[1];
    if (!opt) {
        if (!args) {
            if (cmd == "?")
                node = .current_node();
            else
                node = $help_lib.default_node();
        } else {
            args = args.join();
            if ((args[1]) in (o.keys())) {
                opt = o[args[1]];
                if ((args.length()) > 1)
                    optval = args.subrange(2);
            } else if ((o = match_template(args, "* in *"))) {
                if (!(i = $help_index.match_children(o[3])))
                    return ("\"" + (o[3])) + "\" is not a help index.";
                if ((!(o[1])) || ((o[1]) == "#"))
                    node = i;
                else if (!(node = (| i.match_begin(o[1]) |)))
                    return ((("Unable to find help on \"" + (o[1])) + "\" in the ") + (i.name())) + " index.";
            } else {
                catch ~nonode, ~ambig {
                    node = (> .parse_help_reference(args) <);
                } with {
                    if (error() == ~ambig) {
                        o = (traceback()[1])[3];
                        i = (.get_rows()) - 3;
                        .tell(((("Topic '" + args) + "' has ") + (o.length())) + " possibilities:");
                        if ((o.length()) > i) {
                            i--;
                            .tell((sublist(o, 1, i).mmap('namef, 'ref)).prefix("    "));
                            .tell(("[truncated, " + ((o.length()) - i)) + " more matches]");
                        } else {
                            .tell((o.mmap('namef, 'ref)).prefix("    "));
                        }
                        return "---";
                    }
                    return (traceback()[1])[2];
                }
            }
        }
    } else {
        // since all options override each other, just use the last one.
        optval = (opt[listlen(opt)])[4];
        opt = ((opt[listlen(opt)])[1]) || ((opt[listlen(opt)])[2]);
        if (dict_contains(o, opt[1]))
            opt = o[opt[1]];
    }
    if (!node) {
        catch ~nonode {
            switch (opt) {
                case "u?p":
                    o = ((.current_node()).parents())[1];
                    while ((o.is($help_node)) && (o.holder()))
                        o = (o.parents())[1];
                    if ((!(o.is($help_node))) || (o.top_of_help_heirarchy()))
                        return "You are at the top of this help node heirarchy.";
                    node = o;
                case "h?istory":
                    return ._help_node_history();
                case "b?ack":
                    if (!optval)
                        optval = "";
                    node = (> ._navigate_node_history("<" + optval) <);
                case "f?orward":
                    if (!optval)
                        optval = "";
                    node = (> ._navigate_node_history(">" + optval) <);
                case "fix":
                    .tell("Fixing your help history.");
                    for node in (history) {
                        if ((!valid(node)) || (!(node.has_ancestor($help_node))))
                            history = setremove(history, node);
                    }
                    current = listlen(history);
                    return;
                case "l?inks":
                    node = .current_node();
                    links = node.links();
                    if (!links) {
                        .tell(("No links from " + (node.name())) + ".");
                    } else {
                        .tell(("Links from " + (node.name())) + ":");
                        .tell(map i in (links) to (strfmt("%30l %s", @i)).prefix("    "));
                    }
                    if (node.group()) {
                        links = ((node.parents())[1]).children();
                        links = filter o in (links) where ((!(o.nolist())) && (o != node));
                        if (!links)
                            return ("No group nodes with " + (node.name())) + ".";
                        .tell(("Group nodes with " + (node.name())) + ":");
                        .tell(map i in (links) to (strfmt("%30e %s", i.name(), i)).prefix("    "));
                        .tell("---");
                    }
                    return;
                default:
                    throw(~stop, ("Unknown option '-" + opt) + "'");
            }
        } with {
            return (traceback()[1])[2];
        }
    }
    .set_help_node(node);
    .tell_help_node(node);
};

public method .help_index() {
    return index;
};

protected method .help_node_history() {
    return history;
};

root method .init_help_ui() {
    history = [$help_lib.default_node()];
    current = 1;
};

protected method .last_visited() {
    (> .perms(sender()) <);
    return last_visited;
};

protected method .parse_help_reference() {
    arg str;
    var node, cnode, current, indices, len, links, i, matches, m;
    
    if ((str[1]) == "$") {
        node = (| $object_lib.to_dbref(str) |);
        if (node && (node.help_node()))
            node = node.help_node();
        else if ((!node) || (!(node.has_ancestor($help_node))))
            throw(~nonode, ("\"" + str) + "\" is not a help node, and does not have a help node assigned to it.");
        return node;
    }
    if ((m = match_template(str, "*=*"))) {
        if (!(m[2]))
            throw(~nonode, ("Search in " + (m[1])) + " for nothing?");
        else if (match_template(m[1], "g?roup"))
            return (> .find_help_in_group(m[2]) <);
        else if (match_template(m[1], "l?inks"))
            return (> .find_help_in_links(m[2]) <);
        else if (match_template(m[1], "i?ndex"))
            return (> .find_help_in_index(m[2]) <);
        if (!(i = $help_index.match_children(m[1])))
            throw(~nonode, ("\"" + (m[1])) + "\" is not a help index.");
        if ((m[2]) == "#")
            return i;
        if (!(node = (| i.match_begin(m[2]) |)))
            throw(~nonode, ((("Unable to find help on \"" + (m[2])) + "\" in the ") + (i.name())) + " index.");
        return node;
    }
    if (">" in str)
        return (> .step_help_nodes(split(str, " *> *")) <);
    if ((m = regexp(str, "(\.[a-z][0-9a-z_]+)\( *\)"))) {
        str = m[1];
    } else if ((m = regexp(str, " *([a-z][0-9a-z_]+)\( *\)"))) {
        i = "help_func_" + (m[1]);
        if ((node = (| lookup(tosym(i)) |)))
            return node;
        else
            throw(~nonode, ("Unable to find help on function " + (m[1])) + "()");
    }
    return (| .find_help_in_links(str) |) || ((| .find_help_in_group(str) |) || (> .find_help_in_index(str) <));
};

protected method .reset_help_history() {
    history = [$help_coldcore];
    current = 1;
};

protected method .set_help_node() {
    arg node, @navhist;
    var cur;
    
    if (node.index())
        index = node.index();
    cur = history[current];
    if (node in history) {
        if ((history[current]) == node)
            return;
        if (navhist)
            return (current = node in history);
        else
            history = setremove(history, node);
    } else if (listlen(history) >= ($help_lib.history_cap())) {
        history = sublist(history, 1, $help_lib.history_cap());
    }
    current = cur in history;
    if (navhist) {
        if (current)
            history = insert(history, current + 1, node);
    } else {
        history = (history ? sublist(history, 1, current) : []) + [node];
    }
    current = node in history;
};

protected method .step_help_nodes() {
    arg hist;
    var sn, node;
    
    // start from the same base
    .set_help_node($help_lib.default_node());
    for sn in (hist) {
        if ((node = (| .find_help_in_links(sn) |))) {
            .set_help_node(node);
            .tell(("Following link for '" + sn) + "'");
        } else if ((node = (| .find_help_in_group(sn) |))) {
            .set_help_node(node);
            .tell(("Following group for '" + sn) + "'");
        } else {
            catch any {
                node = (> .find_help_in_index(sn) <);
                .set_help_node(node);
                .tell(("Found '" + sn) + "' in index");
            } with {
                throw(~stop, (traceback()[1])[2]);
            }
        }
    }
    return node;
};

protected method .tell_help_node() {
    arg node;
    var out, len, clen, line, n, name, changed, sibs, end, start, flen;
    
    // len = .linelen() % 2 ? .linelen() - 1 : .linelen();
    len = .linelen();
    name = node.node_name();
    while (strlen(name) >= (len - 10)) {
        name = substr(name, (":" in name) + 1);
        changed++;
    }
    if (changed)
        name = ".." + name;
    line = strfmt("%*{-}c", len, (" " + name) + " ");
    .tell(line);
    .ptell(node.body(), #[['type, 'help], ['ctype, 'ctext]]);
    if (node.group()) {
        line = (start = (end = ""));
        sibs = filter n in (((node.parents())[1]).children()) where (!(n.nolist()));
        flen = (((strlen((sibs.mmap('small_name)).join()) + (listlen(sibs) * 3)) + 3) + strlen(end)) + strlen(start);
        while (flen > len) {
            if ((listlen(sibs) / 2) >= (node in sibs)) {
                sibs = sublist(sibs, 1, listlen(sibs) - 1);
                if (!end)
                    end = ".. ";
            } else {
                sibs = sublist(sibs, 2);
                if (!start)
                    start = ".. ";
            }
            flen = (((strlen((sibs.mmap('small_name)).join()) + (listlen(sibs) * 3)) + 3) + strlen(end)) + strlen(start);
        }
        if (sibs) {
            for n in (sibs) {
                if (n == node)
                    line += ". ";
                else if (n.holder())
                    line += (((n.name()).word(1, "|")).word(1)) + " ";
                else
                    line += ("[" + (((n.name()).word(1, "|")).word(1))) + "] ";
            }
            line = (((" " + start) + line) + end).center(len, "-", 'both);
        } else {
            line = "-" * len;
        }
    } else {
        line = "-" * len;
    }
    .tell(["", line]);
};

root method .uninit_help_ui() {
    (| clear_var('history) |);
    (| clear_var('current) |);
    (| clear_var('index) |);
};


