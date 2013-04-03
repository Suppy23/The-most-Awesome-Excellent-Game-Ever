package com.scaleform.hud
{
	import scaleform.clik.controls.ListItemRenderer;
	import scaleform.clik.constants.InvalidationType;
	import scaleform.clik.events.ComponentEvent;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextField;
	import flash.display.MovieClip;

	public class MOBAShopListItemRenderer extends ListItemRenderer
	{
		// Protected Properties:
		protected var _cost:Number = 0;
		protected var _iconName:String = "";

		// Public Properties:
		public var costTextField:TextField;
		public var iconMovieClip:MovieClip;

		// Constructor code
		public function MOBAShopListItemRenderer()
		{
			super();
		}

		public function get cost():Number
		{
			return _cost;
		}

		public function set cost(value:Number):void
		{
			if (_cost == value)
			{
				return;
			}
			_cost = value;
			invalidateData();
		}

		protected function updateCostText():void
		{
			if (costTextField != null)
			{
				costTextField.text = "$" + _cost;
			}
		}

		public function get iconName():String
		{
			return _iconName;
		}

		public function set iconName(value:String):void
		{
			if (_iconName == value)
			{
				return;
			}
			_iconName = value;
			invalidateData();
		}

		protected function updateIconName():void
		{
			if (iconMovieClip != null && iconMovieClip.currentFrameLabel != _iconName)
			{
				iconMovieClip.gotoAndStop(_iconName);
			}
		}

		override protected function draw():void
		{
			// State is invalid, and has been set (is not the default)
			if (isInvalid(InvalidationType.STATE))
			{
				if (_newFrame)
				{
					gotoAndPlay(_newFrame);
					_newFrame = null;
				}

				if (_newFocusIndicatorFrame)
				{
					focusIndicator.gotoAndPlay(_newFocusIndicatorFrame);
					_newFocusIndicatorFrame = null;
				}

				updateAfterStateChange();
				dispatchEvent(new ComponentEvent(ComponentEvent.STATE_CHANGE));
				// NFM: Should size be invalidated here by default? It can cause problems with timeline animations, 
				//      especially with focusIndictators that extend beyond the size of the original MovieClip. Instead, 
				//      perhaps let subclasses call invalidate(InvalidationType.SIZE) as necessary instead.
				invalidate(InvalidationType.DATA, InvalidationType.SIZE);
			}

			// Data is invalid when label or autoSize changes.
			if (isInvalid(InvalidationType.DATA))
			{
				// the label has data embedded into it which is separated by a commas
				var data:Array = _label.split(",");
				if (data.length == 3)
				{
					_label = data[0];
					_cost = data[1];
					_iconName = data[2];
				}
				updateText();
				updateCostText();
				updateIconName();

				if (autoSize != TextFieldAutoSize.NONE)
				{
					invalidateSize();
				}
			}

			// Resize and update constraints
			if (isInvalid(InvalidationType.SIZE))
			{
				if (! preventAutosizing)
				{
					alignForAutoSize();
					setActualSize(_width, _height);
				}
				if (! constraintsDisabled)
				{
					constraints.update(_width, _height);
				}
			}
		}
	}
}