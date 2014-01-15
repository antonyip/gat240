package 
{

	import flash.display.MovieClip;
	import org.flixel.FlxGame;
	
	/**
	 * ...
	 * @author Anton Yip
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends FlxGame 
	{
		public function Main()
		{
			super(800, 600, GameLevel,1,60,60,true);
		}		
	}

}