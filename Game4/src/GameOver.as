package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class GameOver extends FlxState 
	{
		private var bg:FlxSprite = new FlxSprite(0, 0, Assets.LoseLevelBG);
		
		public override function create():void
		{
			add(bg);
			FlxG.flash(0xffffffff,1);
		}
		
		public override function update():void
		{
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.fade(0xffffffff, 1, goToCredits);
			}
		}
		
		public function goToCredits():void
		{
			FlxG.switchState(new CreditsScreen);
		}
		
	}

}