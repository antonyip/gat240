package GameObjects 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class Aeroplane extends FlxSprite 
	{
		private var moveSpeed:int = 1000;
		private var jumpSpeed:int = 500;
		private var jumpingSeconds:int = 3;
		private var gravity:int = 1000;
		
		public function Aeroplane(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
		}
		
		public override function update():void
		{
			super.update();
			acceleration.y = gravity;
			if (FlxG.keys.A || FlxG.keys.LEFT)
			{
				velocity.x = -moveSpeed;
			}
			else if (FlxG.keys.D || FlxG.keys.RIGHT)
			{
				velocity.x = moveSpeed;
			}
			else
			{
				velocity.x = 0;
			}
			
			if (FlxG.keys.W || FlxG.keys.SPACE)
			{
				velocity.y = -jumpSpeed;
			}
			
		}
		
	}

}