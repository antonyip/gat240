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
			e1.name = "Slime 1";
			e2.name = "Slime 2";
			e3.name = "Slime 3";
			e1.playerSkill1.Swipe();
			e1.playerSkill2.Swipe();
			e1.playerSkill3.Swipe();
			e1.playerSkill4.Swipe();
			e2.playerSkill1.Swipe();
			e2.playerSkill2.Swipe();
			e2.playerSkill3.Swipe();
			e2.playerSkill4.Swipe();
			e3.playerSkill1.Swipe();
			e3.playerSkill2.Swipe();
			e3.playerSkill3.Swipe();
			e3.playerSkill4.Swipe();
		}
	}

}