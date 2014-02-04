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
		private var aeroplane:Aeroplane;
		
		// do once when come into game
		public override function create():void
		{
			aeroplane = new Aeroplane(400, 500, Assets.aeroplaneSprite);
			add(aeroplane);
			add(Globals.playerBulletManager);
			add(Globals.powerUpManager);
		} // create close bracket
		
		// called everyframe
		public override function update():void
		{
			super.update();
		} //update close bracket
		
	}

}