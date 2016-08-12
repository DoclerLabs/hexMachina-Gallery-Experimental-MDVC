package example.module.gallery.view;

import example.module.gallery.controller.IGalleryController;
import example.module.gallery.model.IGalleryContract;
import example.module.gallery.vo.PhotoVO;
import hex.di.IInjectorContainer;
import hex.mdvc.driver.IInput;
import hex.mdvc.driver.IInputOwner;
import hex.mdvc.driver.Input;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryDriver implements IGalleryDriver implements IInputOwner implements IInjectorContainer
{
	@Input
	public var input : IInput<IGalleryContract>;
	
	@Inject
	var _view : IGalleryView;
	
	@Inject
	var _controller : IGalleryController;
	
	public function new() 
	{
		
	}
	
	public function onInitializeGallery( galleryTitle : String ) : Void
	{
		this._controller.loadPhotos( galleryTitle ).onComplete( this.onPhotosLoaded );
	}
	
	public function onPhotosLoaded( photos : Array<PhotoVO> ) : Void
	{
		this._view.setPhotos( photos );
		this.input.switchOff();
	}
}