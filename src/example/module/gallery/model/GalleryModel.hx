package example.module.gallery.model;

import example.module.gallery.model.IGalleryContract;
import example.module.gallery.vo.PhotoVO;
import hex.mdvc.model.ITrigger;

/**
 * ...
 * @author Andrei Bunulu
 */
class GalleryModel implements IGalleryModel
{
	@Trigger
	public var output( default, never ) : ITrigger<IGalleryContract>;
	
	var _photos : Array<PhotoVO>;
	
	public function new() 
	{
		
	}
	
	public function setGalleryTitle( galleryTitle : String ) : Void
	{
		this.output.onInitializeGallery( galleryTitle );
	}
	
	public function setPhotos( photos : Array<PhotoVO> ) : Void 
	{
		this._photos = photos;
		this.output.onPhotosLoaded( this._photos );
	}
	
	public function getPhotos() : Array<PhotoVO> 
	{
		return this._photos;
	}
}