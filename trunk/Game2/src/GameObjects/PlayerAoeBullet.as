package GameObjects
{
	import GameObjects.PlayerBullet;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class PlayerAoeBullet extends PlayerBullet 
	{
		
		public function PlayerAoeBullet(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			velocity.y = -bulletSpeed * 10;
			drag.y = 100;
		}
		
		override public function update():void
		{
			super.update();
			if (velocity.y >= -10)
			{
				kill();
			}
		}
		
	}

}