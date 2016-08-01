package example.module.gallery.controller;

import example.module.gallery.vo.PhotoVO;
import hex.control.ICompletable;
import hex.mdvtc.control.ICommandTrigger;

/**
 * @author Francis Bourre
 */
interface IGalleryController extends ICommandTrigger
{
	function loadPhotos() : ICompletable<Array<PhotoVO>>;
}