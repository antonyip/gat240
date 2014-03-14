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
		private var animationLeft:Boolean = false;
		private var animationRight:Boolean = false;
		private var animationJump:Boolean = false;
		public var allowControl:Boolean = true;
		// physics stuffs
		
		public function Aeroplane(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			allowControl = true;
		}
		
		public override function update():void
		{
			super.update();
			acceleration.y = gravity;
			
			if (allowControl)
			{
				if (FlxG.keys.A || FlxG.keys.LEFT)
				{
					//if (onFloor && doubleJump)
						velocity.x = -moveSpeed;
					//else
						//velocity.x = -moveSpeed / 10;
					if (onFloor)
					if (!animationLeft)
					{
						animationLeft = true;
						animationRight = false;
						animationJump = false;
						this.play("walk", true);

					}
					
					if (this.scale.x > 0)
					{
						this.scale.x = -this.scale.x;
					}
				}
				else if (FlxG.keys.D || FlxG.keys.RIGHT)
				{
					//if (onFloor && doubleJump)
						velocity.x = moveSpeed;
					//else
						//velocity.x = moveSpeed / 10;
					if (onFloor)
					if (!animationRight)
					{
						animationLeft = false;
						animationRight = true;
						animationJump = false;
						this.play("walk", true);
					}					
						
					if (this.scale.x < 0)
					{
						this.scale.x = -this.scale.x;
					}
				}
				else
				{
					if (onFloor && doubleJump)
					{
						velocity.x = 0;
						this.play("idle", false);
					}
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
					if (!animationJump)
					{
						animationLeft = false;
						animationRight = false;
						animationJump = true;
						this.play("jump", true);
					}
				}
			}
			
			
		}
		
	}

}