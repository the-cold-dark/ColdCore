
new object $graph: $libraries;

var $root created_on = 848800783;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$graph];
var $root manager = $graph;

public method .breadth_search() {
    arg node, data, neighbors, is_dest;
    var d, i, j, path;
    
    d = #[[node, 'source]];
    i = 1;
    while ((i <= ((d.keys()).length())) && (!(node = (d.keys())[i++]).(is_dest)(data))) {
        refresh();
        for j in (node.(neighbors)())
            d = d.add(j, node);
    }
    if (i <= ((d.keys()).length())) {
        refresh();
        path = [node];
        while ((node = d[node]) != 'source)
            path += [node];
        return path;
    } else {
        return 0;
    }
};

public method .topological_sort() {
    arg list, comparator;
    var i, j;
    
    i = list.length();
    while (i >= 1) {
        j = 2;
        while (j <= i) {
            if ((list[j - 1]).(comparator)(list[j]))
                list = list.swap(j - 1, j);
            refresh();
            j++;
        }
        i--;
    }
    return list;
};


