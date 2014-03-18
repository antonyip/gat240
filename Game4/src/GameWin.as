package  
{
	import org.flixel.*;
	
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
			Globals.highscoreTable.push(new HighscoreObject("anton", Globals.currentScore));
			Globals.highscoreTable.sortOn("score", Array.DESCENDING);
			Globals.saver.data.highscoreTable = Globals.highscoreTable;
			Globals.saver.flush();
		}
		
		public override function update():void
		{
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.switchState(new CreditsScreen);
			}
		}
		
	}

}