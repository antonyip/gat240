package  
{
	/**
	 * ...
	 * @author Anton
	 */
	public class Globals 
	{
		public static var p1:CharacterClass = new CharacterClass();
		public static var p2:CharacterClass = new CharacterClass();
		public static var p3:CharacterClass = new CharacterClass();
		public static var e1:CharacterClass = new CharacterClass();
		public static var e2:CharacterClass = new CharacterClass();
		public static var e3:CharacterClass = new CharacterClass();
		
		public function Globals() 
		{
			
		}
		
		public static function randomInt(minValue:int, maxValue:int):int
		{
			return Math.floor(minValue + Math.random() * (maxValue-minValue));
		}
		
		public static function GlobalsInit():void
		{
			e1.Calissa();
			e2.Anton();
			e3.Kevin();
			e1.playerSkill1.aSwipe();
			e1.playerSkill2.aSwipe();
			e1.playerSkill3.aSwipe();
			e1.playerSkill4.aSwipe();
			e2.playerSkill1.aSwipe();
			e2.playerSkill2.aSwipe();
			e2.playerSkill3.aSwipe();
			e2.playerSkill4.aSwipe();
			e3.playerSkill1.aSwipe();
			e3.playerSkill2.aSwipe();
			e3.playerSkill3.aSwipe();
			e3.playerSkill4.aSwipe();
		}
		
		public static function getCharacterFromString(characterName:String):CharacterClass
		{
			if (characterName == "p1")
				return p1;
			if (characterName == "p2")
				return p2;
			if (characterName == "p3")
				return p3;
			if (characterName == "e1")
				return e1;
			if (characterName == "e2")
				return e2;
			if (characterName == "e3")
				return e3;
			return e1;
		}
		
		public static function getSkillFromString(skillName:String):SkillClass
		{
			var tempSkill:SkillClass = new SkillClass();
			tempSkill.changeSkillTo(skillName);
			return tempSkill;
		}
		
		public static function checkElementalDifference(attackerName:String, defenderName:String):Number
		{
			return 1;
		}
		
		public static function checkClassResistance(attackerName:String, defenderName:String):Number
		{
			return 1;
		}
		
	}

}