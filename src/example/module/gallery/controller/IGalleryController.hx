package example.module.gallery.controller;

import example.module.gallery.vo.PhotoVO;
import hex.control.ICompletable;
import hex.mdvc.control.ICommandTrigger;

/**
 * @author Francis Bourre
 */
interface IGalleryController extends ICommandTrigger
{
	function initialize( galleryTitle : String ) : Void;
	function loadPhotos( galleryTitle : String ) : ICompletable<Array<PhotoVO>>;
}