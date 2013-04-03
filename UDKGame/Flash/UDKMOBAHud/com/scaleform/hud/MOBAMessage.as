package com.scaleform.hud 
{
	import flash.display.MovieClip;

	public class MOBAMessage extends MovieClip 
	{		
		protected var _hasExpired:Boolean = false;
		
		// Constructor code
		public function MOBAMessage() 
		{
			super();
		}
		
		public function get hasExpired():Boolean
		{
			return _hasExpired;
		}

		public function set hasExpired(value:Boolean):void
		{
			_hasExpired = value;
		}
	}
}
