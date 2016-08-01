package example.module.gallery;

import example.module.gallery.controller.GalleryController;
import example.module.gallery.controller.IGalleryController;
import example.module.gallery.model.GalleryModel;
import example.module.gallery.model.IGalleryModel;
import example.module.gallery.service.IGetPhotosService;
import example.module.gallery.view.GalleryViewHelper;
import hex.config.stateful.IStatefulConfig;
import hex.config.stateless.StatelessModuleConfig;
import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryModule extends Module implements IGalleryModule
{
	public function new( serviceConfig : IStatefulConfig ) 
	{
		super();

		this.getLogger().info( "GalleryModule initialized" );

		this._addStatefulConfigs( [ serviceConfig ] );
		this._addStatelessConfigClasses( [ GalleryModuleConfig ] );
		this.buildView();
	}
	
	override function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd = new RuntimeDependencies();
		rd.addMappedDependencies( [ IGetPhotosService ] );
		return rd;
	}
	
	function buildView( ):Void
	{
		var viewHelper : GalleryViewHelper = null;
		
		#if flash
			var container : flash.display.Sprite = new flash.display.Sprite();
			flash.Lib.current.addChild( container );
			this.buildViewHelper( GalleryViewHelper, new example.module.gallery.view.GalleryViewFlash(container) );
		#elseif js
			this.buildViewHelper( GalleryViewHelper, new example.module.gallery.view.GalleryViewJS( js.Browser.document.querySelector("#console") ) );
		#else 
			#error  // will display an error "Not implemented on this platform"
		#end
		
		/*var model = ( cast this._getDependencyInjector().getInstance( IGalleryModel ) );
		model.dispatcher.addListener( viewHelper );*/
	}
}

private class GalleryModuleConfig extends StatelessModuleConfig
{
	override public function configure() : Void
	{
		this.mapModel( IGalleryModel, GalleryModel );
		this.mapController( IGalleryController, GalleryController );
	}
}