package com.scaleform.hud {
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	import flash.utils.getDefinitionByName;

	public class MOBASpellIcon extends MovieClip {

		// Constructor code
		public function MOBASpellIcon() {
			super();
		}

		// Change spell image - called from Unreal Script
		public function setSpellIconImage(iconimagename:String):void {
			removeChildAt(0);

			var spellimage:Bitmap = new Bitmap();
			var iconimageclass:Class = getDefinitionByName(iconimagename) as Class;
			var iconinstance:BitmapData = new iconimageclass(128, 128);

			spellimage.bitmapData = iconinstance;
			addChild(spellimage);
		}
	}
}
