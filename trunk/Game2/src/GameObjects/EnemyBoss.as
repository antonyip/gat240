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
			health = 20;			
		}
		
		public function doStuffs(e:FlxTimer):void
		{
			bCounter ++;
			//trace(bCounter);
			switch (bCounter) 
			{		
				//DIAMOND TO THE LEFT
				case 1:
					trace("hello");
					velocity.y = 50;
					velocity.x = -180;
					break;				
				case 8:
					trace("stage2");
					velocity.y = 50;
					velocity.x = 180;
					break;				
				case 15:
					trace("stage3");
					velocity.y = -50;
					velocity.x = 180;
					break;				
				case 22:
					trace("stage4");
					velocity.y = -50;
					velocity.x = -180;
					break;				
				case 29:
					trace ("steady");
					velocity.y = 0;
					velocity.x = 0;
					break;
				
				//SEMI-CIRCLE TO THE LEFT
				case 34:
					trace("circle straight right");
					velocity.y = 5;
					velocity.x = 100;
					break;
				case 44:
					trace("circle curve left 1");
					velocity.y = 70;
					velocity.x = -50;
					break;
				case 48:
					trace("circle curve left 2");
					velocity.y = 60;
					velocity.x = -95;
					break;
				case 50:
					trace("circle curve left 3");
					velocity.y = 55;
					velocity.x = -145;
					break;
				case 54:
					trace("circle straight left");
					velocity.y = 0;
					velocity.x = -145;
					break;
				case 58:
					trace("circle curve right 1");
					velocity.y = -55;
					velocity.x = -145;
					break;
				case 60:
					trace("circle curve right 2");
					velocity.y = -60;
					velocity.x = -95;
					break;
				case 64:
					trace("circle curve right 3");
					velocity.y = -70;
					velocity.x = -50;
					break;
				
				//LINES TO THE RIGHT AND LEFT
				case 68:
					trace("line straight right 1");
					velocity.y = 0;
					velocity.x = 250;
					break;				
				case 80:
					trace("line straight left 2");
					velocity.y = 0;
					velocity.x = -250;
					break;				
				case 90:
					trace("line straight right 3");
					velocity.y = 0;
					velocity.x = 250;
					break;				
				case 97:
					trace("line straight left 4");
					velocity.y = 0;
					velocity.x = -250;
					break;				
				case 106:
					trace("steady");
					velocity.y = 0;
					velocity.x = 0;
					break;
				
				//SECOND SEMI-CIRCLE				
				case 111:
					trace("circle curve right 3");
					velocity.y = 70;
					velocity.x = 50;
					break;				
				case 115:
					trace("circle curve right 2");
					velocity.y = 60;
					velocity.x = 95;
					break;				
				case 119:
					trace("circle curve right 1");
					velocity.y = 55;
					velocity.x = 145;
					break;				
				case 123:
					trace("circle straight left");
					velocity.y = 0;
					velocity.x = 145;
					break;				
				case 127:
					trace("circle curve left 3");
					velocity.y = -55;
					velocity.x = 145;
					break;				
				case 131:
					trace("circle curve left 2");
					velocity.y = -60;
					velocity.x = 95;
					break;				
				case 135:
					trace("circle curve left 1");
					velocity.y = -70;
					velocity.x = 50;
					break;				
				case 139:
					trace("back to origin");
					velocity.y = 0;
					velocity.x = -190;
					break;				
				case 147:
					trace("steady");
					velocity.y = 0;
					velocity.x = 0;
					break;
				case 152:
					trace("restarts");
					bCounter = 0;
					break;
				
				default:
			}
		}
		
		public override function update():void 
		{
			super.update();
			
		}
	}

}