package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class SplashScreen extends FlxState 
	{
		private var bg:FlxSprite = new FlxSprite(0, 0, Assets.splashEngineScreen);
		
		override public function create():void
		{
			add(bg);	
			FlxG.flash(0xffffffff, 1, switchSprite);
		}
		
		override public function update():void 
		{
			
		}
		
		public function switchSprite():void
		{
			bg.loadGraphic(Assets.splashLogoScreen);
			FlxG.flash(0xffffffff, 1);
			var timer:FlxTimer = new FlxTimer();
			timer.start(0.01, 1000, timerEvent);
		}
		
		public function timerEvent(s:FlxTimer):void 
		{
			if (s.loopsLeft < 900)
			{
				bg.y -= 5;
				bg.scale.x += 0.05;
				bg.scale.y += 0.05;
			}
			//trace(s.loopsLeft);
			if (s.loopsLeft < 750)
			{
				FlxG.fade(0xffffffff, 1,switchState);
			}
		}
		
		public function switchState():void
		{
			FlxG.switchState(new MainMenu);
		}
	}

}