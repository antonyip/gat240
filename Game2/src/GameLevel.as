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
		private var aeroplane:Aeroplane = new Aeroplane(400, 500, Assets.aeroplaneSprite);
		private var livesLeftOnPlayer:FlxText = new FlxText(10, 10, 600, "Lives Left: ");
		
		// do once when come into game
		public override function create():void
		{
			add(Globals.playerBulletManager);
			add(aeroplane);
			add(Globals.enemyBulletManager);
			add(Globals.enemyAeroplaneManager);
			add(Globals.powerUpManager);
			add(livesLeftOnPlayer);
		} // create close bracket
		
		// called everyframe
		public override function update():void
		{
			super.update();
			// ------------------ update collision			 --------------------------------- //
			FlxG.collide(aeroplane, Globals.powerUpManager, aeroplaneOnPowerUp);
			
			if (aeroplane.noDeath < 0)
			{
				FlxG.collide(aeroplane, Globals.enemyBulletManager, aeroplaneOnBullet);
				FlxG.collide(aeroplane, Globals.enemyAeroplaneManager, aeroplaneOnAeroplane);
			}
			else
			{
				--aeroplane.noDeath;	
			}
			
			FlxG.collide(Globals.playerBulletManager, Globals.enemyAeroplaneManager, playerBulletOnEnemy);
			
			// ---------- update game status --------------------------------- //
			
			// check health less then 0 .. game over :: TODO
			if (aeroplane.livesLeft < 0)
				FlxG.switchState(new GameOver);
			
			// check enemies left == 0 && no more waves .. game victory :: TODO
			
			//------------------- update gui --------------------------------- //
			livesLeftOnPlayer.text = "Lives Left: " + aeroplane.livesLeft.toString();
			
			
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
			plane.y = 550;
		}
		
		private function playerBulletOnEnemy(obj1:FlxBasic, obj2:FlxBasic):void 
		{
			trace("playerBulletOnEnemy");
			obj1.kill();
			var plane:FlxSprite = obj2 as FlxSprite;
			plane.flicker();
			plane.kill();
		}		
	}

}