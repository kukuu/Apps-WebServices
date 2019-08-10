<?php 

// Alexander Adu-Sarkodie
//This is a  prototypical imlementation
//The XML is inserted further below as a string
// Parts of the application can be extrapulated as includes to facilitate re-usability

class XmlElement {
  var $name;
  var $attributes;
  var $content;
  var $children;
};

function xml_to_object($xml) {
  $parser = xml_parser_create();
  xml_parser_set_option($parser, XML_OPTION_CASE_FOLDING, 0);
  xml_parser_set_option($parser, XML_OPTION_SKIP_WHITE, 1);
  xml_parse_into_struct($parser, $xml, $tags);
  xml_parser_free($parser);

  $elements = array();  // the currently filling [child] XmlElement array
  $stack = array();

  foreach ($tags as $tag) {
    $index = count($elements);
    if ($tag['type'] == "complete" || $tag['type'] == "open") {
      $elements[$index] = new XmlElement;
      $elements[$index]->name = $tag['tag'];
      $elements[$index]->attributes = $tag['attributes'];
      $elements[$index]->content = $tag['value'];
      if ($tag['type'] == "open") {  // push
        $elements[$index]->children = array();
        $stack[count($stack)] = &$elements;
        $elements = &$elements[$index]->children;
      }
    }
    if ($tag['type'] == "close") {  // pop
      $elements = &$stack[count($stack) - 1];
      unset($stack[count($stack) - 1]);
    }
  }

  return $elements[0];  // the single top-level element
}

// Inserting XML here, as a string:
$xml = '
<parser>
<?xml version="1.0" encoding="UTF-8" ?>
<movies>
    <movie>
        <name>Guardians of the Galaxy</name>
        <year>2014</year>
        <actors>
            <actor>
                <name>Bradley Cooper</name>
                <email>b.cooper@yahoo.com</email>
            </actor>
        </actors>
    </movie>
    <movie serie="yes">
        <name>Spectre</name>
        <year>2015</year>
        <actors>
            <actor>
                <name>Daniel Craig</name>
                <email>d.craig@yahoo.com</email>
            </actor>
            <actor>
                <name>Christoph Waltz</name>
                <email>c.waltz@bbc.co.uk</email>
            </actor>
        </actors>
    </movie>
    <movie serie="no">
        <name>Pixels James</name>
        <email>p.jamesr@picoloo.com</email>
        <year>2015</year>
        <actors>
            <actor>
                <name>Adam Sandler</name>
                <email>a.sandler@gmail.com</email>
            </actor>
        </actors>
    </movie>
</movies>
';
print_r(xml_to_object($xml));
?>
