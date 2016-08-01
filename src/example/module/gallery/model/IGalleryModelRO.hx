package example.module.gallery.model;

import example.module.gallery.vo.PhotoVO;
import hex.model.IModelRO;

/**
 * @author Francis Bourre
 */
interface IGalleryModelRO extends IModelRO<IGalleryModelListener>
{
	function getPhotos() : Array<PhotoVO>;
}