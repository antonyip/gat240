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
			add(Globals.playerBulletManager);
			add(aeroplane);
			add(Globals.enemyBulletManager);
			add(Globals.enemyAeroplaneManager);
			add(Globals.powerUpManager);
		} // create close bracket
		
		// called everyframe
		public override function update():void
		{
			super.update();
			FlxG.collide(aeroplane, Globals.powerUpManager, aeroplaneOnPowerUp);
			FlxG.collide(aeroplane, Globals.enemyBulletManager, aeroplaneOnBullet);
			FlxG.collide(aeroplane, Globals.enemyAeroplaneManager, aeroplaneOnAeroplane);
			FlxG.collide(Globals.playerBulletManager, Globals.enemyAeroplaneManager, playerBulletOnEnemy);
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
			var plane:FlxSprite = obj1 as FlxSprite;
			plane.flicker();
		}
		
		private function playerBulletOnEnemy(obj1:FlxBasic, obj2:FlxBasic):void 
		{
			trace("playerBulletOnEnemy");
			obj1.kill();
			var plane:FlxSprite = obj2 as FlxSprite;
			plane.flicker();
		}		
	}

}