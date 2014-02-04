package GameObjectManagers 
{
	import GameObjects.PlayerBullet;
	import GameObjects.PlayerStraightBullet;
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
		
	}

}