package  
{
	import org.flixel.*;
	import flash.events.Event;
	import org.flixel.plugin.funstorm.FlxMovieClip;
	
	/**
	 * ...
	 * @author Anton Yip
	 */
	public class MainMenu extends FlxState 
	{
		public var startGame:FlxButton = new org.flixel.FlxButton(400, 300, "Start Game", startGameFn);
		public var howToPlay:FlxButton = new org.flixel.FlxButton(400, 400, "How To Play", howToPlayFn);
		private var arrowSprite:FlxSprite = new FlxSprite(0, 0, Assets.testArt1);
		public var selector:int = 0;
		// do once when come into game
		public override function create():void
		{
			add(startGame);
			add(howToPlay);
			add(arrowSprite);
			if (FlxG.stage)
				FlxG.stage.addEventListener(Event.RESIZE, Globals.toggle_fullscreen);
				
		}
		public override function update():void
		{
			// handle inputs WS
			if (FlxG.keys.justReleased("W") || FlxG.keys.justReleased("UP"))
			{
				if (selector > 0)
					selector --;
			}
			if (FlxG.keys.justReleased("S") || FlxG.keys.justReleased("DOWN"))
			{
				if (selector < 1)
					selector++;
			}
			if (FlxG.keys.justPressed("K"))
			{
				Globals.toggle_fullscreen(new Event(Event.RESIZE));
			}
			if (FlxG.keys.justReleased("SPACE"))
			{
				if (selector == 0)
					startGameFn();
				else
					howToPlayFn();
			}
			
			switch (selector) 
			{
			case 0:
					arrowSprite.x = startGame.x - 100;
					arrowSprite.y = startGame.x - 100;
				break;
			case 1:
					arrowSprite.x = howToPlay.x - 100;
					arrowSprite.y = howToPlay.y;
				break;
			}
			
			
		}
		
		public function startGameFn():void 
		{
			FlxG.switchState(new GameLevel);
		}
		public function howToPlayFn():void 
		{
			//FlxG.switchState(new ParticleSystemCreator);
		}
	}

}