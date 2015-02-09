
new object $password: $word;

var $root created_on = 856543004;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$password];
var $root manager = $password;
var $word firstcons = #[["b", 50], ["c", 100], ["d", 150], ["bd", 160], ["f", 210], ["g", 260], ["h", 310], ["j", 360], ["k", 410], ["l", 460], ["m", 510], ["n", 560], ["p", 610], ["qu", 640], ["q", 650], ["r", 700], ["s", 750], ["t", 800], ["v", 803], ["w", 813], ["x", 814], ["y", 821], ["z", 822], ["th", 847]];
var $word lastcons = #[];
var $word syllable_pat = #[[["V"], 2], [["V", "C"], 7], [["C", "V"], 12], [["C", "V", "C"], 13]];
var $word syllables = #[[3, 1], [4, 2]];
var $word vowels = #[["a", 500], ["aa", 501], ["ae", 547], ["ai", 585], ["ao", 587], ["au", 621], ["ah", 629], ["ay", 643], ["e", 1143], ["ea", 1242], ["ee", 1281], ["ei", 1307], ["eo", 1348], ["eu", 1376], ["ey", 1384], ["i", 1884], ["ia", 2034], ["ie", 2073], ["ii", 2077], ["io", 2229], ["iu", 2246], ["o", 2646], ["oa", 2670], ["oe", 2687], ["oi", 2727], ["ou", 2855], ["oy", 2860], ["u", 2985], ["ua", 3012], ["ue", 3031], ["ui", 3056], ["y", 3101]];

public method .generate() {
    var out, v, c;
    
    return lowercase(pass());
    out = lowercase(pass());
    for v in [1 .. strlen(out)] {
        if (random(4) == 1) {
            if (random(2) == 1) {
                c = uppercase(out[v]);
                out = (substr(out, 1, v - 1) + c) + substr(out, v + 1);
            } else {
                out = (substr(out, 1, v) + (random(10) - 1)) + substr(out, v + 1);
            }
        }
    }
    return out;
};


