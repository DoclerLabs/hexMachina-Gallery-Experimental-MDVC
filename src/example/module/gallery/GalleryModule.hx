package example.module.gallery;

import example.module.gallery.controller.GalleryController;
import example.module.gallery.controller.IGalleryController;
import example.module.gallery.model.GalleryModel;
import example.module.gallery.model.IGalleryModel;
import example.module.gallery.service.IGetPhotosService;
import example.module.gallery.view.GalleryDriver;
import example.module.gallery.view.IGalleryDriver;
import example.module.gallery.view.IGalleryView;
import hex.mdvc.config.stateless.StatelessModuleConfig;
import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryModule extends Module implements IGalleryModule
{
	public function new( serviceConfig : hex.config.stateful.IStatefulConfig, viewConfig : hex.config.stateful.IStatefulConfig ) 
	{
		super();

		this.getLogger().info( "GalleryModule initialized" );

		this._addStatefulConfigs( [ serviceConfig, viewConfig ] );
		this._addStatelessConfigClasses( [ GalleryModuleConfig ] );
	}
	
	override function _onInitialisation() : Void 
	{
		super._onInitialisation();
		this._get( IGalleryController ).initialize( "Docler Gallery" );
	}
	
	override function _getRuntimeDependencies() : IRuntimeDependencies
	{
		var rd = new RuntimeDependencies();
		rd.addMappedDependencies( [ IGetPhotosService ] );
		return rd;
	}
}

private class GalleryModuleConfig extends StatelessModuleConfig
{
	override public function configure() : Void
	{
		this.mapController( IGalleryController, GalleryController );
		this.mapModel( IGalleryModel, GalleryModel );
		this.mapDriver( IGalleryDriver, GalleryDriver );
		
		this.get( IGalleryDriver ).input.plug( this.get( IGalleryModel ).output );
	}
}