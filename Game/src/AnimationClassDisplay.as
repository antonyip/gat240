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
		public static var CHARCTER_DIES:String = "characterDies";
		public static var AOE_SKILL:String = "AoeSkill";
		public static var ANIMATION:String = "Animation";
		public static var CASTER_DAMAGE:String = "CasterDamage";
		public static var NO_DAMAGE:String = "NoDamage";
		public static var FEATHER_DANCE:String = "FeatherDance";
		public static var CRYSTAL_SHIELD:String = "Shield";
		public static var HEALING_WINDS:String = "Heals";
		public static var SACRED_WISH:String = "SacredWish";
		
		
		public function AnimationClassDisplay(type_:String, caster_:String, target_:String, others:String = null, animation_:String = null, skillName_:String = null)
		{
			type = type_;
			caster = caster_;
			target = target_;
			skillName = skillName_
			animation = animation_;
			
			if (type == CASTER_ON_TARGET_WITH_SKILL)
			{
				if (target != "none")
					topText = Globals.getCharacterFromString(caster).name + " used " + skillName_ + " on " + Globals.getCharacterFromString(target).name + ".";
				else
					topText = Globals.getCharacterFromString(caster).name + " used " + skillName_ +".";
			}
			if (type == ANIMATION)
				topText = "AntonCode";
			if (type == CASTER_DAMAGE)
				topText = Globals.getCharacterFromString(caster).name + " dealt " + others + " damage to "  + Globals.getCharacterFromString(target).name + ".";
			if (type == NO_DAMAGE)
				topText = "No Damage was felt.";
			if (type == CHARCTER_DIES)
				topText = Globals.getCharacterFromString(target_).name + " fainted.";
			if (type == FEATHER_DANCE)
				topText = "Your team's attack power increased by 50%.";
			if (type == CRYSTAL_SHIELD)
				topText = Globals.getCharacterFromString(target_).name + " defence increased by 50%!";
			if (type == HEALING_WINDS)
				topText = Globals.getCharacterFromString(target_).name + " recovered health by " + others + ".";
			if (type == SACRED_WISH)
				topText = Globals.getCharacterFromString(target_).name + " increased speed by 50%!";
			}
		
	}

}