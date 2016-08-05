package example.module.gallery.controller;

import example.module.gallery.service.IGetPhotosService;
import example.module.gallery.vo.PhotoVO;
import hex.di.IInjectorContainer;
import hex.mdvtc.control.Command;

/**
 * ...
 * @author Francis Bourre
 */
class LoadPhotosCommand extends Command<Array<PhotoVO>> implements IInjectorContainer
{
	@Inject
	public var photosService : IGetPhotosService;

	public function execute() : Void 
	{
		photosService.getPhotos().onComplete( this._complete ).onFail( this._fail );
	}
}