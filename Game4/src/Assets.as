package  
{
	/**
	 * ...
	 * @author Anton
	 */
	public class Assets 
	{
		
		[Embed(source="../art/TempArt/Player.png")]
		public static var aeroplaneSprite:Class;
		
		[Embed(source="../art/FinalArt/Enemy_Bullet.png")]
		public static var enemyBullet:Class;
		
		[Embed(source="../art/Player_Bullet.png")]
		public static var bulletSprite:Class;
		
		[Embed(source="../art/Kill_All_Enemies_PU.png")]
		public static var healthPowerUp:Class;
		
		[Embed(source="../art/FinalArt/MainMenu.png")]
		public static var mainMenuBG:Class;
		
		[Embed(source="../art/FinalArt/Background.png")]
		public static var GameLevelBG:Class;
		
		[Embed(source="../art/FinalArt/Defeated_Screen.png")]
		public static var LoseLevelBG:Class;
		
		[Embed(source="../art/FinalArt/Victory_Screen.png")]
		public static var WinLevelBG:Class;
		
		[Embed(source="../sounds/PossibleBg_1.mp3")]
		public static var backgroundMusic:Class;
		
		[Embed(source="../sounds/JumpSound.mp3")]
		public static var jumpSound:Class;
		
		[Embed(source="../sounds/BounceSound.mp3")]
		public static var bounceSound:Class;
		
		[Embed(source="../sounds/DeathSound.mp3")]
		public static var deathSound:Class;
		
		[Embed(source = "../sounds/CheckPointSound.mp3")]
		public static var checkPointSound:Class;
		
		[Embed(source="../sounds/PowerUp_Sound.mp3")]
		public static var pupSound:Class;
		
		[Embed(source="../sound/Fx09.mp3")]
		public static var enemyDeathSound1:Class;
		
		[Embed(source="../sound/Fx11.mp3")]
		public static var enemyDeathSound2:Class;
		
		[Embed(source="../sound/Fx07.mp3")]
		public static var enemyDeathSound3:Class;
		
		[Embed(source="../sound/Fx09.mp3")]
		public static var victorySound:Class;
		
		[Embed(source="../art/FinalArt/Normal_Tile.png")]
		public static var normalTile:Class;
		
		[Embed(source="../art/FinalArt/MovingPlatform_.png")]
		public static var movingTile:Class;
		
		[Embed(source="../art/FinalArt/Normal_Tile_Over.png")]
		public static var normalTileCover:Class;
		
		[Embed(source="../art/FinalArt/BounceTile_.png")]
		public static var bouncingTile:Class;
		
		[Embed(source="../art/FinalArt/BounceTile.png")]
		public static var bouncingTileOver:Class;
		
		[Embed(source="../art/FinalArt/Enemy.png")]
		public static var enemy:Class;
		
		[Embed(source="../art/FinalArt/ShootingEnemy.png")]
		public static var shootingEnemy:Class;
		
		[Embed(source="../art/FinalArt/Spikes.png")]
		public static var spikes:Class;
		
		[Embed(source="../art/FinalArt/Upside_Down_Spike.png")]
		public static var upsidedownspikes:Class;
		
		[Embed(source="../art/FinalArt/Check_Point.png")]
		public static var checkpoint:Class;
		
		[Embed(source = "../GameLevel.csv", mimeType = "application/octet-stream")]
		public static var gameLevelCSV:Class;
		
		[Embed(source="../art/FinalArt/DeerAll.png")]
		public static var playerWalkTest:Class;
		
		[Embed(source="../art/FinalArt/Health_PU.png")]
		public static var healthPowerUpImage:Class;
		
		[Embed(source = "../art/FinalArt/Key.png")]
		public static var keyImage:Class;
		
		[Embed(source = "../art/FinalArt/Exit_Door.png")]
		public static var exitImage:Class;
		
		[Embed(source="../art/FinalArt/WallJump_Tile.png")]
		public static var wallJumpWall:Class;
		
		[Embed(source = "../art/FinalArt/WallJump_Tile_Over.png")]
		public static var wallJumpWallOver:Class;
		
		public function Assets() 
		{
			
		}
		
	}

}