
new object $help_heap: $help_obj;

var $has_name name = ['prop, "Heap", "Heap"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], 'do_p]>, "The heap is an efficient implementation of the priority queue. It is currently used by $scheduler and $graph. When you use it only in assignment calls (", <$format, ["tt", [], ["list = $heap.method(args)"], 'do_tt]>, ", in other words), it will operate in the logarithmic time (very fast).", <$format, ["p", [], [], 'do_p]>, "Heap is a list with the property that ", <$format, ["i", [], ["i"], 'do_i]>, "-th element of the list has lower priority than either ", <$format, ["i", [], ["2*i"], 'do_i]>, "-th and ", <$format, ["i", [], ["2*i+1"], 'do_i]>, "-st element of the list. Obviously, the first element of the list will have the lowest priority.", <$format, ["p", [], [], 'do_p]>, <$format, ["dl", [], [<$format, ["dt", [], [<$format, ["tt", [], ["$heap.push(heap, element, priority_index)"], 'do_tt]>], 'do_dt]>, <$format, ["dd", [], ["Add a new element to the heap. In this implementation, heap is assumed to be list of lists, with priority_index determining the priority field of each element."], 'do_dd]>, <$format, ["dt", [], [<$format, ["tt", [], ["$heap.del(heap, index, priority_index)"], 'do_tt]>], 'do_dt]>, <$format, ["dd", [], ["Delete an element at index ", <$format, ["i", [], ["i"], 'do_i]>, " of the heap. if index is greater than length of the heap, the method will throw."], 'do_dd]>], 'do_dl]>, <$format, ["p", [], [], 'do_p]>, "Both methods assume that their first argument already is a heap."], #[]]>;
var $help_node group = 1;
var $help_node index = $help_index_core;
var $help_node links = #[];
var $root created_on = 858400875;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$help_heap];
var $root manager = $help_heap;


