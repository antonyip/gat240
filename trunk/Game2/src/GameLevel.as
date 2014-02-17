package  
{
	import flash.display.MovieClip;
	import GameObjectManagers.EnemyAeroplaneManager;
	import GameObjectManagers.EnemyBossManager;
	import GameObjectManagers.EnemyBulletManager;
	import GameObjectManagers.PlayerBulletManager;
	import GameObjectManagers.PowerUpManager;
	import GameObjectManagers.SpawnManager;
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
		// do once when come into game
		public override function create():void
		{
			Globals.bossKilled = false;
			add(bg);
			Globals.aeroplane = new Aeroplane(400, 500, Assets.aeroplaneSprite);
			
			Globals.playerBulletManager = new PlayerBulletManager();
			Globals.aeroplane = new Aeroplane(400, 450, Assets.aeroplaneSprite);
			Globals.enemyBulletManager = new EnemyBulletManager();
			Globals.enemyAeroplaneManager = new EnemyAeroplaneManager();
			Globals.powerUpManager = new PowerUpManager();
			Globals.spawnManager = new SpawnManager();
			Globals.enemyBossManager = new EnemyBossManager;
			
			add(Globals.playerBulletManager); 
			add(Globals.enemyBossManager);
			add(Globals.aeroplane);
			add(Globals.enemyBulletManager);
			add(Globals.enemyAeroplaneManager);
			add(Globals.powerUpManager);
			add(livesLeftOnPlayer);
		} // create close bracket
		
		// called everyframe
		public override function update():void
		{
			
			super.update();
			// -- Input for Power ups -- //
			if (FlxG.keys.justPressed("Z"))
			{
				// stop enemies in their tracks
				Globals.enemyAeroplaneManager.active = !Globals.enemyAeroplaneManager.active;
			}
			
			if (FlxG.keys.justPressed("X"))
			{
				// Destroy all enemies and bullets
				Globals.enemyAeroplaneManager.kill();
				Globals.enemyBulletManager.kill();
			}
			
			if (FlxG.keys.justPressed("C"))
			{
				// No Damage
				Globals.aeroplane.noDeath = 1200;
				Globals.aeroplane.flicker(10);
			}
			
			// ------------------ update collision			 --------------------------------- //
			FlxG.collide(Globals.aeroplane, Globals.powerUpManager, aeroplaneOnPowerUp);
			if (Globals.aeroplane.noDeath < 0)
			{
				FlxG.collide(Globals.aeroplane, Globals.enemyBulletManager, aeroplaneOnBullet);
				FlxG.collide(Globals.aeroplane, Globals.enemyAeroplaneManager, aeroplaneOnAeroplane);
				
			}
			else
			{
				--Globals.aeroplane.noDeath;	
			}
			
			FlxG.collide(Globals.playerBulletManager, Globals.enemyBossManager, playerBulletOnBoss);
			FlxG.collide(Globals.playerBulletManager, Globals.enemyAeroplaneManager, playerBulletOnEnemy);
			
			// ---------- update game status --------------------------------- //
			
			// check health less then 0 .. game over :: TODO
			if (Globals.aeroplane.livesLeft < 0)
				FlxG.switchState(new GameOver);
			
			// check enemies left == 0 && no more waves .. game victory :: TODO
			
			//------------------- update gui --------------------------------- //
			livesLeftOnPlayer.text = "Lives Left: " + Globals.aeroplane.livesLeft.toString();
			
			if (Globals.bossKilled)
			{
				FlxG.switchState(new GameWin);
			}
			
		} //update close bracket
		
		private function aeroplaneOnPowerUp(obj1:FlxBasic, obj2:FlxBasic):void 
		{
			trace("aeroplaneOnPowerUp");
			obj2.kill();
			var plane:FlxSprite = obj1 as FlxSprite;
			plane.flicker();
		}
		
		private function aeroplaneOnBullet(obj1:FlxBasic, obj2:FlxBasic):void 
		{
			trace("aeroplaneOnBullet");
			obj2.kill();
			var plane:FlxSprite = obj1 as FlxSprite;
			plane.flicker();
		}
		
		private function aeroplaneOnAeroplane(obj1:FlxBasic, obj2:FlxBasic):void 
		{
			trace("aeroplaneOnAeroplane");
			obj2.kill();
			var plane:Aeroplane = obj1 as Aeroplane;
			plane.flicker();
			--plane.livesLeft;
			plane.noDeath = 120; // 120 frames of no death
			plane.x = 400;
			plane.y = 500;
		}
		
		private function playerBulletOnEnemy(obj1:FlxBasic, obj2:FlxBasic):void 
		{
			trace("playerBulletOnEnemy");
			obj1.kill();
			var plane:FlxSprite = obj2 as FlxSprite;
			plane.flicker();
			plane.kill();
		}		
		
		private function playerBulletOnBoss(obj1:FlxBasic, obj2:FlxBasic):void 
		{
			trace("playerBulletOnEnemy");
			obj1.kill();
			var plane:FlxSprite = obj2 as EnemyBoss;
			plane.flicker();
			plane.hurt(1);
			if (!plane.alive)
			{
				Globals.bossKilled = true;
			}
		}	
	}

}