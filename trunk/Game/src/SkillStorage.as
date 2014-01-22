package  
{
	/**
	 * ...
	 * @author ...
	 */
	public class SkillStorage 
	{
		public var thisSkill:SkillClass = new SkillClass();
		public var caster:String = "none"; // p1, p2, p3, e1, e2, e3
		public var target:String = "none"; // all, friends, enemies, p1, p2, p3, e1, e2, e3
		public var damage:int = 0;
		public var speedOfSkill:int;
		public var destroyed:Boolean = false;
		public var casterSpeed:int = 0;
		
		public function SkillStorage(skillName:String)
		{
			thisSkill.changeSkillTo(skillName);
			
		}
		
		public function updateSpeeds():void
		{
			if (caster == "p1")
				casterSpeed = Globals.p1.baseSpeed;
			if (caster == "p2")
				casterSpeed = Globals.p2.baseSpeed;
			if (caster == "p3")
				casterSpeed = Globals.p3.baseSpeed;
			if (caster == "e1")
				casterSpeed = Globals.e1.baseSpeed;
			if (caster == "e2")
				casterSpeed = Globals.e2.baseSpeed;
			if (caster == "e3")
				casterSpeed = Globals.e3.baseSpeed;
			speedOfSkill = thisSkill.speed + casterSpeed;
		}
		
		public function callTextDisplay():void
		{
			trace (caster, "used", thisSkill.name, "on", target, "and dealt", damage, "damage");
		}
		

		
	}

}