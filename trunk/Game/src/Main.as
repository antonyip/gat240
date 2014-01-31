package 
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import org.flixel.FlxGame;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Anton Yip
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends FlxGame 
	{
		public function Main()
		{
			super(800, 600, MainMenu , 1, 60, 24, true);
			if (FlxG.stage)
			{
				FlxG.stage.addEventListener(Event.RESIZE, Globals.toggle_fullscreen);
			}
			Globals.GlobalsInit();
			
		}		
	}

}