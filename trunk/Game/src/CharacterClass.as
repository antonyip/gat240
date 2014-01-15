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
		
		public var playerAttackPower:int = 100;
		public var playerSpecialAttack:int = 100;
		public var playerPhysicalDefense:int = 100;
		public var playerSpecialDefense:int = 100;
		
		public var playerSkill1:SkillClass = new SkillClass();
		public var playerSkill2:SkillClass = new SkillClass();
		public var playerSkill3:SkillClass = new SkillClass();
		public var playerSkill4:SkillClass = new SkillClass();
		
		public static var listOfCharacters:Array = new Array("Calissa", "Anton", "Kevin","Calissa 2", "Anton 2", "Kevin 2","Calissa 3", "Anton 3", "Kevin 3");
		
		public function CharacterClass() 
		{
			
		}
		
		public function changeCharTo(charName:String):void
		{
			if (charName == "Calissa")
				Calissa();
			else if (charName == "Anton")
				Anton();
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
			playerSpecialPoints = 150;
			playerMaxSpecialPoints = 150;
			
			playerAttackPower = 20;
			playerSpecialAttack = 40;
			playerPhysicalDefense = 70;
			playerSpecialDefense = 100;
		}
		
		public function Anton():void
		{
			name = "Anton";
			element = "Wind" // Wind, Ice, Fire
			job = "Warrior" // Warrior, Mage, Archer
			playerHP = 80;
			playerMAXHP = 80;
			playerSpecialPoints = 150;
			playerMaxSpecialPoints = 150;
			
			playerAttackPower = 20;
			playerSpecialAttack = 40;
			playerPhysicalDefense = 70;
			playerSpecialDefense = 100;
		}
		
		public function Kevin():void
		{
			name = "Kevin";
			element = "Fire" // Wind, Ice, Fire
			job = "Archer" // Warrior, Mage, Archer
			playerHP = 80;
			playerMAXHP = 80;
			playerSpecialPoints = 150;
			playerMaxSpecialPoints = 150;
			
			playerAttackPower = 20;
			playerSpecialAttack = 40;
			playerPhysicalDefense = 70;
			playerSpecialDefense = 100;
		}
	}

}