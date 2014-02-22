package  
{
	import flash.display.MovieClip;
	import GameObjectManagers.CheckPointManager;
	import GameObjectManagers.EnemyManager;
	import GameObjectManagers.FloorManager;
	import GameObjectManagers.PlatformManager;
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
		
		// debug stuffs
		private var floorTest:Floor = new Floor(150, 400, Assets.enemyBoss);
		private var wallTest:Floor = new Floor(100, 200, Assets.enemyBoss);
		private var movingPlatformTest:MovingPlatform = new MovingPlatform(300, 400, Assets.aeroplaneSprite, 400, 400, 240);
		private var bouncyPlatformTest:BouncingPlatform = new BouncingPlatform(500, 400, Assets.enemyChaser);
		private var enemyTest:EnemyObject = new EnemyObject(500,350,Assets.enemySprite);
		
		// do once when come into game
		public override function create():void
		{
			// creating the managers
			Globals.playerCharacter = new Aeroplane(200, 300, Assets.aeroplaneSprite);
			Globals.floorManager = new FloorManager();
			Globals.platformManager = new PlatformManager();
			Globals.enemyManager = new EnemyManager();
			Globals.checkPointManager = new CheckPointManager();
			
			
			// debug stuffs
			Globals.floorManager.add(floorTest);
			Globals.floorManager.add(wallTest);
			Globals.platformManager.add(movingPlatformTest);
			Globals.platformManager.add(bouncyPlatformTest);
			Globals.enemyManager.add(enemyTest);
			Globals.checkPointManager.add(new CheckPoint(200, 300, Assets.healthPowerUp));
			Globals.checkPointManager.add(new CheckPoint(300, 100, Assets.healthPowerUp));
			
			// adding stuffs
			add(bg);
			add(Globals.playerCharacter);
			add(Globals.floorManager);
			add(Globals.platformManager);
			add(Globals.enemyManager);
			add(Globals.checkPointManager);
			
			// omg no way imba camera
			FlxG.camera.follow(Globals.playerCharacter, FlxCamera.STYLE_PLATFORMER);
			
			// background music
			FlxG.music = new FlxSound();
			FlxG.music.loadEmbedded(Assets.backgroundMusic, true);
			//FlxG.music.play();
			FlxG.music.survive = false;
		} // create close bracket
		
		// called everyframe
		public override function update():void
		{
			super.update();
			FlxG.collide(Globals.playerCharacter, Globals.floorManager, hitFloor);
			FlxG.collide(Globals.playerCharacter, Globals.platformManager, hitPlatform);
			FlxG.collide(Globals.playerCharacter, Globals.enemyManager, playerHitEnemy);
			FlxG.collide(Globals.playerCharacter, Globals.checkPointManager, checkPointCollide);
			FlxG.collide(Globals.enemyManager, Globals.floorManager);
			FlxG.collide(Globals.enemyManager, Globals.platformManager,hitPlatform)
		} //update close bracket
		
		public static function hitFloor(obj1:FlxSprite, obj2:FlxSprite):void
		{
			var player:Aeroplane = obj1 as Aeroplane;
			
			// calculate if it was a floor or a wall
			var dPy:Number = player.getMidpoint().y - obj2.getMidpoint().y;
			//trace(dPy <= -((player.height + obj2.height) / 2));
			if (dPy <= -((player.height + obj2.height) / 2))
			{
				// on floor
				//trace("fj");
				player.onFloor = true;
				player.doubleJump = true;
			}
			else
			{
				// wall jumping
				//trace("wj");
				player.doubleJump = true;
				player.velocity.x = (player.getMidpoint().x - obj2.getMidpoint().x);
			}
		}
		
		public static function hitPlatform(obj1:FlxSprite, obj2:FlxSprite):void
		{
			var player:Aeroplane = obj1 as Aeroplane;
			// reset when hit floor
			player.onFloor = true;
			player.doubleJump = true;
			
			var platform:Platform = obj2 as Platform;
			
			if (platform.myType == Platform.BOUNCING_PLATFORM)
			{
				player.velocity.y = -600;
			}
		}
		
		public static function playerHitEnemy(obj1:FlxSprite, obj2:FlxSprite):void
		{
			var player:Aeroplane = obj1 as Aeroplane;
			// reset when hit floor
			player.kill();
			--player.livesLeft;
			if (player.livesLeft < 0)
				FlxG.switchState(new GameOver);
			else
			{
				player.x = Globals.checkPointManager.saveSpotX;
				player.y = Globals.checkPointManager.saveSpotY;
				player.revive();
			}
		}
		
		public static function checkPointCollide(obj1:FlxSprite, obj2:FlxSprite):void
		{
			var player:Aeroplane = obj1 as Aeroplane;
			// reset when hit floor
			Globals.checkPointManager.saveSpotX = obj2.x;
			Globals.checkPointManager.saveSpotY = obj2.y;
			obj2.kill();
			trace("hw");
			
		}
		
	}

}