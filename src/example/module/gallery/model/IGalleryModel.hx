package example.module.gallery.model;

import example.module.gallery.vo.PhotoVO;
import hex.mdvc.model.IOutput;
import hex.mdvc.model.IOutputOwner;

/**
 * @author Andrei Bunulu
 */
interface IGalleryModel extends IOutputOwner
{
	var output( default, never ) : IOutput<IGalleryContract>;
	
	function setGalleryTitle( galleryTitle : String ) : Void;
	function setPhotos( photos : Array<PhotoVO> ) : Void;
}