package  
{
	/**
	 * ...
	 * @author Anton
	 */
	public class CharacterClass 
	{
		public var name:String = "undefined";
		public var element:String = "undefined" // Wind, Ice, Fire
		public var job:String = "undefined" // Warrior, Mage, Archer
		public var playerHP:int = 100;
		public var playerMAXHP:int = 100;
		public var playerSpecialPoints:int = 100;
		public var playerMaxSpecialPoints:int = 100;
		public var baseSpeed:int = 100;
		
		public var playerAttackPower:int = 100;
		public var playerSpecialAttack:int = 100;
		public var playerPhysicalDefense:int = 100;
		public var playerSpecialDefense:int = 100;
		
		public var playerSkill1:SkillClass = new SkillClass();
		public var playerSkill2:SkillClass = new SkillClass();
		public var playerSkill3:SkillClass = new SkillClass();
		public var playerSkill4:SkillClass = new SkillClass();
		
		public var smallFace:Class = Assets.archerSpriteMale;
		public var bigCharacter:Class = Assets.archerSpriteMale;
		public var sideViewCharater:Class = Assets.archerSpriteMale;
		
		public static var listOfCharacters:Array = new Array("Calissa", "Anton", "Kevin", "Cheng Lip", "Issac", "Jonathan","Chin Kiong", "Chin Kai", "Melvin");
		
		public function CharacterClass() 
		{
			
		}
		
		public function changeCharTo(charName:String):void
		{
			if (charName == "Calissa")
				Calissa();
			else if (charName == "Anton")
				Anton();
			else if (charName == "Kevin")
				Kevin();
			else if (charName == "Cheng Lip")
				ChengLip();
			else if (charName == "Issac")
				Issac();
			else if (charName == "Jonathan")
				Jonathan();
			else if (charName == "Chin Kiong")
				ChinKiong();
			else if (charName == "Chin Kai")
				ChinKai();
			else if (charName == "Melvin")
				Melvin();
			else
				trace("Something Went Wrong - CharacterClass(changeCharTo)", charName);
		}
		
		public function Calissa():void
		{
			name = "Calissa";
			element = "Ice" // Wind, Ice, Fire
			job = "Mage" // Warrior, Mage, Archer
			playerHP = 80;
			playerMAXHP = 80;
			playerSpecialPoints = 100;
			playerMaxSpecialPoints = 100;
			
			playerAttackPower = 20;
			playerSpecialAttack = 40;
			playerPhysicalDefense = 70;
			playerSpecialDefense = 100;
			
			
			smallFace = Assets.mageSpriteFemale;
			bigCharacter = Assets.mageSpriteFemale;
			sideViewCharater = Assets.mageSpriteFemale;
			
			playerSkill1.MagicMissile();
		}
		
		public function Anton():void
		{
			name = "Anton";
			element = "Wind" // Wind, Ice, Fire
			job = "Warrior" // Warrior, Mage, Archer
			playerHP = 80;
			playerMAXHP = 80;
			playerSpecialPoints = 100;
			playerMaxSpecialPoints = 100;
			
			playerAttackPower = 20;
			playerSpecialAttack = 40;
			playerPhysicalDefense = 70;
			playerSpecialDefense = 100;
			
			playerSkill1.Swipe();
		}
		
		public function Kevin():void
		{
			name = "Kevin";
			element = "Fire" // Wind, Ice, Fire
			job = "Archer" // Warrior, Mage, Archer
			playerHP = 80;
			playerMAXHP = 80;
			playerSpecialPoints = 100;
			playerMaxSpecialPoints = 100;
			
			playerAttackPower = 20;
			playerSpecialAttack = 40;
			playerPhysicalDefense = 70;
			playerSpecialDefense = 100;
			
			playerSkill1.FireArrow();
		}
		
		public function ChengLip():void
		{
			name = "Cheng Lip";
			element = "Fire" // Wind, Ice, Fire
			job = "Warrior" // Warrior, Mage, Archer
			playerHP = 160;
			playerMAXHP = 160;
			playerSpecialPoints = 100;
			playerMaxSpecialPoints = 100;
			
			playerAttackPower = 70;
			playerSpecialAttack = 30;
			playerPhysicalDefense = 70;
			playerSpecialDefense = 50;
			
			playerSkill1.Swipe();
		}
		
		public function Issac():void
		{
			name = "Issac";
			element = "Fire" // Wind, Ice, Fire
			job = "Mage" // Warrior, Mage, Archer
			playerHP = 70;
			playerMAXHP = 70;
			playerSpecialPoints = 100;
			playerMaxSpecialPoints = 100;
			
			playerAttackPower = 30;
			playerSpecialAttack = 60;
			playerPhysicalDefense = 30;
			playerSpecialDefense = 70;
			
			playerSkill1.MagicMissile();
		}
		
		public function Jonathan():void
		{
			name = "Jonathan";
			element = "Fire" // Wind, Ice, Fire
			job = "Archer" // Warrior, Mage, Archer
			playerHP = 70;
			playerMAXHP = 70;
			playerSpecialPoints = 100;
			playerMaxSpecialPoints = 100;
			
			playerAttackPower = 30;
			playerSpecialAttack = 60;
			playerPhysicalDefense = 30;
			playerSpecialDefense = 70;
			
			playerSkill1.FireArrow();
		}
		
		public function ChinKiong():void
		{
			name = "Chin Kiong";
			element = "Ice" // Wind, Ice, Fire
			job = "Warrior" // Warrior, Mage, Archer
			playerHP = 130;
			playerMAXHP = 130;
			playerSpecialPoints = 100;
			playerMaxSpecialPoints = 100;
			
			playerAttackPower = 65;
			playerSpecialAttack = 30;
			playerPhysicalDefense = 70;
			playerSpecialDefense = 70;
			
			playerSkill1.Swipe();
		}
		
		public function ChinKai():void
		{
			name = "Chin Kai";
			element = "Ice" // Wind, Ice, Fire
			job = "Ranger" // Warrior, Mage, Archer
			playerHP = 100;
			playerMAXHP = 100;
			playerSpecialPoints = 100;
			playerMaxSpecialPoints = 100;
			
			playerAttackPower = 40;
			playerSpecialAttack = 40;
			playerPhysicalDefense = 70;
			playerSpecialDefense = 70;
			
			playerSkill1.FireArrow();
		}
		
		public function Melvin():void
		{
			name = "Melvin";
			element = "Wind " // Wind, Ice, Fire
			job = "Ranger" // Warrior, Mage, Archer
			playerHP = 100;
			playerMAXHP = 100;
			playerSpecialPoints = 100;
			playerMaxSpecialPoints = 100;
			
			playerAttackPower = 40;
			playerSpecialAttack = 40;
			playerPhysicalDefense = 70;
			playerSpecialDefense = 70;
			
			playerSkill1.FireArrow();
		}
	}

}