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
		}
		
		public override function update():void
		{
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.switchState(new MainMenu);
			}
		}
		
	}

}