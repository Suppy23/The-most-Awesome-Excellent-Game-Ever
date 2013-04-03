package com.scaleform.hud {
	import flash.display.MovieClip;
	import flash.display.Graphics;
	import flash.display.Shape;
	
	public class MOBAMinimapLineDrawing extends MovieClip {

		// Constructor code
		public function MOBAMinimapLineDrawing() {
			super();
		}
		
		// Draw a line - Called by Unrealscript
		public function drawLine(x1:Number, y1:Number, x2:Number, y2:Number, r:Number, g:Number, b:Number, a:Number):void {
			graphics.lineStyle(2, r << 16 | g << 8 | b, a / 255);
			graphics.moveTo(x1, y1); 
			graphics.lineTo(x2, y2);
		}
		
		// Clears a line - Called by Unrealscript
		public function clear(): void {
			graphics.clear();
		}
	}
}