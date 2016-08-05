package example.module.gallery.model;

import example.module.gallery.vo.PhotoVO;

/**
 * @author Andrei Bunulu
 */
interface IGalleryContract
{
	function onInitializeGallery( galleryTitle : String ) : Void;
	function onPhotosLoaded( photos : Array<PhotoVO> ) : Void;
}