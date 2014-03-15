package GameObjects 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class CheckPoint extends FlxSprite 
	{
		public var myType:String;
		public function CheckPoint(X:Number=0, Y:Number=0, SimpleGraphic:Class=null, myType_:String = "checkPoint") 
		{
			super(X, Y, SimpleGraphic);
			myType = myType_;
		}
		
	}

}