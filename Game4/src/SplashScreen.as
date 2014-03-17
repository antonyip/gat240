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
			FlxG.flash(0xffffffff, 1, switchState);
		}
		
		public function switchState():void
		{
			FlxG.switchState(new MainMenu);
		}
	}

}