package GameObjects 
{
	/**
	 * ...
	 * @author Anton
	 */
	public class EnemyShooter extends EnemyObject 
	{
		private var rateOfFireCounter:int = 0;
		private var rateOfFire:int = 60;
		public function EnemyShooter(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
		}
		
		public override function update():void
		{
			super.update();
			++rateOfFireCounter;
			if (rateOfFireCounter > rateOfFire)
			{
				rateOfFireCounter = 0;
				Globals.enemyBulletManager.spawnBullet(x, y, Assets.enemyBullet);
			}
		}
	}

}