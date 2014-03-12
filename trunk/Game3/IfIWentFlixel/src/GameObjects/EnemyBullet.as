package GameObjects 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class EnemyBullet extends Bullet 
	{
		
		public function EnemyBullet(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			velocity.x = 500;
		}
		
		public override function update():void
		{
			super.update();
			if (velocity.x == 0)
				kill();
			velocity.x = 500;				
			velocity.y = 0;
		}
	}

}