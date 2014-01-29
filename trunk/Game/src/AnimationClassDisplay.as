package  
{
	/**
	 * ...
	 * @author Anton
	 */
	public class AnimationClassDisplay 
	{
		public var type:String; // INFO, SKILL
		public var caster:String;
		public var target:String;
		public var topText:String = "undefined";
		public var skillName:String;
		public var animation:String;
		
		public static var CASTER_ON_TARGET_WITH_SKILL:String = "CasterOnTargetWithSkill";
		public static var ANIMATION:String = "Animation";
		public static var CASTER_DAMAGE:String = "CasterDamage";
		public static var NO_DAMAGE:String = "NoDamage";
		
		
		public function AnimationClassDisplay(type_:String, caster_:String, target_:String, others:String = null, animation_:String = null, skillName_:String = null)
		{
			type = type_;
			caster = caster_;
			target = target_;
			skillName = skillName_
			animation = animation_;
			
			if (type == CASTER_ON_TARGET_WITH_SKILL)
				topText = caster + " used " + skillName_ + " on " + target + ".";
			if (type == ANIMATION)
				topText = "Handle Skill being casted";
			if (type == CASTER_DAMAGE)
				topText = caster + " dealt " + others + " damage.";
			if (type == NO_DAMAGE)
				topText = "No Damage was felt.";
		}
		
	}

}