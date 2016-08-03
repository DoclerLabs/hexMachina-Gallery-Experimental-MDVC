package example.module.gallery;

import example.module.gallery.controller.GalleryController;
import example.module.gallery.controller.IGalleryController;
import example.module.gallery.model.GalleryModel;
import example.module.gallery.model.IGalleryModel;
import example.module.gallery.service.IGetPhotosService;
import example.module.gallery.view.GalleryDriver;
import example.module.gallery.view.IGalleryDriver;
import example.module.gallery.view.IGalleryView;
import hex.mdvtc.config.stateless.StatelessModuleConfig;
import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryModule extends Module implements IGalleryModule
{
	public function new( serviceConfig : hex.config.stateful.IStatefulConfig ) 
	{
		super();

		this.getLogger().info( "GalleryModule initialized" );
		this.buildView();

		this._addStatefulConfigs( [ serviceConfig ] );
		this._addStatelessConfigClasses( [ GalleryModuleConfig ] );
		
		//TODO remove
		var model = ( cast this._getDependencyInjector().getInstance( IGalleryModel ) );
		var viewHelper =  this._getDependencyInjector().getInstance( IGalleryDriver );
		model.dispatcher.addListener( viewHelper );
		viewHelper.initialize();

	}
	
	override function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd = new RuntimeDependencies();
		rd.addMappedDependencies( [ IGetPhotosService ] );
		return rd;
	}
	
	function buildView( ):Void
	{
		#if flash
			var container : flash.display.Sprite = new flash.display.Sprite();
			flash.Lib.current.addChild( container );
			this._getDependencyInjector().mapToValue( IGalleryView, new example.module.gallery.view.GalleryViewFlash( container ) );
		#elseif js
			this._getDependencyInjector().mapToValue( IGalleryView, new example.module.gallery.view.GalleryViewJS( js.Browser.document.querySelector( "#console" ) ) );
		#else 
			#error  // will display an error "Not implemented on this platform"
		#end
	}
}

private class GalleryModuleConfig extends StatelessModuleConfig
{
	override public function configure() : Void
	{
		this.mapModel( IGalleryModel, GalleryModel );
		this.mapController( IGalleryController, GalleryController );
		this.mapDriver( IGalleryDriver, GalleryDriver );
	}
}