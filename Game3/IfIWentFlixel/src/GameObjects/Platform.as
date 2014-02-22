package GameObjects 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class Platform extends FlxSprite 
	{
		public static var UNKNOWN_PLATFORM:String = "unknown";
		public static var BOUNCING_PLATFORM:String = "bouncing_platform";
		public static var MOVING_PLATFORM:String = "moving_platform";
		public static var SLIPPERY_PLATFORM:String = "slippery_platform";
		public static var TRIGGER_PLATFORM:String = "trigger_platform";
		
		public var myType:String;
		
		public function Platform(X:Number=0, Y:Number=0, SimpleGraphic:Class=null, _myType:String = "unknown") 
		{
			super(X, Y, SimpleGraphic);
			immovable = true;
			myType = _myType;
		}
		
	}

}
