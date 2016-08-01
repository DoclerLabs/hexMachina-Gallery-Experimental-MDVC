package example.module.gallery.controller;

import example.module.gallery.vo.PhotoVO;
import hex.control.ICompletable;
import hex.mdvtc.control.CommandTrigger;

/**
 * ...
 * @author Francis Bourre
 */
class GalleryController extends CommandTrigger implements IGalleryController
{
	@Map( example.module.gallery.controller.LoadPhotosOrder )
	public function loadPhotos() : ICompletable<Array<PhotoVO>> {}
}