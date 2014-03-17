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
			super(800, 600, SplashScreen , 1, 120, 120, true);
			if (FlxG.stage)
			{
				FlxG.stage.addEventListener(Event.RESIZE, Globals.toggle_fullscreen);
			}
			Globals.GlobalsInit();
			
		}		
	}

}