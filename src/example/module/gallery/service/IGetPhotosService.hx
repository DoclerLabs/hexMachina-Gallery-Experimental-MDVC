package example.module.gallery.service;

import example.module.gallery.vo.PhotoVO;
import hex.control.ICompletable;

/**
 * @author Francis Bourre
 */
interface IGetPhotosService 
{
	function getPhotos() : ICompletable<Array<PhotoVO>>;
}