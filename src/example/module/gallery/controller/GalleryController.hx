package example.module.gallery.controller;

import example.module.gallery.model.IGalleryModel;
import example.module.gallery.vo.PhotoVO;
import hex.control.ICompletable;
import hex.mdvc.control.CommandTrigger;

/**
 * ...
 * @author Francis Bourre
 */
class GalleryController extends CommandTrigger implements IGalleryController
{
	@Inject
	var _model : IGalleryModel;
	
	public function initialize( galleryTitle : String ) : Void
	{
		this._model.setGalleryTitle( galleryTitle );
	}
	
	@Map( example.module.gallery.controller.LoadPhotosCommand )
	public function loadPhotos( galleryTitle : String ) : ICompletable<Array<PhotoVO>> {}
}