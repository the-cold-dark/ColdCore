
new object $itext: $has_text;

var $has_text text = ["hello", "this", "world"];
var $itext all_text = #[["foo", [["hello", "world"], ""]], ["bar", [["hello", "this", "world"], ""]]];
var $itext current = "foo";
var $root created_on = 796268969;
var $root flags = ['methods, 'code, 'fertile, 'variables, 'core];
var $root inited = 1;
var $root managed = [$itext];
var $root manager = $itext;

public method .current() {
    return current;
};

public method .get_desc() {
    arg topic, @who;
    
    if (topic in (all_text.keys()))
        return (all_text[topic])[2];
    else
        throw(~topicnf, ("Topic " + topic) + " not found.");
};

public method .get_topic() {
    arg topic, @who;
    
    if (topic in (all_text.keys()))
        return (all_text[topic])[1];
    else
        throw(~topicnf, ("Topic " + topic) + " not found.");
};

root method .init_itext() {
    current = "";
    all_text = #[];
};

public method .set_current() {
    arg topic;
    
    current = topic;
    if (topic in (all_text.keys()))
        .set_text((all_text[topic])[1]);
    else
        .set_text([]);
};

public method .set_desc() {
    arg desc, @topic;
    
    // set the description for a topic
    // The description is a short text string meant for use in an index
    // if <topic> is not given assume current
    [(topic ?= current)] = topic;
    if (topic in (all_text.keys()))
        all_text = all_text.add(topic, (all_text[topic]).replace(2, short_desc));
    else
        throw(~topicnf, ("Topic " + topic) + " not found.");
};

public method .store() {
    arg @topic;
    
    [(topic ?= current)] = topic;
    if (!(topic in (all_text.keys())))
        all_text = all_text.add(topic, [.text(), ""]);
    all_text = all_text.add(topic, (all_text[topic]).replace(1, .text()));
};

public method .topics() {
    return all_text.keys();
};


