package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class CreditsScreen extends FlxState 
	{
		private var creditsSprite:FlxSprite = new FlxSprite(0, 0, Assets.splashCreditsScreen);
		override public function create():void
		{
			add(creditsSprite);
			creditsSprite.velocity.y = -10;
		}
		
		override public function update():void 
		{
			super.update();
		}
		
		
	}

}