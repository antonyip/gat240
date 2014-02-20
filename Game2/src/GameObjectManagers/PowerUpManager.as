package GameObjectManagers 
{
	import GameObjects.PowerUp;
	import org.flixel.FlxGroup;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class PowerUpManager extends FlxGroup 
	{
		public var timer:int = 0;
		
		public static var POWERUP_HEALTH:String = "powerUpHealth";
		public static var POWERUP_SPEED:String = "powerUpSpeed";
		public static var POWERUP_ATTACK:String = "powerUpAttack";
		public static var listOfPowerUps:Array = [POWERUP_HEALTH, POWERUP_SPEED, POWERUP_ATTACK];
		
		
		// power up spawn -- so this will make the spawn every 20 - 30 seconds
		public var waitAtLeastHowManyFrames:int = 60 * 10; // 60 frames a second, 10 seconds
		public var minVariance:int = 0; // 60 frames a second, 10 seconds
		public var maxVariance:int = 60 * 10; // 60 frames a second, 10 seconds
		private var timeToNextPowerUp:int = minVariance;
		public var counter:int = 0;
		
		public function PowerUpManager(MaxSize:uint=0) 
		{
			super(MaxSize);
		}
		
		override public function update():void
		{
			super.update();
			++counter;
			if (counter >= waitAtLeastHowManyFrames + timeToNextPowerUp)
			{
				counter = 0;
				spawnPowerUp(listOfPowerUps[Globals.randomInt(0, listOfPowerUps.length)]);
				timeToNextPowerUp = Globals.randomInt(minVariance, maxVariance);
			}
		}
		
		public function spawnPowerUp(pwrUp:String):void
		{
			switch (pwrUp) 
			{
				case POWERUP_HEALTH:
					add(new PowerUp(Globals.randomInt(0, 750), 0, Assets.healthPowerUp,POWERUP_HEALTH)); //  z
					break;
					
				case POWERUP_SPEED:
					add(new PowerUp(Globals.randomInt(0, 750), 0, Assets.speedPowerUp,POWERUP_SPEED)); // x
					break;
					
				case POWERUP_ATTACK:
					add(new PowerUp(Globals.randomInt(0, 750), 0, Assets.attackPowerUp,POWERUP_ATTACK)); // c
					break;
				default:
					trace ("unknown power up");
					break;
			}
		}
	}

}