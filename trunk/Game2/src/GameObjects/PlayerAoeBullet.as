package GameObjects
{
	import GameObjects.PlayerBullet;
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author Anton
	 */
	public class PlayerAoeBullet extends PlayerBullet 
	{
		private var enemyTarget:EnemyObject;
		
		public function PlayerAoeBullet(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			bulletSpeed = 500;
			var minDistance:Number = 999999999;
			for (var i:int = 0; i < Globals.enemyAeroplaneManager.length; i++) 
			{
				var enemy:EnemyObject = Globals.enemyAeroplaneManager.members[i] as EnemyObject;
				var distanceBetweenObjects:Number = FlxU.getDistance(enemy.getMidpoint(),getMidpoint());
				if (enemy.alive && distanceBetweenObjects < minDistance)
				{
					minDistance = distanceBetweenObjects;
					enemyTarget = enemy;
				}
			}
		}
		
		override public function update():void
		{
			super.update();
			if (enemyTarget)
			{
				if (enemyTarget.alive)
				{
					// calculate the new position if the enemy is alive
					var distanceBetweenObjects:Number = FlxU.getDistance(enemyTarget.getMidpoint(), getMidpoint());
					velocity.x = (enemyTarget.x - x) / distanceBetweenObjects * bulletSpeed;
					velocity.y = (enemyTarget.y - y) / distanceBetweenObjects * bulletSpeed;
				}
			}
			else
			{
				y -= 5;
			}
		}
		
	}

}