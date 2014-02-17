package GameObjectManagers 
{
	import org.flixel.FlxTimer;
	/**
	 * ...
	 * @author Anton Yip
	 */
	public class SpawnManager 
	{
		private var baseTimer:FlxTimer;
		private var counter:int;
		
		public function SpawnManager() 
		{
			counter = 0;
			baseTimer = new FlxTimer();
			baseTimer.start(1, 10, this.doStuffs);
		}
		
		public function doStuffs(e:FlxTimer):void 
		{
			++counter;
			switch (counter)
			{
				case 1:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BOSS);
					break;
				case 4:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC);
					break;
				case 8:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER);
					break;
				case 12:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER);
					break;
				case 16:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BOSS);
					break;
			}
		}
		
	}

}