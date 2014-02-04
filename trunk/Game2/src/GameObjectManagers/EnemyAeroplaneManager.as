package GameObjectManagers 
{
	import GameObjects.EnemyObject;
	import org.flixel.FlxGroup;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class EnemyAeroplaneManager extends FlxGroup 
	{
		public static var ENEMY_BASIC:String = "enemy_BASIC";
		//public static var POWERUP_SPEED:String = "powerUpSpeed";
		//public static var POWERUP_ATTACK:String = "powerUpAttack";
		//public static var POWERUP_SHIELD:String = "powerUpShield";
		public static var listOfEnemies:Array = [ENEMY_BASIC];
		
		// power up spawn -- so this will make the spawn every 20 - 30 seconds
		public var counter:int = 0;
		public var waitAtLeastHowManyFrames:int = 60 * 10; // 60 frames a second, 10 seconds
		public var minVariance:int = 0; // 60 frames a second, 10 seconds
		public var maxVariance:int = 60 * 10; // 60 frames a second, 10 seconds
		private var timeToNextPowerUp:int = minVariance;
		
		public function EnemyAeroplaneManager(MaxSize:uint=0) 
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
				spawnEnemy(listOfEnemies[Globals.randomInt(0, listOfEnemies.length)]);
				timeToNextPowerUp = Globals.randomInt(minVariance, maxVariance);
			}
		} // update close
		
		public function spawnEnemy(enemyString:String):void
		{
			switch (enemyString) 
			{
				case ENEMY_BASIC:
					add(new EnemyObject(Globals.randomInt(0, 800), 0, Assets.enemySprite));
					break;
					/*
				case POWERUP_SPEED:
					add(new PowerUp(Globals.randomInt(0, 800), 0, Assets.speedPowerUp));
					break;
					
				case POWERUP_ATTACK:
					add(new PowerUp(Globals.randomInt(0, 800), 0, Assets.attackPowerUp));
					break;
					
				case POWERUP_SHIELD:
					add(new PowerUp(Globals.randomInt(0, 800), 0, Assets.shieldPowerUp));
					break;
					*/
				default:
					trace ("unknown eenmy");
					break;
			}
		}
		
		
		
	}

}