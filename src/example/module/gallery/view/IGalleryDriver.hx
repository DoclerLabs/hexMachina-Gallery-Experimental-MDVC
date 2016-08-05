package example.module.gallery.view;

import example.module.gallery.model.IGalleryContract;
import hex.mdvtc.driver.IInput;

/**
 * @author Francis Bourre
 */
interface IGalleryDriver extends IGalleryContract
{
	var input : IInput<IGalleryContract>;
}