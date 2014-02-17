package GameObjectManagers 
{
	import GameObjects.EnemyBoss;
	import GameObjects.EnemyChaser;
	import GameObjects.EnemyObject;
	import GameObjects.EnemyShooter;
	import org.flixel.FlxGroup;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class EnemyAeroplaneManager extends FlxGroup 
	{
		public static var ENEMY_BASIC:String = "ENEMY_BASIC";
		public static var ENEMY_CHASER:String = "ENEMY_CHASER";
		public static var ENEMY_BOSS:String = "ENEMY_BOSS";
		public static var ENEMY_SHOOTER:String = "ENEMY_SHOOTER";
		public static var listOfEnemies:Array = [ENEMY_BASIC,
												ENEMY_CHASER,
												ENEMY_SHOOTER];
		
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
					add(new EnemyObject(Globals.randomInt(0, 750), 0, Assets.enemySprite));
					break;
					
				case ENEMY_CHASER:
					add(new EnemyChaser(Globals.randomInt(0, 750), 0, Assets.enemyChaser));
					break;
					
				case ENEMY_SHOOTER:
					add(new EnemyShooter(Globals.randomInt(0, 750), 0, Assets.enemyShooter));
					break;
					
				case ENEMY_BOSS:
					Globals.enemyBossManager.add(new EnemyBoss(Globals.randomInt(0, 750), 0, Assets.enemyBoss));
					trace("Boss Added");
					break;
					
				default:
					trace ("unknown eenmy");
					break;
			}
		}
		
		
		
	}

}