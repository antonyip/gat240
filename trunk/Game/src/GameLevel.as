package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class GameLevel extends FlxState 
	{
		// variables goes here
		private var test:FlxText = new FlxText(400, 300, 300, "Hello World");
		
		// do once when come into game
		public override function create():void
		{
			add(test);
		}
		
		// called everyframe
		public override function update():void
		{
			
		}
		
		// additional functions goes here
	}

}