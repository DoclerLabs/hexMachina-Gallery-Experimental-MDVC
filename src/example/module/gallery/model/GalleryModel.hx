package example.module.gallery.model;

import example.module.gallery.model.IGalleryModelListener;
import example.module.gallery.vo.PhotoVO;
import hex.mdvtc.model.IDispatcherOwner;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryModel implements IDispatcherOwner implements IGalleryModel
{
	@Dispatcher
	public var dispatcher : IGalleryModelListener;
	
	var _photos : Array<PhotoVO>;
	
	public function new() 
	{
		
	}
	
	public function addListener( listener : IGalleryModelListener ) : Void
	{
		this.dispatcher.addListener( listener );
	}
	
	public function removeListener( listener : IGalleryModelListener ) : Void
	{
		this.dispatcher.removeListener( listener );
	}
	
	public function setPhotos( photos : Array<PhotoVO> ) : Void 
	{
		this._photos = photos;
		this.dispatcher.onPhotosLoaded( this._photos );
	}
	
	public function getPhotos() : Array<PhotoVO> 
	{
		return this._photos;
	}
}