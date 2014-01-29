package  
{
	import com.greensock.events.LoaderEvent;
	/**
	 * ...
	 * @author Anton
	 */
	public class Assets 
	{
		[Embed(source="../img/testArt/Ametrine Crystal01.png")]
		public static var testImage1:Class;
		
		[Embed(source = "../img/testArt/Aquamarine Gem01.png")]
		public static var testImage2:Class;
		
		[Embed(source = "../img/testArt/Emerald Gem01.png")]
		public static var testImage3:Class;
		
		[Embed(source = "../img/testArt/Morganite Crystal01.png")]
		public static var arrowSprite:Class;
		
		[Embed(source = "../img/Archer_Front.png")]
		public static var archerSpriteMale:Class;
		
		[Embed(source = "../img/Character-Design-Outline.png")]
		public static var playerSelectBackground:Class;
		
		[Embed(source = "../img/Mage_Female_Front.png")]
		public static var mageSpriteFemale:Class;
		
		[Embed(source = "../img/Mage_Male_Front.png")]
		public static var mageSpriteMale:Class;
		
		[Embed(source = "../img/Warrior.png")]
		public static var warriorSpriteMale:Class;
		
		[Embed(source = "../art/Characters/Archer_Side.png")]
		public static var archerSide:Class;
		
		[Embed(source = "../art/Characters/Mage_Side.png")]
		public static var mageSide:Class;
		
		[Embed(source="../art/Characters/Warrior_Side.png")]
		public static var warriorSide:Class;
		
		[Embed(source = "../art/Play_Screen/Play_Screen.png")]
		public static var gameLevelBackground:Class;
		
		public function Assets() 
		{
			
		}
		
	}

}