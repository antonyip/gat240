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
		public override function create():void
		{
			if (FlxG.stage)
				FlxG.stage.addEventListener(Event.RESIZE, Globals.toggle_fullscreen);
				
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