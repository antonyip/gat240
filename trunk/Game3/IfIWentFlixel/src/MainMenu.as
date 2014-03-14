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
		// do once when come into game
		private var bg:FlxSprite = new FlxSprite(0, 0, Assets.mainMenuBG);
		public override function create():void
		{
			add(bg);
			if (FlxG.stage)
				FlxG.stage.addEventListener(Event.RESIZE, Globals.toggle_fullscreen);
				
			if (FlxG.music == null)
			{
				FlxG.music = new FlxSound();
				FlxG.music.loadEmbedded(Assets.backgroundMusic, true);
				FlxG.music.play();
				FlxG.music.survive = true;
			}
				
		}
		public override function update():void
		{
			// handle inputs WS
			if (FlxG.keys.justReleased("SPACE"))
			{
					startGameFn();
			}		
		}
		
		public function startGameFn():void 
		{
			FlxG.switchState(new GameLevel);
		}
	}

}