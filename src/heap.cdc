
new object $heap: $libraries;

var $root created_on = 848818545;
var $root credit = ["Miroslav Silovic <silovic@zesoi.fer.hr>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root help_node = $help_heap;
var $root inited = 1;
var $root managed = [$heap];
var $root manager = $heap;

public method .del() {
    arg heap, i, priority_ind;
    var j, len, min;
    
    len = listlen(heap);
    if (i > len)
        throw(~invarg, "Index %d out of bounds - can't delete".format(i));
    anticipate_assignment();
    while (i != len) {
        min = len;
        j = i * 2;
        if ((j < len) && (((heap[j])[priority_ind]) < ((heap[min])[priority_ind])))
            min = j;
        j++;
        if ((j < len) && (((heap[j])[priority_ind]) < ((heap[min])[priority_ind])))
            min = j;
        heap = replace(heap, i, heap[min]);
        i = min;
    }
    heap = heap.subrange(1, len - 1);
    return heap;
};

public method .push() {
    arg heap, element, priority_ind;
    var i, j;
    
    i = listlen(heap) + 1;
    if (i == 1)
        return [element];
    anticipate_assignment();
    heap += [0];
    while ((i > 1) && ((element[priority_ind]) < ((heap[(j = i / 2)])[priority_ind])))
        heap = replace(heap, i, heap[(i = j)]);
    heap = heap.replace(i, element);
    return heap;
};


