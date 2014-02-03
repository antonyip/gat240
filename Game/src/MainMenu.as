package  
{
	import com.greensock.motionPaths.CirclePath2D;
	import org.flixel.*;
	import flash.events.Event;
	import org.flixel.plugin.funstorm.FlxMovieClip;
	
	/**
	 * ...
	 * @author Anton Yip
	 */
	public class MainMenu extends FlxState 
	{
		//public var startGame:FlxButton = new org.flixel.FlxButton(400, 300, "Start Game", startGameFn);
		//public var howToPlay:FlxButton = new org.flixel.FlxButton(400, 400, "How To Play", howToPlayFn);
		private var background:FlxSprite = new FlxSprite(0, 0, Assets.mainPageBackground);
		private var arrowSprite:FlxSprite = new FlxSprite(0, 0, Assets.arrowSprite);
		public var selector:int = 0;
		// do once when come into game
		
		//private var movieclip:FlxMovieClip = new FlxMovieClip(1, 1);
		public override function create():void
		{

			
			add(background);
			//add(startGame);
			//add(howToPlay);
			//add(arrowSprite);
			if (FlxG.stage)
				FlxG.stage.addEventListener(Event.RESIZE, Globals.toggle_fullscreen);
				
		}
		public override function update():void
		{
			// handle inputs WS
			
			if (FlxG.keys.justReleased("W") || FlxG.keys.justReleased("UP"))
			{
				/*
				var tmp:* = new WhirlwindGale;
				movieclip.loadMovieClip(tmp, 800, 600, false, true);
				add(movieclip);
				*/
			}
			/*
			if (FlxG.keys.justReleased("S") || FlxG.keys.justReleased("DOWN"))
			{
				if (selector < 1)
					selector++;
			}
			*/
			if (FlxG.keys.justReleased("SPACE"))
			{
					startGameFn();
			}
			
			/*
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
			*/
			
		}
		
		
		
		
		public function startGameFn():void 
		{
			FlxG.switchState(new PlayerCreation);
		}
		public function howToPlayFn():void 
		{
			//FlxG.switchState(new ParticleSystemCreator);
		}
	}

}