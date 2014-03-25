package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class CreditsScreen extends FlxState 
	{
		private var creditsSprite:FlxSprite = new FlxSprite(0, 0, Assets.splashCreditsScreen);
		
		override public function create():void
		{
			super.create();
			add(creditsSprite);
			creditsSprite.velocity.y = -100;
			FlxG.flash(0xffffffff, 1);
			var s:FlxTimer = new FlxTimer();
			s.start(9,1,endLevel);
		}
		
		override public function update():void 
		{
			super.update();
			if (FlxG.keys.justReleased("SPACE") ||FlxG.keys.justReleased("ESCAPE") || FlxG.keys.justReleased("ENTER") )
			{
				FlxG.fade(0xffffffff, 1, switchMainMenu);
			}
		}
		
		public function endLevel(e:FlxTimer):void
		{
			FlxG.fade(0xffffffff, 1, switchMainMenu);
		}
		
		public function switchMainMenu():void
		{
			FlxG.switchState(new MainMenu);
		}
		
		
	}

}