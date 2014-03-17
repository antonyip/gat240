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
		private var bg:FlxSprite = new FlxSprite(64, 64, Assets.GameLevelBG);
		private var graphics:GraphicsManager = new GraphicsManager();
		
		// do once when come into game
		public override function create():void
		{
			
			// creating the managers
			Globals.playerCharacter = new Aeroplane(200, 300, Assets.playerWalkTest);
			Globals.floorManager = new FloorManager();
			Globals.platformManager = new PlatformManager();
			Globals.enemyManager = new EnemyManager();
			Globals.checkPointManager = new CheckPointManager();
			Globals.jumpwallManager = new JumpableWallManager();
			
			
			// load the level
			loadLevel();
			loadGraphics();
			
			// adding stuffs
			add(bg);
			add(Globals.floorManager);
			add(Globals.jumpwallManager);
			add(Globals.platformManager);
			add(Globals.enemyManager);
			add(Globals.checkPointManager);
			add(graphics);
			Globals.playerCharacter.loadGraphic(Assets.playerWalkTest, true, false, 48, 48);
			Globals.playerCharacter.addAnimation("idle", [11], 1, true);
			Globals.playerCharacter.addAnimation("walk", [0, 1, 2, 3], 30, true);
			Globals.playerCharacter.addAnimation("jump", [4, 5, 6], 30, false);
			Globals.playerCharacter.addAnimation("die", [8, 9, 10], 120, false);
			Globals.playerCharacter.play("idle", true);
			add(Globals.playerCharacter);
			
			// omg no way imba camera
			var s:Number = FlxG.stage.stage.stageHeight / 600;
			FlxG.resetCameras(new FlxCamera(0, 0, 800, 600, s));
			FlxG.camera.setBounds(0, 0, 22*64, 27*64, true);
			FlxG.camera.follow(Globals.playerCharacter, FlxCamera.STYLE_PLATFORMER);
			
			FlxG.flash(0xffffffff, 1);
		} // create close bracket
		
		// called everyframe
		public override function update():void
		{
			super.update();
			FlxG.collide(Globals.playerCharacter, Globals.floorManager, hitFloor);
			if (Globals.playerCharacter.allowControl)
			{
				FlxG.collide(Globals.playerCharacter, Globals.jumpwallManager, hitJumpWall);
				FlxG.collide(Globals.playerCharacter, Globals.platformManager, hitPlatform);
				FlxG.collide(Globals.playerCharacter, Globals.enemyManager, playerHitEnemy);
				FlxG.collide(Globals.playerCharacter, Globals.checkPointManager, checkPointCollide);
			}
			//FlxG.collide(Globals.enemyManager, Globals.floorManager);
			//FlxG.collide(Globals.enemyManager, Globals.platformManager, hitPlatform);
			
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
				player.play("jump", false);
				player.onFloor = false;
				var bplatform:BouncingPlatform = obj2 as BouncingPlatform;
				bplatform.myImage.play("bounce", false);
				FlxG.loadSound(Assets.bounceSound).play();
			}
		}
		
		public static function playerHitEnemy(obj1:FlxSprite, obj2:FlxSprite):void
		{
			var player:Aeroplane = obj1 as Aeroplane;
			// reset when hit floor
			//player.kill();
			player.play("die", false);
			FlxG.loadSound(Assets.deathSound).play();
			player.allowControl = false;
			player.velocity.x = 0;
			player.velocity.y = 0;
			var timer:FlxTimer = new FlxTimer();
			timer.start(1, 1, reallyDie);
		}
		
		public static function reallyDie(obj:FlxTimer):void 
		{
			var player:Aeroplane = Globals.playerCharacter;

			--player.livesLeft;
			player.allowControl = true;
			if (player.livesLeft < 0)
				FlxG.switchState(new GameOver);
			else
			{
				player.x = Globals.checkPointManager.saveSpotX;
				player.y = Globals.checkPointManager.saveSpotY;
				player.revive();
				player.play("idle", false);
				player.addAnimationCallback(null);
			}
		}
		
		public static function checkPointCollide(obj1:FlxSprite, obj2:FlxSprite):void
		{
			var player:Aeroplane = obj1 as Aeroplane;
			// reset when hit floor
			obj2.kill();
			//trace("cp");
			
			var cp:CheckPoint = obj2 as CheckPoint;
			if (cp.myType == "exit") 
			{
				FlxG.switchState(new GameWin);
			}
			else if (cp.myType == "health")
			{
				FlxG.loadSound(Assets.pupSound).play();
				++player.livesLeft;
			}
			else
			{
				Globals.checkPointManager.saveSpotX = obj2.x;
				Globals.checkPointManager.saveSpotY = obj2.y;
				FlxG.loadSound(Assets.checkPointSound).play();
			}
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
							var bouncingFloorI:FlxSprite = new FlxSprite(j * tileSize-20, i * tileSize-19, null);
							bouncingFloorI.immovable = true;
							graphics.add(bouncingFloorI);
							var bouncingFloor:BouncingPlatform = new BouncingPlatform(j * tileSize, i * tileSize, Assets.bouncingTile, bouncingFloorI);
							Globals.platformManager.add(bouncingFloor);
							break;
						case '3':
							var shootingEnemy:EnemyShooter = new EnemyShooter(j * tileSize, i * tileSize, Assets.shootingEnemy);
							Globals.enemyManager.add(shootingEnemy);
							break;
						case '4':
							var patrol:MovingPlatform = new MovingPlatform(j * tileSize, i * tileSize, Assets.enemy,(j+2)*tileSize,i*tileSize,240,"enemy");
							Globals.enemyManager.add(patrol);
							break;
						case '5':
							var spikes:EnemyObject = new EnemyObject(j * tileSize, i * tileSize+1, Assets.spikes);
							Globals.enemyManager.add(spikes);
							break;	
						case '6':
							var upspikes:EnemyObject = new EnemyObject(j * tileSize, i * tileSize-1, Assets.upsidedownspikes);
							Globals.enemyManager.add(upspikes);
							break;
						case '7':
							var checkPoint:CheckPoint = new CheckPoint(j * tileSize, i * tileSize, Assets.checkpoint);
							Globals.checkPointManager.add(checkPoint);
							break;
						case '8':
							var exit:CheckPoint = new CheckPoint(j * tileSize, i * tileSize, Assets.exitImage,"exit");
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
							var jfloor:Floor = new Floor(j * tileSize, i * tileSize, Assets.wallJumpWall)
							Globals.jumpwallManager.add(jfloor);
							break;
						case 'D':
							var key:CheckPoint = new CheckPoint(j * tileSize, i * tileSize, Assets.keyImage,"key");
							Globals.checkPointManager.add(key);
							break;
						case 'E':
							var pUp:CheckPoint = new CheckPoint(j * tileSize, i * tileSize, Assets.healthPowerUpImage,"health");
							Globals.checkPointManager.add(pUp);
							break;
						default:
					}
				}
			}
		}
		
		public function loadGraphics():void 
		{
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
						case '1':
						case 'P':
							var floor:FlxSprite = new FlxSprite(j * tileSize -20, i * tileSize-19, Assets.normalTileCover)
							floor.immovable = true;
							floor.active = false;
							graphics.add(floor);
							break;
						case '2':

							break;							
						case 'C':
							var jfloor:FlxSprite = new FlxSprite(j * tileSize-20, i * tileSize-19, Assets.wallJumpWallOver)
							jfloor.immovable = true;
							jfloor.active = false;
							graphics.add(jfloor);
							break;							
						default:
					}
				}
			}
		}
	}

}