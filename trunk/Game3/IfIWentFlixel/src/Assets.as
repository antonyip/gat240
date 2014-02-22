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
		
		[Embed(source="../art/Player.png")]
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
		
		public function Assets() 
		{
			
		}
		
	}

}