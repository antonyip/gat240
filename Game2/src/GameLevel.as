package  
{
	import flash.display.MovieClip;
	import GameObjects.*;
	import org.flixel.*;
	import org.flixel.plugin.funstorm.FlxMovieClip;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class GameLevel extends FlxState 
	{
		// Sprites
		private var bulletTest:Bullet;
		// do once when come into game
		public override function create():void
		{
			bulletTest = new PlayerStraightBullet(400, 300, Assets.testArt1);
			add(bulletTest);
		} // create close bracket
		
		// called everyframe
		public override function update():void
		{
			super.update();
			
			
			
		} //update close bracket
	}

}