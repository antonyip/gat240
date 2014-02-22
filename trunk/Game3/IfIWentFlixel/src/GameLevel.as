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
			
			FlxG.music = new FlxSound();
			FlxG.music.loadEmbedded(Assets.backgroundMusic, true);
			//FlxG.music.play();
			FlxG.music.survive = false;
		} // create close bracket
		
		// called everyframe
		public override function update():void
		{
			super.update();
			FlxG.collide(Globals.playerCharacter, Globals.floorManager,hitFloor);
		} //update close bracket
		
		public static function hitFloor(obj1:FlxSprite, obj2:FlxSprite):void
		{
			var player:Aeroplane = obj1 as Aeroplane;
			// reset when hit floor
			player.onFloor = true;
			player.doubleJump = true;
		}
	
	}

}