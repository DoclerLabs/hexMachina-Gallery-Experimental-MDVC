package example.module.gallery.view;

import example.module.gallery.model.IGalleryModelListener;
/**
 * @author Francis Bourre
 */
interface IGalleryDriver extends IGalleryModelListener
{
	function initialize() : Void;
}