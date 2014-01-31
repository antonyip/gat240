package  GameObjects
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class Bullet extends FlxSprite 
	{
		public var bulletSpeed:Number = 20; // default bullet speed
		public var isDead:Boolean = true;
		
		public function Bullet(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
		}
		
		public function create():void
		{
			isDead = false;
		}
		
		public override function update():void
		{
			if (isDead) // if itsDead, dont bother updating
				return;
				
			super.update();
		}
	}

}