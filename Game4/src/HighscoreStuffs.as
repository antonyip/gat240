package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Anton Yip
	 */
	public class HighscoreStuffs extends FlxGroup 
	{
		private var highscoreSplash:FlxSprite = new FlxSprite(0, 0, Assets.splashHighscore);
		private var score0:FlxText = new FlxText(400-74, 200-18, 200, "6000", true);
		private var score1:FlxText = new FlxText(400-42, 250+50-31, 200, "4000", true);
		private var score2:FlxText = new FlxText(400-42, 300+50-22, 200, "5000", true);
		private var score3:FlxText = new FlxText(400-43, 350+50-11, 200, "3000", true);
		private var score4:FlxText = new FlxText(400-43, 400+50-3, 200, "2000", true);
		private var score5:FlxText = new FlxText(400-46, 450+50+8, 200, "1000", true);
		
		public function HighscoreStuffs(MaxSize:uint=0) 
		{
			super(MaxSize);
			add(highscoreSplash);
			
			score0.setFormat("MANGA", 48, 0x0);
			score1.setFormat("MANGA", 32, 0x0);
			score2.setFormat("MANGA", 32, 0x0);
			score3.setFormat("MANGA", 32, 0x0);
			score4.setFormat("MANGA", 32, 0x0);
			score5.setFormat("MANGA", 32, 0x0);
			
			add(score0);
			add(score1);
			add(score2);
			add(score3);
			add(score4);
			add(score5);
		}
		
		override public function update():void
		{
			super.update();
			
			var s0:String = Globals.highscoreTable[0].score;
			var s1:String = Globals.highscoreTable[1].score;
			var s2:String = Globals.highscoreTable[2].score;
			var s3:String = Globals.highscoreTable[3].score;
			var s4:String = Globals.highscoreTable[4].score;
			var s5:String = Globals.highscoreTable[5].score;
			
			score0.text = s0;
			score1.text = s1;
			score2.text = s2;
			score3.text = s3;
			score4.text = s4;
			score5.text = s5;
			
		}
		
	}

}