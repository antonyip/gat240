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
		public static var WEAPON_BASIC:String = "basicWeapon";
		public static var WEAPON_SPREAD:String = "spreadWeapon";
		public static var WEAPON_CHASE:String = "chaser";
		public var livesLeft:int;
		public var noDeath:int = 0;
		
		// movement
		public var planeAccleration:Number = 12; //original 5, cali has tried 10 and likes it :3
		
		// fire
		public var rateOfFire:int = 12; // 12 frames shoot 1 bullet
		private var rateOfFireCounter:int = 0;
		
		// weapons
		private var weaponType:String = WEAPON_BASIC;
		private var listOfWeapons:Array = [WEAPON_BASIC, WEAPON_SPREAD, WEAPON_CHASE];
		private var weaponTypeCounter:int = 0;
		private var shootingPoint:FlxPoint = new FlxPoint(0, 0);
		
		public function Aeroplane(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			
			// variables of movements
			maxVelocity.x = 200;
			maxVelocity.y = 200;
			//drag.x
			//drag.y
			livesLeft = 10;
			
			shootingPoint.x = width / 2;
			shootingPoint.y = 0;
		}
		
		public function switchNextWeapon():void
		{
			++weaponTypeCounter;
			if (weaponTypeCounter == listOfWeapons.length)
				weaponTypeCounter = 0;
			weaponType = listOfWeapons[weaponTypeCounter];
		}
		
		public override function update():void
		{
			++rateOfFireCounter;
			if (FlxG.keys.SPACE)
			{
				switch (weaponType) 
				{
				case WEAPON_BASIC:
					if (rateOfFireCounter >= rateOfFire)
					{
						rateOfFireCounter = 0;
						Globals.playerBulletManager.createNormalBullet(x + shootingPoint.x, y + shootingPoint.y);
					}
					break;
					
				case WEAPON_SPREAD:
					if (rateOfFireCounter >= rateOfFire)
					{
						rateOfFireCounter = 0;
						Globals.playerBulletManager.createSpreadBullet(x+ shootingPoint.x, y + shootingPoint.y);
					}
				break;
				case WEAPON_CHASE:
					if (rateOfFireCounter >= rateOfFire)
					{
						rateOfFireCounter = 0;
						Globals.playerBulletManager.createAoeBullet(x+shootingPoint.x,y+ shootingPoint.y);
					}
				break;				
				default:
					
					break;
				}

			}
			if (FlxG.keys.A || FlxG.keys.LEFT)
			{
				velocity.x -= planeAccleration;
			}
			if (FlxG.keys.D || FlxG.keys.RIGHT)
			{
				velocity.x += planeAccleration;
			}
			if (FlxG.keys.W || FlxG.keys.UP)
			{
				velocity.y -= planeAccleration;
			}
			if (FlxG.keys.S || FlxG.keys.DOWN)
			{
				velocity.y += planeAccleration;
			}
			if (FlxG.keys.justPressed("F"))
			{
				switchNextWeapon();
			}
			if (x < 0 || x > 800-width)
				velocity.x *= -1;
			if (y < 0 || y > 600-height)
				velocity.y *= -1;
		}
		
	}

}