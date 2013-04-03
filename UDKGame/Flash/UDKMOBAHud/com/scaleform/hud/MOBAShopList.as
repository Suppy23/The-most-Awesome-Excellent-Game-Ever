package com.scaleform.hud
{
	import scaleform.clik.controls.ScrollingList;
	import scaleform.clik.data.DataProvider;

	public class MOBAShopList extends ScrollingList
	{
		// Constructor code
		public function MOBAShopList()
		{
			super();
		}

		// Initialize the data provider
		override protected function initialize():void
		{
			super.initialize();
			dataProvider = new DataProvider(new Array());
		}

		// Add an item to the shop
		public function addShopItem(Label:String, Cost:Number, IconName:String):void
		{
			var list:Array = dataProvider as Array;
			list.push({label:Label+","+Cost+","+IconName, index:list.length});
			invalidateData();
		}
		
		// Remove an item from the shop
		public function removeShopItem(Label:String):void
		{
			var list:Array = dataProvider as Array;
			var i:Number;
			var s:String;
			
			for (i = 0; i < list.length; i++)
			{				
				s = list[i]["label"];
				if (s.substring(0, Label.length) == Label)
				{
					list.splice(i, 1);
					break;
				}
			}
			
			invalidateData();
		}
		
		// Remove all items from the shop
		public function removeAll():void
		{
			var list:Array = dataProvider as Array;
			list.splice(0, list.length);
			invalidateData();
		}
		
		// Remove all items from the shop that don't match the input
		public function removeNotMatching(Match:String):void
		{
			var list:Array = dataProvider as Array;
			var i:Number;
			var s:String;
			
			for (i = 0; i < list.length; i++)
			{				
				s = list[i]["label"];
				if (s.substring(0, Match.length) != Match)
				{
					list.splice(i, 1);
					i--;
				}
			}
			
			invalidateData();
		}
	}
}