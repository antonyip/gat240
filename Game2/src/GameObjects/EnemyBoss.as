package GameObjects 
{
	import org.flixel.FlxTimer;
	/**
	 * ...
	 * @author Anton
	 */
	public class EnemyBoss extends EnemyObject 
	{
		private var timer:FlxTimer;
		private var bCounter:int = 0;
		public function EnemyBoss(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			timer = new FlxTimer();
			timer.start(0.2, 9999999, doStuffs);
			health = 10;			
		}
		
		public function doStuffs(e:FlxTimer):void
		{
			//bCounter += Math.ceil(e.time);
			bCounter ++;
			trace(bCounter);
			switch (bCounter) 
			{
				case 1:
					trace("hello");
					velocity.y = 50;
					velocity.x = -200;
				break;
				
				case 8:
					trace("stage2");
					velocity.y = 50;
					velocity.x = 200;
				break;
				
				case 16:
					trace("stage3");
					velocity.y = -50;
					velocity.x = 200;
				break;
				
				case 32:
					trace("stage4");
					velocity.y = -50;
					velocity.x = -200;
				
				default:
			}
		}
		
		public override function update():void 
		{
			super.update();
			
		}
	}

}