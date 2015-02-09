
new object $rtree: $frob;

var $root created_on = 843361817;
var $root credit = ["Miroslav Silovic <silovic@zesoi.fer.hr>"];
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$rtree];
var $root manager = $rtree;
var $rtree max_length = 4;

public method ._delete() {
    arg self, key, point;
    var i, trees, boxes, ret, l, b, mod, box;
    
    if ((self.length()) == 1) {
        if (self == key)
            return [0, 1, 0];
        else
            return [self, 0, 0];
    }
    trees = self[2];
    boxes = self[1];
    l = [];
    b = [];
    mod = 0;
    for i in [1 .. boxes.length()] {
        if ($rect.inside(point, boxes[i])) {
            ret = ._delete(trees[i], key, point);
            if ((ret[1]) == 0) {
                mod = 1;
                continue;
            }
            l += [ret[1]];
            mod = mod || (ret[2]);
            b += [(ret[3]) ? (ret[3]) : (boxes[i])];
        } else {
            l += [trees[i]];
            b += [boxes[i]];
        }
    }
    if (!l)
        return [0, 1];
    if (mod) {
        box = b[1];
        for i in (b.subrange(2))
            box = box.union(i);
        return [[b, l], 1, box];
    }
    return [self, 0, 0];
};

public method ._insert() {
    arg tree, box, obj;
    var u, ret, xret, boxes, trees;
    
    trees = tree[2];
    boxes = tree[1];
    if (((trees[1]).length()) == 1) {
        // add leaf node to boxes and trees
        if ((trees.length()) < max_length) {
            return [[boxes + [box], trees + [obj]]];
        } else {
            // return two nodes:
            return ._split(boxes + [box], trees + [obj]);
        }
    } else {
        u = ._insert_where(boxes, box);
        ret = ._insert(trees[u], box, obj);
        if ((ret.length()) == 1)
            return [[boxes.replace(u, $rect.union(box, boxes[u])), trees.replace(u, ret[1])]];
        else if ((trees.length()) < max_length)
            return [[(boxes.delete(u)) + (ret.slice(3)), (trees.delete(u)) + [[(ret[1])[1], (ret[1])[2]], [(ret[2])[1], (ret[2])[2]]]]];
        else
            return ._split((boxes.delete(u)) + (ret.slice(3)), (trees.delete(u)) + [[(ret[1])[1], (ret[1])[2]], [(ret[2])[1], (ret[2])[2]]]);
    }
};

public method ._insert_where() {
    arg rlist, new;
    var i, u, min, t;
    
    u = 0;
    min = 1e+27;
    for i in [1 .. rlist.length()] {
        if ((t = $rect.rect_size($rect.union(rlist[i], new))) < min) {
            min = t;
            u = i;
        }
    }
    return u;
};

public method ._split() {
    arg rlist, nlist;
    var i, j, m1, m2, r1, r2, l1, l2, n1, n2, len, min, seed1, seed2, min1, box;
    
    // First find the two rects that unioned create the greatest size...
    len = rlist.length();
    min = 1e+27;
    for i in [1 .. len - 1] {
        for j in [i + 1 .. len] {
            if (min > (min1 = $rect.rect_size($rect.union(rlist[i], rlist[j])))) {
                min = min1;
                seed1 = i;
                seed2 = j;
            }
        }
    }
    l1 = [(r1 = rlist[seed1])];
    l2 = [(r2 = rlist[seed2])];
    n1 = [nlist[seed1]];
    n2 = [nlist[seed2]];
    rlist = rlist.delete(seed2);
    rlist = rlist.delete(seed1);
    nlist = nlist.delete(seed2);
    nlist = nlist.delete(seed1);
    
    // Now add to the list that shows lower increase in size
    // l1,l2 are rectangle lists, n1,n2 are node lists, and r1, r2 are
    // current bounding rectangles
    for i in [1 .. rlist.length()] {
        box = rlist[i];
        m1 = $rect.union(r1, box);
        m2 = $rect.union(r2, box);
        if (($rect.rect_size(m1)) < ($rect.rect_size(m2))) {
            r1 = m1;
            l1 += [box];
            n1 += [nlist[i]];
        } else {
            r2 = m2;
            l2 += [box];
            n2 += [nlist[i]];
        }
    }
    return [[l1, n1, r1], [l2, n2, r2]];
};

public method .delete() {
    arg self, point, box;
    var ret;
    
    ret = ._delete(self, point, box);
    return (ret[1]) ? (<this(), (ret[1])>) : (.empty());
};

public method .insert() {
    arg self, box, obj;
    var ret;
    
    if (!(self[1]))
        return (<$rtree, [[box], [obj]]>);
    ret = ._insert(self, box, obj);
    if ((ret.length()) == 1)
        return (<$rtree, (ret[1])>);
    else
        return (<$rtree, [ret.slice(3), [[(ret[1])[1], (ret[1])[2]], [(ret[2])[1], (ret[2])[2]]]]>);
};

public method .new() {
    return (<$rtree, [[], []]>);
};

public method .search() {
    arg self, point;
    var boxes, trees, i, l;
    
    if ((self.length()) == 1)
        return self;
    boxes = self[1];
    trees = self[2];
    l = [];
    for i in [1 .. boxes.length()] {
        if ($rect.inside(point, boxes[i]))
            l += .search(trees[i], point);
    }
    return l;
};


