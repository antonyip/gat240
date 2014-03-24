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
			super.create();
			add(bg);
			trace(Globals.highscoreTable.length);
			Globals.highscoreTable.push(new HighscoreObject("anton", Globals.currentScore));
			trace(Globals.highscoreTable.length);
			Globals.highscoreTable.sortOn("score", Array.DESCENDING|Array.NUMERIC);
			Globals.saver.data.highscoreTable = Globals.highscoreTable;
			Globals.saver.flush();
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