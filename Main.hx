
import Sys.println;

import js.JQuery;
import js.node.Http;

using StringTools;

class Main {

    public static function main():Void {

        println("HELLO FROM MAIN (node)");

        get_contents('http://www.nodegit.org/api/', function(html) {
            extract_modules(html);
        });

    } //main

    static function get_contents(url:String, callback:String->Void):Void {

        var data:String = '';

        Http.get('http://www.nodegit.org/api/', function(response) {
            response.on('data', function(chunk:Dynamic) {
                data += chunk;
            });
            response.on('end', function() {
                callback(data.substring(data.indexOf("<body>")+6, data.lastIndexOf("</body>")));
            });
        });

    } //get_contents

    static function extract_modules(html:String):Void {

        println(new JQuery('<div>'+html+'</div>'.replace("\n",' ')).text());

    } //extract_modules

}
