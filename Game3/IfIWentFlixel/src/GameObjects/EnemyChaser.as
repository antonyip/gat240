package GameObjects 
{
	/**
	 * ...
	 * @author Anton
	 */
	import org.flixel.FlxU;

	public class EnemyChaser extends EnemyObject 
	{
		private var target:Aeroplane;
		
		public function EnemyChaser(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			
		}
		
		public override function update():void
		{
			super.update();
			if (getMidpoint().y > Globals.aeroplane.getMidpoint().y)
			{
				velocity.y = 50;
				target = null;
			}
			else if (FlxU.getDistance(Globals.aeroplane.getMidpoint(), getMidpoint()) < 300)
			{
				//trace(FlxU.getDistance(Globals.aeroplane.getMidpoint(), getMidpoint()));
				target = Globals.aeroplane;
			}
			
			if (target)
			{
				// calculate the new position if the enemy is alive
				var distanceBetweenObjects:Number = FlxU.getDistance(target.getMidpoint(), getMidpoint());
				velocity.x = (target.x - x) / distanceBetweenObjects * 250;
				velocity.y = (target.y - y) / distanceBetweenObjects * 250;
			}
		}
		
	}

}