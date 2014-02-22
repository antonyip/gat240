package GameObjects 
{
	/**
	 * ...
	 * @author Anton
	 */
	public class BouncingPlatform extends Platform 
	{
		
		public function BouncingPlatform(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			myType = Platform.BOUNCING_PLATFORM;
		}
		
	}

}