package example.module.gallery.model;

import example.module.gallery.vo.PhotoVO;
import hex.mdvtc.model.IOutput;
import hex.mdvtc.model.IOutputOwner;

/**
 * @author Andrei Bunulu
 */
interface IGalleryModel extends IOutputOwner
{
	var output( default, never ) : IOutput<IGalleryContract>;
	
	function setGalleryTitle( galleryTitle : String ) : Void;
	function setPhotos( photos : Array<PhotoVO> ) : Void;
}