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
		
		public var playerAttackPower:int = 10;
		public var playerSpecialAttack:int = 10;
		public var playerPhysicalDefense:int = 10;
		public var playerSpecialDefense:int = 10;
		public var baseSpeed:int = 10;
		
		public var playerSkill1:SkillClass = new SkillClass();
		public var playerSkill2:SkillClass = new SkillClass();
		public var playerSkill3:SkillClass = new SkillClass();
		public var playerSkill4:SkillClass = new SkillClass();
		
		public var smallFace:Class = Assets.archerSpriteMale;
		public var bigCharacter:Class = Assets.archerSpriteMale;
		public var sideViewCharater:Class = Assets.archerSpriteMale;
		public var deadCharacter:Class = Assets.archerSpriteMale;
		
		public static var listOfCharacters:Array = new Array("Calissa", "Anton", "Kevin", "Cheng Lip", "Issac", "Jonathan","Chin Kiong", "Chin Kai", "Melvin");

		// do not touch variables undert this : Anton
		public var isDisabled:Boolean = false;
	
		public function CharacterClass() 
		{
			
		}
		
		public function addSpecialPoints():void
		{
			if (playerSpecialPoints < 0)
			{
				isDisabled = false;
				playerSpecialPoints = playerMaxSpecialPoints / 2;
			}
			
			playerSpecialPoints += 15;
			
			if (playerSpecialPoints > playerMaxSpecialPoints)
				playerSpecialPoints = playerMaxSpecialPoints;
		}
		
		public function checkDead():Boolean
		{
			if (playerHP < 0)
				isDisabled = true;
				
			if (playerSpecialPoints < 0 )
			{
				isDisabled = true;
			}
			
			return isDisabled;
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
			playerPhysicalDefense = 20;
			playerSpecialDefense = 40;
			baseSpeed = 20;
			
			smallFace = Assets.mageHeadFemale;
			bigCharacter = Assets.mageSpriteFemale;
			sideViewCharater = Assets.mageSide;
			
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
			playerPhysicalDefense = 20;
			playerSpecialDefense = 40;
			baseSpeed = 50;
			playerSkill1.Swipe();
			
			smallFace = Assets.warriorHead;
			bigCharacter = Assets.warriorSpriteMale;
			sideViewCharater = Assets.warriorSide;
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
			playerPhysicalDefense = 20;
			playerSpecialDefense = 40;
			baseSpeed = 80;
			playerSkill1.FireArrow();
			
			smallFace = Assets.archerHead;
			bigCharacter = Assets.archerSpriteMale;
			sideViewCharater = Assets.archerSide;
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
			playerPhysicalDefense = 35;
			playerSpecialDefense = 25;
			baseSpeed = 50;
			playerSkill1.Swipe();
			
			smallFace = Assets.warriorHead;
			bigCharacter = Assets.warriorSpriteMale;
			sideViewCharater = Assets.warriorSide;
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
			playerPhysicalDefense = 15;
			playerSpecialDefense = 25;
			baseSpeed = 20;
			playerSkill1.MagicMissile();
			
			smallFace = Assets.mageHeadMale;
			bigCharacter = Assets.mageSpriteMale;
			sideViewCharater = Assets.mageSide;
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
			playerPhysicalDefense = 20;
			playerSpecialDefense = 10;
			baseSpeed = 80;
			playerSkill1.FireArrow();
			
			smallFace = Assets.archerHead;
			bigCharacter = Assets.archerSpriteMale;
			sideViewCharater = Assets.archerSide;
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
			playerPhysicalDefense = 10;
			playerSpecialDefense = 20;
			baseSpeed = 50;
			playerSkill1.Swipe();
			
			smallFace = Assets.warriorHead;
			bigCharacter = Assets.warriorSpriteMale;
			sideViewCharater = Assets.warriorSide;
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
			playerPhysicalDefense = 10;
			playerSpecialDefense = 10;
			baseSpeed = 80;
			playerSkill1.FireArrow();
			
			smallFace = Assets.archerHead;
			bigCharacter = Assets.archerSpriteMale;
			sideViewCharater = Assets.archerSide;			
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
			playerPhysicalDefense = 5;
			playerSpecialDefense = 40;
			baseSpeed = 80;
			playerSkill1.FireArrow();
			
			smallFace = Assets.archerHead;
			bigCharacter = Assets.archerSpriteMale;
			sideViewCharater = Assets.archerSide;			
		}
	}

}