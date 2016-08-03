package example.module.gallery.view;

import example.module.gallery.controller.IGalleryController;
import example.module.gallery.model.IGalleryModelListener;
import example.module.gallery.model.IGalleryModelRO;
import example.module.gallery.vo.PhotoVO;
import hex.di.IInjectorContainer;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryDriver implements IGalleryDriver implements IInjectorContainer
{
	//var _modelDispatcher : IDispatcher<IGalleryModelListener>;
	
	@Inject
	var _model : IGalleryModelRO;
	
	@Inject
	var _view : IGalleryView;
	
	@Inject
	var _controller : IGalleryController;
	
	@Listen( example.module.gallery.model.IGalleryModelListener )
	public function new() 
	{
		
	}
	
	public function initialize() : Void
	{
		trace( this._controller );
		this._controller.loadPhotos().onComplete( this.onPhotosLoaded );
	}
	
	/*override function _initialize() : Void 
	{
		super._initialize();
		
		//TODO implementation
		//this._modelDispatcher.addListener( this );
		
		//this._model.addListener( this );
		this._controller.loadPhotos().onComplete( this.onPhotosLoaded );
	}*/
	
	public function onPhotosLoaded( photos : Array<PhotoVO> ) : Void
	{
		//this.getLogger().info( "onPhotosLoaded" );
		this._view.setPhotos( photos );
	}
}