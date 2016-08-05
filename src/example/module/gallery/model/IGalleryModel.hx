package example.module.gallery.model;

import example.module.gallery.vo.PhotoVO;
import hex.mdvtc.model.IOutputOwner;

/**
 * @author Andrei Bunulu
 */
interface IGalleryModel extends IOutputOwner
{
	/*@Dispatcher
	var dispatcher : IGalleryModelListener;*/
	
	function setGalleryTitle( galleryTitle : String ) : Void;
	function setPhotos( photos : Array<PhotoVO> ) : Void;
}