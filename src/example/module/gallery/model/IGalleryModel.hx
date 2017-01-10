package example.module.gallery.model;

import example.module.gallery.vo.PhotoVO;
import hex.mdvc.model.ITrigger;
import hex.mdvc.model.ITriggerOwner;

/**
 * @author Andrei Bunulu
 */
interface IGalleryModel extends ITriggerOwner
{
	var output( default, never ) : ITrigger<IGalleryContract>;
	
	function setGalleryTitle( galleryTitle : String ) : Void;
	function setPhotos( photos : Array<PhotoVO> ) : Void;
}