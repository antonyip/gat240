package  
{
	/**
	 * ...
	 * @author Anton
	 */
	public class SkillClass 
	{
		public var name:String = "UndefinedSkill";
		public var power:int = 10; // pokemon values 0 - 120 // have to balance
		public var speed:int = 10; // higher is faster
		public var type:String = "Undefined" // use Wind, Ice, Fire
		public var isPhysical:Boolean = false;
		public var isMagical:Boolean = false;
		public var hasTarget:Boolean = false;
		public var isAoe:Boolean = false;
		public var hasCrit:Boolean = false;
		public var hasDot:Boolean = false;
		public var hasFreeze:Boolean = false;
		public var variance:Number = 0; // percentage based 0 is no variance , 100 is +- 100%
		
		public function SkillClass() 
		{
			
		}
		
		public function Blizzard():void
		{
			name = "Blizzard";
			power = 70;
			type = "Ice";
			speed = 20; 
			hasTarget = false;
			isAoe = true;
			isMagical = true;
		}
	}

}