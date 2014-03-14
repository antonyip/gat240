package GameObjects 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Anton
	 */
	public class BouncingPlatform extends Platform 
	{
		public var myImage:FlxSprite;
		public function BouncingPlatform(X:Number=0, Y:Number=0, SimpleGraphic:Class=null, i:FlxSprite=null) 
		{
			super(X, Y, SimpleGraphic);
			myType = Platform.BOUNCING_PLATFORM;
			myImage = i;
			myImage.loadGraphic(Assets.bouncingTileOver, true, false, 102, 102, false);
			myImage.addAnimation("bounce", [0,1,2,3], 60, false);
		}
		
	}

}