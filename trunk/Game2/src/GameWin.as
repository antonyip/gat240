package  
{
	import org.flixel.FlxState;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class GameWin extends FlxState 
	{
		
		private var bg:FlxSprite = new FlxSprite(0, 0, Assets.WinLevelBG);
		
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