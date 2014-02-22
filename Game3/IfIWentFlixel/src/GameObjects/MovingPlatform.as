package GameObjects 
{
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author Anton
	 */
	public class MovingPlatform extends Platform 
	{
		private var endPoint:FlxPoint = new FlxPoint();
		private var timeInFrames:int;
		private var timeInFramesCounter:int;
		private var isPositiveDirection:Boolean = true;
		private var originalPos:FlxPoint = new FlxPoint();
		
		public function MovingPlatform(X:Number=0, Y:Number=0, SimpleGraphic:Class=null, _endX:int = 0, _endY:int = 0, _timeInFrames:int = 240, _type:String = "moving_platform")
		{
			super(X, Y, SimpleGraphic);
			originalPos.x = X;
			originalPos.y = Y;
			endPoint.x = _endX;
			endPoint.y = _endY;
			timeInFrames = _timeInFrames;
			myType = _type;
		}
		
		public override function update():void
		{
			++timeInFramesCounter;
			
			// figure out going there or back
			if (timeInFramesCounter > timeInFrames / 2)
			{
				isPositiveDirection = false;			
			}
			else
			{
				isPositiveDirection = true;
			}
			
			// reset if over
			if (timeInFramesCounter > timeInFrames)
			{
				timeInFramesCounter = 0;
			}
			
			if (isPositiveDirection)
			{
				velocity.x = endPoint.x - originalPos.x;
				velocity.y = endPoint.y - originalPos.y;
			}
			else
			{
				velocity.x = -(endPoint.x - originalPos.x);
				velocity.y = -(endPoint.y - originalPos.y);
			}
		}
	}

}