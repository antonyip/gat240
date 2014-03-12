package  
{
	/**
	 * ...
	 * @author Anton
	 */
	public class Assets 
	{
		[Embed(source = "../art/Test Art/Ametrine Crystal01.png")]
		public static var testArt1:Class
		
		[Embed(source = "../art/Test Art/Ametrine Crystal02.png")]
		public static var testArt2:Class
		
		[Embed(source = "../art/Test Art/Ametrine Crystal03.png")]
		public static var testArt3:Class
		
		[Embed(source="../art/TempArt/Player.png")]
		public static var aeroplaneSprite:Class;
		
		[Embed(source="../art/Enemies/Enemy_1.png")]
		public static var enemySprite:Class;
		
		[Embed(source="../art/Enemies/Enemy_2.png")]
		public static var enemyShooter:Class;
		
		[Embed(source="../art/Enemies/Enemy_3.png")]
		public static var enemyChaser:Class;
		
		[Embed(source="../art/Enemies/Boss/Boss_Full.png")]
		public static var enemyBoss:Class;
		
		[Embed(source="../art/Enemies/Enemy_Bullet_1.png")]
		public static var enemyBullet:Class;
		
		[Embed(source="../art/Player_Bullet.png")]
		public static var bulletSprite:Class;
		
		[Embed(source="../art/Kill_All_Enemies_PU.png")]
		public static var healthPowerUp:Class;
		
		[Embed(source="../art/Shield_PU.png")]
		public static var speedPowerUp:Class;
		
		[Embed(source = "../art/Test Art/Ametrine Crystal03.png")]
		public static var shieldPowerUp:Class;
		
		[Embed(source="../art/Freeze_Enemies_PU.png")]
		public static var attackPowerUp:Class;
		
		[Embed(source="../art/Screens/MainMenu.png")]
		public static var mainMenuBG:Class;
		
		[Embed(source="../art/Screens/Background.png")]
		public static var GameLevelBG:Class;
		
		[Embed(source="../art/Screens/DefeatScreen.png")]
		public static var LoseLevelBG:Class;
		
		[Embed(source="../art/Screens/VictoryScreen.png")]
		public static var WinLevelBG:Class;
		
		[Embed(source="../sound/SolidStudiosMenuMusic.mp3")]
		public static var backgroundMusic:Class;
		
		[Embed(source="../sound/Fx07.mp3")]
		public static var jumpSound:Class;
		
		[Embed(source="../sound/Book.mp3")]
		public static var deathSound:Class;
		
		[Embed(source="../sound/Fx09.mp3")]
		public static var enemyDeathSound1:Class;
		
		[Embed(source="../sound/Fx11.mp3")]
		public static var enemyDeathSound2:Class;
		
		[Embed(source="../sound/Fx07.mp3")]
		public static var enemyDeathSound3:Class;
		
		[Embed(source="../sound/Fx09.mp3")]
		public static var victorySound:Class;
		
		[Embed(source="../art/TempArt/Normal_Tile.png")]
		public static var normalTile:Class;
		
		[Embed(source="../art/TempArt/MovingPlatform_.png")]
		public static var movingTile:Class;
		
		[Embed(source="../art/TempArt/BounceTile_.png")]
		public static var bouncingTile:Class;
		
		[Embed(source="../art/TempArt/Enemy.png")]
		public static var enemy:Class;
		
		[Embed(source="../art/TempArt/Spikes.png")]
		public static var spikes:Class;
		
		[Embed(source="../art/TempArt/Upside_Down_Spike.png")]
		public static var upsidedownspikes:Class;
		
		[Embed(source="../art/TempArt/Check_Point.png")]
		public static var checkpoint:Class;
		
		[Embed(source = "../GameLevel.csv", mimeType = "application/octet-stream")]
		public static var gameLevelCSV:Class;
		
		public function Assets() 
		{
			
		}
		
	}

}