package GameObjects 
{
	/**
	 * ...
	 * @author Anton Yip
	 */
	public class EnemyShooter extends EnemyObject 
	{
		private var bulletcounterEshooter:int = 0;
		private var fiveSeconds:int = 2 * 60;
		public function EnemyShooter(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
		}
		
		override public function update():void
		{
			super.update();
			++bulletcounterEshooter;
			if (bulletcounterEshooter > fiveSeconds)
			{
				trace("pew");
				bulletcounterEshooter = 0;
				Globals.enemyManager.add(new EnemyBullet(x, y, Assets.enemyBullet));
			}
			
		}
	}

}