package  
{
	import flash.display.MovieClip;
	import GameObjectManagers.FloorManager;
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
		private var livesLeftOnPlayer:FlxText = new FlxText(10, 10, 600, "Lives Left: ");
		private var bg:FlxSprite = new FlxSprite(0, 0, Assets.GameLevelBG);
		private var floorTest:Floor = new Floor(150, 400, Assets.enemyBoss);
		
		// do once when come into game
		public override function create():void
		{
			Globals.playerCharacter = new Aeroplane(200, 300, Assets.aeroplaneSprite);
			Globals.floorManager = new FloorManager();
			Globals.floorManager.add(floorTest);
			add(bg);
			add(Globals.playerCharacter);
			add(Globals.floorManager);
			
			// omg no way imba camera
			FlxG.camera.follow(Globals.playerCharacter, FlxCamera.STYLE_PLATFORMER);
		} // create close bracket
		
		// called everyframe
		public override function update():void
		{
			super.update();
			FlxG.collide(Globals.playerCharacter, Globals.floorManager);
		} //update close bracket
		
	
	}

}