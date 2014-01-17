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
		public var speedOfSkill:int;
		
		public function SkillStorage(skillName:String)
		{
			thisSkill.changeSkillTo(skillName);
			speedOfSkill = thisSkill.speed;
		}
		
	}

}