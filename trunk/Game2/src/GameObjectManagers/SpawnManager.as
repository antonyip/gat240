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
			//counter = 6;
			baseTimer = new FlxTimer();
			baseTimer.start(1, 999999, this.doStuffs);
		}
		
		public function doStuffs(e:FlxTimer):void 
		{
			++counter;
			trace(counter);
			switch (counter)
			{
				case 1:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 300, 0);
					break;
				case 2:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 500, 0);
					break;
				case 3:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 200, -20);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 600, 0);
					break;
					
				case 4:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 400, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 550, -60);
					break;
					
				case 5:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 439, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 325, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 520, -30);
					break;					
				case 6:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 150, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 250, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 663, -50);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 335, -40);
					break;
				case 7:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 123, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 423, -60);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 300, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 590, -40);
					break;
					
				case 8:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 250, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 500, -50);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 635, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 389, -100);
					break;
					
				case 9:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 120, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 245, -30);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 329, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 630, -60);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 450, -120);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 520, -120);
					break;
				case 10:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 220, -50);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 310, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 500, -80);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 439, 0);
					break;
				case 11:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 610, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 135, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 360, -70);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 230, -100);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 410, -10);
					break;
					
				case 12:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 214, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 435, -120);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 128, -60);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 523, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 690, -50);
					break;
					
				case 13:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 610, -50);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 315, -140);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 110, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 465, -70);
					break;
					
				case 14:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 150, -120);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 450, -5);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 650, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 311, -50);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 197, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 525, -80);
					break;
				case 15:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 387, -100);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 149, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 567, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 256, -65);
					break;
				case 16:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 145, -60);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 621, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 389, -20);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 269, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 498, -120);
					break;
					
				case 17:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 232, -80);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 432, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 635, -50);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 125, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 545, -20);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 379, -120);
					break;
				case 18:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 553, -60);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 325, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 461, -10);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 200, -100);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 689, 0);
					break;
				case 19:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 170, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 435, -20);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 590, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 305, -75);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 700, -100);
					break;
					
				case 20:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 410, -30);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 268, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 549, -90);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 130, -120);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 670, 0);
					break;
					
				case 21:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 124, -10);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 511, -50);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 690, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 251, -100);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 480, -20);
					break;
				case 22:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 125, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 225, -100);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 325, -50);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 425, -120);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 525, -10);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 625, -80);
					break;
				case 23:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 125, -65);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 225, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 325, -100);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 425, -35);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 525, -120);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_CHASER, 625, -15);
					break;
				case 24:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 125, -80);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 225, -35);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 325, -120);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 425, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 525, -100);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 625, -15);
					break;
					
				case 26:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BOSS);
					break;
				case 27:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 439, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 325, -60);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 520, -30);
					break;
				case 28:
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 190, -20);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 310, -100);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_SHOOTER, 435, 0);
					Globals.enemyAeroplaneManager.spawnEnemy(EnemyAeroplaneManager.ENEMY_BASIC, 550, -60);
					counter = 5;
					break;
			}
		}
	}
}