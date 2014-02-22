package GameObjects
{
	import GameObjects.PlayerBullet;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class PlayerSpreadBullet extends PlayerBullet 
	{
		private var which:int;
		public function PlayerSpreadBullet(X:Number=0, Y:Number=0, SimpleGraphic:Class=null, which_:int = 0)
		{
			super(X, Y, SimpleGraphic);
			which = which_;
		}
		
		override public function update():void
		{
			super.update();
			switch (which) 
			{
			case 1:
				x -= bulletSpeed;
				break;
			case 3:
				x += bulletSpeed;
				break;
			default:
				break;
			}
			y -= bulletSpeed;
		}
		
	}

}