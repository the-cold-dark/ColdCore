
new object $english_lib: $libraries;

var $english_lib alphabet = "abcdefghijklmnopqrstuvwxyz";
var $english_lib capitalize_exceptions = ["the", "a", "an", "and", "for", "but", "or", "nor", "of", "with", "using", "at", "to", "in", "into", "on", "onto", "upon", "out", "from", "over", "under", "through", "underneath", "beneath", "behind", "beside", "about", "as", "off"];
var $english_lib cardinal_direction_opposites = ["south", "southwest", "west", "northwest", "northeast", "east", "southeast"];
var $english_lib cardinal_directions = ["north", "northeast", "east", "southeast", "south", "southwest", "west", "northwest"];
var $english_lib letter_names = ["ay", "bee", "see", "dee", "ee", "eff", "jee", "aitch", "eye", "jay", "kay", "el", "em", "en", "oh", "pee", "queue", "ar", "es", "tee", "you", "vee", "double-you", "ex", "why", "zee"];
var $english_lib nonvowel_exceptions = "^historic|ydu|honor|honest|habitual|heir|RPG";
var $english_lib noun_exceptions = #[["child", "children"], ["deer", "deer"], ["moose", "moose"], ["mouse", "mice"]];
var $english_lib selector_words = ["all", "everything", "everyone", "everybody"];
var $english_lib verb_exceptions = #[["has", "have"], ["is", "are"], ["was", "were"], ["'s", "'ve"], ["can", "can"], ["collapses", "collapse"]];
var $english_lib vowel_exceptions = "^usu|uke|uvu|use|UPI|unit|univ|unic|uniq|unix|eur|uu|ubiq|union|one|once|uti|unif";
var $root created_on = 847697242;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$english_lib];
var $root manager = $english_lib;

public method ._add_s() {
    arg str;
    var len;
    
    len = strlen(str);
    if (len < 2)
        return str + "s";
    if (((str[len]) == "y") && (!((str[len - 1]) in "aeiou")))
        return substr(str, 1, len - 1) + "ies";
    else if (((((str[len]) == "o") && (!((str[len - 1]) in "aeiouy"))) || ((str[len]) in "sx")) || ((len > 1) && ((substr(str, len - 1, 2) in "chsh") % 2)))
        return str + "es";
    else
        return str + "s";
};

public method ._noun_plural() {
    arg string;
    var k;
    
    anticipate_assignment();
    string = strsed(string, "^(a|an) +", "");
    if ((k = (| noun_exceptions[string] |)))
        return k;
    return ._add_s(string);
};

public method ._noun_singular() {
    arg string;
    var k;
    
    anticipate_assignment();
    if ((k = string in (noun_exceptions.values())))
        return (noun_exceptions.keys())[k];
    return ._remove_s(string);
};

public method ._remove_s() {
    arg str;
    var len;
    
    len = strlen(str);
    if ((len <= 3) || ((str[len]) != "s"))
        return str;
    else if ((str[len - 1]) != "e")
        return substr(str, 1, len - 1);
    else if (((((str[len - 2]) == "h") && ((str[len - 3]) in "cs")) || ((str[len - 2]) in "ox")) || (((str[len - 2]) == "s") && (!((str[len - 3]) in "aeiouy"))))
        return substr(str, 1, len - 2);
    else if ((str[len - 2]) == "i")
        return substr(str, 1, len - 3) + "y";
    else
        return substr(str, 1, len - 1);
};

public method ._verb_plural() {
    arg string;
    var len, a;
    
    len = string.length();
    if ((len > 2) && match_regexp(string, "n't *$"))
        return (._verb_plural(string.subrange(1, len - 3))) + "n't";
    else if ((a = (| verb_exceptions[string] |)))
        return a;
    return ._remove_s(string);
};

public method ._verb_singular() {
    arg string;
    var len, a;
    
    len = string.length();
    if ((len > 2) && match_regexp(string, "n't *$"))
        return (._verb_singular(string.subrange(1, len - 3))) + "n't";
    else if ((a = string in (verb_exceptions.values())))
        return (verb_excetions.keys())[a];
    return ._add_s(string, len);
};

public method .capitalize() {
    arg str;
    var m, word;
    
    // capitalize the first character of the first alphanumeric word found,
    // if it is not in the exceptions list.  Example:
    //
    //    $english_lib.capitalize(" @foo") => " @Foo"
    //
    if (!(m = regexp(str, "[a-z]+")))
        return str;
    word = (m[1]).capitalize();
    anticipate_assignment();
    return (word in capitalize_exceptions) ? str : strsed(str, "[a-z]+", word);
};

public method .compress_names() {
    arg names, @args;
    var c, x, n, ret;
    
    if (names == (c = names.compress()))
        return names.to_english(@args);
    ret = [];
    for x in (c) {
        if ((n = names.count(x)) > 1)
            ret += [((n.to_english_text()) + " ") + (._noun_plural(x.strip_article()))];
        else
            ret += [x];
    }
    return ret.to_english(@args);
};

public method .def_article() {
    arg string;
    
    // For completeness sake
    return "the";
};

public method .get_conjugation() {
    arg spec, @plural;
    var i, vb;
    
    i = "/" in (spec + "/");
    if (plural && (plural[1])) {
        if (i < (spec.length()))
            vb = spec.subrange(i + 1);
        else
            vb = ._verb_plural(spec);
    } else if (i > 1) {
        vb = spec.subrange(1, i - 1);
    } else {
        vb = ._verb_singular(spec.subrange(2));
    }
    if (strcmp("a", (i == 1) ? (spec[2]) : spec) > 0)
        return vb.capitalize();
    else
        return vb;
};

public method .get_noun() {
    arg spec, @plural;
    var i, vb;
    
    i = "/" in (spec + "/");
    if (plural && (plural[1])) {
        if (i < (spec.length()))
            vb = spec.subrange(i + 1);
        else
            vb = ._noun_plural(spec);
    } else if (i > 1) {
        vb = spec.subrange(1, i - 1);
    } else {
        vb = ._noun_singular(spec.subrange(2));
    }
    
    // just pass to $string.capitalize()?
    if (strcmp("a", (i == 1) ? (spec[2]) : spec) > 0)
        return vb.capitalize();
    else
        return vb;
};

public method .indef_article() {
    arg word;
    
    if ((((word[1]) in "aeiou") && (!(.vowel_exception(word)))) || (.nonvowel_exception(word)))
        return "an";
    else
        return "a";
};

public method .nonvowel_exception() {
    arg word;
    var prefix;
    
    return match_regexp(word, nonvowel_exceptions) ? 1 : 0;
};

public method .selector_word_default() {
    arg word, place;
    var tmp, item;
    
    if (word in ["everyone", "everybody"])
        return (place.contents()).mfilter('has_ancestor, $body);
    else
        return ((word in selector_words) && [get_var(tosym(word))]) || [];
};

public method .selector_words() {
    return selector_words;
};

public method .titleize() {
    arg string;
    var words;
    
    words = string.explode();
    if ((words.length()) < 2) {
        if (words)
            return string.capitalize();
        else
            return string;
    }
    return [(words[1]).capitalize(), @(words.subrange(2, (words.length()) - 2)).lmap('capitalize), (words[words.length()]).capitalize()].join();
};

public method .vowel_exception() {
    arg word;
    var prefix;
    
    return match_regexp(word, vowel_exceptions) ? 1 : 0;
};


