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
		private var moveSpeed:int = 600;
		private var jumpSpeed:int = 800;
		private var jumpingSeconds:int = 3;
		private var gravity:int = 4000;
		public var onFloor:Boolean = true;
		public var doubleJump:Boolean = true;
		public var livesLeft:int = 3;
		
		// physics stuffs
		
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
				//if (onFloor && doubleJump)
					velocity.x = -moveSpeed;
				//else
					//velocity.x = -moveSpeed / 10;
			}
			else if (FlxG.keys.D || FlxG.keys.RIGHT)
			{
				//if (onFloor && doubleJump)
					velocity.x = moveSpeed;
				//else
					//velocity.x = moveSpeed / 10;
			}
			else
			{
				if (onFloor && doubleJump)
					velocity.x = 0;
			}
			
			if ((FlxG.keys.justPressed("W") || FlxG.keys.justPressed("SPACE")) && (onFloor || doubleJump))
			{
				velocity.y = -jumpSpeed;
				FlxG.loadSound(Assets.jumpSound).play();
				if (!onFloor)
				{
					doubleJump = false;
				}
				else
				{
					onFloor = false;
				}
				
			}
			
			
		}
		
	}

}