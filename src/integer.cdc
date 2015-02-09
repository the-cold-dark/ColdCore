
new object $integer: $libraries;

var $integer ones = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"];
var $integer teens = ["eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"];
var $integer tens = ["ten", "twenty", "thirty", "fourty", "fifty", "sixty", "seventy", "eighty", "ninety"];
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'variables, 'core];
var $root help_node = $help_obj_integer;
var $root inited = 1;
var $root managed = [$integer];
var $root manager = $integer;

public method ._range_type() {
    arg type;
    
    switch (type) {
        case "0" .. "9":
            return toint(type);
        case "$":
            return 'end;
        case ".":
            return 'cur;
        case "#", "^":
            return 'bgn;
        default:
            throw(~invrange, ("Invalid range character \"" + type) + "\".", type);
    }
};

public method .and(): native;

public method .n_to_nth() {
    arg number;
    var tens_digit_is_1, ones_digit, single_digit;
    
    if (type(number) != 'integer)
        throw(~type, "Must receive an integer");
    ones_digit = abs(number) % 10;
    tens_digit_is_1 = ((abs(number) / 10) % 10) == 1;
    single_digit = abs(number) < 10;
    if ((ones_digit in [1, 2, 3]) && (!tens_digit_is_1)) {
        switch (ones_digit) {
            case 1:
                return tostr(number) + "st";
            case 2:
                return tostr(number) + "nd";
            case 3:
                return tostr(number) + "rd";
        }
    } else {
        return tostr(number) + "th";
    }
};

public method .not(): native;

public method .or(): native;

public method .parse_range() {
    arg range;
    var r1, r2, reg;
    
    if ("-" in range) {
        reg = regexp(range, "([0-9^#\.]+) *- *([0-9\$\.]+)");
        return [(> ._range_type(reg[1]) <), (> ._range_type(reg[2]) <)];
    } else {
        return [(> ._range_type(range) <), 'none];
    }
    
    // ("1-5") => (1, 5)      -- 1, 5
    // ("1-$") => (1, 'end)   -- 1, 'end (end number)
    // (".-3") => ('cur, 3)   -- 'cur (current number), 3
    // ("^-3") => ('bgn, 3)   -- 'bgn (beginning number), 3
    // ("#-3") => ('bgn, 3)   -- 'bgn (beginning number), 3
};

public method .range() {
    arg x, y;
    var element;
    
    return map element in [x .. y] to (element);
};

public method .roman_numeral_scheme() {
    arg val, x, y, z;
    var rnlist;
    
    rnlist = [x, x * 2, x * 3, x + y, y, y + x, y + (x * 2), y + (x * 3), x + z];
    return rnlist[val];
};

public method .shleft(): native;

public method .shright(): native;

public method .to_bytes() {
    arg num, @long;
    
    if (num > 1073741824)
        return strfmt("%.1l", num / 1.07374e+09) + (long ? " gigabytes" : " gb");
    else if (num > 1048576)
        return strfmt("%.1l", num / 1.04858e+06) + (long ? " megabytes" : " mb");
    else if (num > 1024)
        return strfmt("%.1l", num / 1024.0) + (long ? " kilobytes" : " kb");
    return num + (long ? " bytes" : " b");
};

public method .to_english() {
    arg num;
    var num_str, sign;
    
    // 12500 => "12,500"
    // if (abs(num) < 9999)
    //  return tostr(num);
    sign = num ? (abs(num) / num) : 1;
    num = abs(num);
    num_str = "";
    while (num > 999) {
        num_str = ("," + (tostr(1000 + (num % 1000)).subrange(2))) + num_str;
        num = num / 1000;
    }
    num_str = tostr(num) + num_str;
    return ((sign == 1) ? "" : "-") + num_str;
};

public method .to_english_text() {
    arg number;
    var an, isneg, temp;
    
    an = abs(number);
    isneg = (number < 0) ? "negative " : "";
    if (!number)
        return "zero";
    if (an < 11)
        return isneg + (ones[an]);
    if (an < 20)
        return isneg + (teens[an - 10]);
    if (an < 100)
        return (isneg + (tens[an / 10])) + ((temp = an % 10) ? ("-" + (temp.to_english_text())) : "");
    if (an < 1000)
        return ((isneg + (ones[an / 100])) + " hundred") + ((temp = an % 100) ? (" " + (temp.to_english_text())) : "");
    if (an < 1000000)
        return ((isneg + ((an / 1000).to_english_text())) + " thousand") + ((temp = an % 1000) ? (" " + (temp.to_english_text())) : "");
    if (an < 1000000000)
        return ((isneg + ((an / 1000000).to_english_text())) + " million") + ((temp = an % 1000000) ? (" " + (temp.to_english_text())) : "");
    return ((isneg + ((an / 1000000000).to_english_text())) + " billion") + ((temp = an % 1000000) ? (" " + (temp.to_english_text())) : "");
    
    // $#Written by: Kipp
};

public method .to_roman_numeral() {
    arg num;
    var str, neg, methstr;
    
    str = "";
    neg = "";
    
    // Handle negatives:
    if (num < 0) {
        neg = "negative ";
        num = abs(num);
    }
    if (num >= 1000000)
        return "Out of range";
    if (num >= 1000) {
        str = "M" * (num / 1000);
        num = num % 1000;
        if (num == 0)
            return str;
    }
    if (num >= 100) {
        str = str + ((num / 100).roman_numeral_scheme("C", "D", "M"));
        num = num % 100;
        if (num == 0)
            return str;
    }
    if (num >= 10) {
        str = str + ((num / 10).roman_numeral_scheme("X", "L", "C"));
        num = num % 10;
        if (num == 0)
            return str;
    }
    if (num > 0)
        str = str + (num.roman_numeral_scheme("I", "V", "X"));
    else if (!str)
        str = "";
    return neg + str;
};

public method .to_string() {
    arg number;
    
    return (> tostr(number) <);
};

public method .xor(): native;


