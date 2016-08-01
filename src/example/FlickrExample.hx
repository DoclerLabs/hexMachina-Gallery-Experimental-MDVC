package example;

import hex.compiler.parser.xml.XmlCompiler;

/**
 * ...
 * @author duke
 */
@:expose( "FlickrExample" )
class FlickrExample
{
	static var self : FlickrExample;

	static public function main() : Void
	{
		#if debug
			var proxy : hex.log.layout.LogProxyLayout = new hex.log.layout.LogProxyLayout();
			#if js
			var controller = new hex.log.layout.LogLayoutHTMLView( proxy );
			proxy.addListener( new hex.log.layout.SimpleBrowserLayout( controller.consoleWrapperTaget ) );
			proxy.addListener( new hex.log.layout.JavaScriptConsoleLayout() );
			#elseif flash
			proxy.addListener( new hex.log.layout.TraceLayout() );
			#end
		#end
		
		XmlCompiler.readXmlFile( "example/configuration/context.xml" );
	}
}