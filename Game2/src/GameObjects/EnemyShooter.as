package GameObjects 
{
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author Anton
	 */
	public class EnemyShooter extends EnemyObject 
	{
		private var rateOfFireCounter:int = 0;
		private var rateOfFire:int = 90;
		private var shootingPoint:FlxPoint = new FlxPoint(0, 0);
		public function EnemyShooter(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			
			shootingPoint.x = width / 2;
			shootingPoint.y = height;
		}
		
		public override function update():void
		{
			super.update();
			++rateOfFireCounter;
			if (rateOfFireCounter > rateOfFire)
			{
				rateOfFireCounter = 0;
				Globals.enemyBulletManager.spawnBullet(x + shootingPoint.x-Globals.widthOfBullet1 ,y + shootingPoint.y, Assets.enemyBullet);
			}
		}
	}

}