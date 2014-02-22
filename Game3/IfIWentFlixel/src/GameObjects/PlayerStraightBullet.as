package GameObjects
{
	import GameObjects.PlayerBullet;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class PlayerStraightBullet extends PlayerBullet 
	{
		
		public function PlayerStraightBullet(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
		}
		
		override public function update():void
		{
			super.update();
			y -= bulletSpeed;
		}
		
	}

}