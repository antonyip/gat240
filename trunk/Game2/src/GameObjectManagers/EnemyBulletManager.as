package GameObjectManagers 
{
	import GameObjects.EnemyBullet;
	import org.flixel.FlxGroup;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class EnemyBulletManager extends FlxGroup 
	{
		
		public function EnemyBulletManager(MaxSize:uint=0) 
		{
			super(MaxSize);
		}
		
		public function spawnBullet(x:int, y:int, img:Class):void
		{
			add(new EnemyBullet(x, y, img));
		}
	}

}