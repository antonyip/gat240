package GameObjects 
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class Aeroplane extends FlxSprite 
	{
		
		public function Aeroplane(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
		}
		
		public override function update():void
		{
			if (FlxG.keys.SPACE)
			{
				Globals.playerBulletManager.createNormalBullet(x, y);
			}
			if (FlxG.keys.A)
			{
				x--;
			}
			if (FlxG.keys.D)
			{
				x++;
			}
		}
		
	}

}