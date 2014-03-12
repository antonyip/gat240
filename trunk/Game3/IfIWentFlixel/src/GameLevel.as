package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.SpreadMethod;
	import flash.utils.ByteArray;
	import GameObjectManagers.*;
	import GameObjects.*;
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Anton
	 */
	
	public class GameLevel extends FlxState 
	{
		// Sprites
		private var livesLeftOnPlayer:FlxText = new FlxText(10, 10, 600, "Lives Left: ");
		private var bg:FlxSprite = new FlxSprite(0, 0, Assets.GameLevelBG);
			
		// do once when come into game
		public override function create():void
		{
			// creating the managers
			Globals.playerCharacter = new Aeroplane(200, 300, Assets.aeroplaneSprite);
			Globals.floorManager = new FloorManager();
			Globals.platformManager = new PlatformManager();
			Globals.enemyManager = new EnemyManager();
			Globals.checkPointManager = new CheckPointManager();
			Globals.jumpwallManager = new JumpableWallManager();
			
			
			// load the level
			loadLevel();

			// adding stuffs
			add(bg);
			add(Globals.floorManager);
			add(Globals.jumpwallManager);
			add(Globals.platformManager);
			add(Globals.enemyManager);
			add(Globals.checkPointManager);
			add(Globals.playerCharacter);
			
			// omg no way imba camera
			FlxG.camera.setBounds(0, 0, 22*64, 27*64, true);
			FlxG.camera.follow(Globals.playerCharacter, FlxCamera.STYLE_PLATFORMER);
			
			// background music
			FlxG.music = new FlxSound();
			FlxG.music.loadEmbedded(Assets.backgroundMusic, true);
			FlxG.music.play();
			FlxG.music.survive = false;
		} // create close bracket
		
		// called everyframe
		public override function update():void
		{
			super.update();
			FlxG.collide(Globals.playerCharacter, Globals.floorManager, hitFloor);
			FlxG.collide(Globals.playerCharacter, Globals.jumpwallManager, hitJumpWall);
			FlxG.collide(Globals.playerCharacter, Globals.platformManager, hitPlatform);
			FlxG.collide(Globals.playerCharacter, Globals.enemyManager, playerHitEnemy);
			FlxG.collide(Globals.playerCharacter, Globals.checkPointManager, checkPointCollide);
			FlxG.collide(Globals.enemyManager, Globals.floorManager);
			FlxG.collide(Globals.enemyManager, Globals.platformManager, hitPlatform);
			
		} //update close bracket
		
		public static function hitFloor(obj1:FlxSprite, obj2:FlxSprite):void
		{
			//trace("hitFloor");
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
				//player.doubleJump = true;
				player.velocity.x = (player.getMidpoint().x - obj2.getMidpoint().x);
			}
		}
		
		public static function hitJumpWall(obj1:FlxSprite, obj2:FlxSprite):void
		{
			//trace("hitFloor");
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
				player.velocity.y = -1300;
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
			trace("cp");
			
		}
		
		public function loadLevel():void 
		{
			// variabels
			var b:ByteArray = new Assets.gameLevelCSV();
			var gameHeight:int = 27;
			var gameLength:int = 22;
			var tileSize:int = 64;
			
			for (var i:int = 0; i < gameHeight; i++) 
			{
				// reading the array
				var s:String;
				if (b.bytesAvailable >= 45)
					s = b.readUTFBytes(45);
				else
					s = b.readUTFBytes(b.bytesAvailable);
				//trace(s);
				for (var j:int = 0; j < gameLength; j++) 
				{
					//trace(s.charAt(j * 2));
					// creating the tiles
					switch (s.charAt(j*2)) // because commars
					{
						case '0':
							break;
						case '1':
						case 'P':
							var floor:Floor = new Floor(j * tileSize, i * tileSize, Assets.normalTile)
							Globals.floorManager.add(floor);
							break;
						case '2':
							var bouncingFloor:BouncingPlatform = new BouncingPlatform(j * tileSize, i * tileSize, Assets.bouncingTile);
							Globals.platformManager.add(bouncingFloor);
							break;
						case '3':
							var shootingEnemy:EnemyShooter = new EnemyShooter(j * tileSize, i * tileSize, Assets.shootingEnemy);
							Globals.enemyManager.add(shootingEnemy);
							break;
						case '4':
							var patrol:MovingPlatform = new MovingPlatform(j * tileSize, i * tileSize, Assets.enemy,(j+2)*tileSize,i*tileSize);
							Globals.enemyManager.add(patrol);
							break;
						case '5':
							var spikes:EnemyObject = new EnemyObject(j * tileSize, i * tileSize, Assets.spikes);
							Globals.enemyManager.add(spikes);
							break;	
						case '6':
							var upspikes:EnemyObject = new EnemyObject(j * tileSize, i * tileSize, Assets.upsidedownspikes);
							Globals.enemyManager.add(upspikes);
							break;
						case '7':
							var checkPoint:CheckPoint = new CheckPoint(j * tileSize, i * tileSize, Assets.checkpoint);
							Globals.checkPointManager.add(checkPoint);
							break;
						case '8':
							var exit:CheckPoint = new CheckPoint(j * tileSize, i * tileSize, Assets.checkpoint);
							Globals.checkPointManager.add(exit);
							break;							
						case '9':
							Globals.playerCharacter.x = j * tileSize;
							Globals.playerCharacter.y = i * tileSize - 10;
							Globals.checkPointManager.saveSpotX = j * tileSize;
							Globals.checkPointManager.saveSpotY = i * tileSize - 10;
							break;
						case 'A':
							var movingLeft:MovingPlatform = new MovingPlatform(j * tileSize, i * tileSize, Assets.movingTile,(j-3)*tileSize,i*tileSize)
							Globals.floorManager.add(movingLeft);
							break;
						case 'B':
							var movingRight:MovingPlatform = new MovingPlatform(j * tileSize, i * tileSize, Assets.movingTile,(j+3)*tileSize,i*tileSize)
							Globals.floorManager.add(movingRight);
							break;
						case 'C':
							var jfloor:Floor = new Floor(j * tileSize, i * tileSize, Assets.movingTile)
							Globals.jumpwallManager.add(jfloor);
							break;
						default:
					}
				}
			}
		}
	}

}