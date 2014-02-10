package  
{
	import org.flixel.FlxState;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class GameWin extends FlxState 
	{
		
		public function GameWin() 
		{
			
		}
		
		public override function update():void
		{
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.switchState(new MainMenu);
			}
		}
		
	}

}