package GameObjects 
{
	/**
	 * ...
	 * @author Anton
	 */
	public class EnemyBoss extends EnemyObject 
	{
		
		public function EnemyBoss(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			health = 10;
			
		}
		public override function update():void 
		{
			super.update();
		}
	}

}