package GameObjects 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class EnemyObject extends FlxSprite 
	{
		private var speed:int = 150;
		
		public function EnemyObject(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			velocity.y = speed;
		}
		
		public override function update():void
		{
			super.update();
		}
		
	}

}