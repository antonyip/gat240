package GameObjectManagers 
{
	import GameObjects.*;
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author Anton
	 */
	public class PlayerBulletManager extends FlxGroup
	{
		public function PlayerBulletManager() 
		{
			super();
		}
		
		public function createNormalBullet(x:Number, y:Number):void
		{
			add(new PlayerStraightBullet(x, y, Assets.bulletSprite));
		}
		
		public function createSpreadBullet(x:Number, y:Number):void
		{
			add(new PlayerSpreadBullet(x, y, Assets.bulletSprite, 1));
			add(new PlayerSpreadBullet(x, y, Assets.bulletSprite, 2));
			add(new PlayerSpreadBullet(x, y, Assets.bulletSprite, 3));
		}
		
		public function createAoeBullet(x:Number, y:Number):void
		{
			add(new PlayerAoeBullet(x, y, Assets.bulletSprite));
		}
		
	}

}