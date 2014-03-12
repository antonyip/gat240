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
				isPositiveDirection = true;
			}
			
			if (isPositiveDirection)
			{
				x = originalPos.x + (endPoint.x - originalPos.x) * timeInFramesCounter / (timeInFrames / 2.0);
				y = originalPos.y + (endPoint.y - originalPos.y) * timeInFramesCounter / (timeInFrames / 2.0);
			}
			else
			{
				x = endPoint.x - (endPoint.x - originalPos.x) * (timeInFramesCounter-(timeInFrames/2)) / (timeInFrames / 2.0);
				y = endPoint.y - (endPoint.y - originalPos.y) * (timeInFramesCounter-(timeInFrames/2)) / (timeInFrames / 2.0);
			}
		}
	}

}