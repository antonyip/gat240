package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class GameOver extends FlxState 
	{
		
		public function GameOver() 
		{
			
		}
		
		public function update():void
		{
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.switchState(new MainMenu);
			}
		}
		
	}

}