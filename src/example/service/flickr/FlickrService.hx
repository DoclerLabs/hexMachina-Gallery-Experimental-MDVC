package example.service.flickr;

import example.module.gallery.service.IGetPhotosService;
import example.module.gallery.vo.PhotoVO;
import hex.control.ICompletable;
import hex.mdvc.control.HttpRequest;

/**
 * ...
 * @author Francis Bourre
 */
class FlickrService extends HttpRequest<Array<PhotoVO>> implements IGetPhotosService
{
	public function new() 
	{
		super( "https://api.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&api_key=bdeda660a5fcdf79170c711c07156f12&user_id=134406781%40N06&format=json" );
		this.setParser( new FlickrParser() );
	}
	
	public function getPhotos() : ICompletable<Array<PhotoVO>>
	{
		return this.execute();
	}
}