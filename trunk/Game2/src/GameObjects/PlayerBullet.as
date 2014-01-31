package  GameObjects
{
	/**
	 * ...
	 * @author Anton
	 */
	public class PlayerBullet extends Bullet 
	{
		
		public function PlayerBullet(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			
		}
		
		public override function update():void
		{
			super.update();
			
		}
		
	}

}