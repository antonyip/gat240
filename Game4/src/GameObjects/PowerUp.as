package GameObjects 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class PowerUp extends FlxSprite 
	{
		private var speed:int = 50;
		public var type:String = "unknown";
		
		public function PowerUp(X:Number=0, Y:Number=0, SimpleGraphic:Class=null, _type:String="0") 
		{
			super(X, Y, SimpleGraphic);
			velocity.x = Globals.randomInt(-speed,speed);
			velocity.y = speed;
			type = _type;
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}