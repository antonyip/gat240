package GameObjects 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class Floor extends FlxSprite 
	{
		
		public function Floor(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			immovable = true;
		}
		
		public override function update():void
		{
			
		}
		
	}

}