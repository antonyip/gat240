package GameObjectManagers 
{
	import org.flixel.FlxGroup;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class CheckPointManager extends FlxGroup 
	{
		
		public var saveSpotX:int = 0;
		public var saveSpotY:int = 0;
		
		public function CheckPointManager(MaxSize:uint=0) 
		{
			super(MaxSize);
		}
		
	}

}