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
			
		}
		
		public override function update():void
		{
			super.update();
			y += 5;
		}
	}

}