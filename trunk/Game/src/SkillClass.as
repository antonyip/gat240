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
		public var speed:int = 10; // higher is faster; use 0 - 100
		public var type:String = "Undefined" // use Wind, Ice, Fire, Nil
		public var accuracy:Number = 1; // percentage based - 1 is sure hit
		public var cost:int = 15;
		public var isPhysical:Boolean = false;
		public var isMagical:Boolean = false;
		public var hasTarget:Boolean = false;
		public var isAoe:Boolean = false;
		public var hasCrit:Boolean = false;
		public var hasDot:Boolean = false;
		public var hasFreeze:Boolean = false;
		public var variance:Number = 0; // percentage based 0 is no variance , 1 is +- 100%
		
		public static var listOfSkills:Array = new Array("Swipe", "Magic Missile", "Fire Arrow", "Blizzard",
														 "Star Frost", "Crystallic Shield", "Frost Dispel",
														 "Torrent Slash", "Piercing Flames", "Hellfire", "Lava Claws",
														 "Roaring Flare", "Fireball", "Whirlwind Gale", "Feather Dance",
														 "Shooting Star", "Healing Winds", "Sacred Wish");
		
		public function SkillClass() 
		{
			
		}
		
		public function changeSkillTo(skillName:String):void
		{
			if (skillName == "Swipe")
				Swipe();
			if (skillName == "Magic Missile")
				MagicMissile();
			if (skillName == "Blizzard")
				Blizzard();
			if (skillName == "Fire Arrow")
				FireArrow();				
			if (skillName == "Star Frost")
				StarFrost();
			if (skillName == "Crystallic Shield")
				CrystallicShield();
			if (skillName == "Frost Dispel")
				FrostDispel();
			if (skillName == "Torrent Slash")
				TorrentSlash();
			if (skillName == "Piercing Flames")
				PiercingFlames();
			if (skillName == "Hellfire")
				HellFire();
			if (skillName == "LavaClaws")
				LavaClaws();
			if (skillName == "Roaring Flare")
				RoaringFlare();
			if (skillName == "Fireball")
				Fireball();
			if (skillName == "Whirlwind Gale")
				WhirlwindGale();
			if (skillName == "Feather Dance")
				FeatherDance();
			if (skillName == "Shooting Star")
				ShootingStar();
			if (skillName == "Healing Winds")
				HealingWinds();
			if (skillName == "Sacred Wish")
				SacredWish();
			trace("SkillName: ", skillName);
		}
		
		public function Swipe():void  // Warriors' Basic Attack
		{
			name = "Swipe";
			power = 15;
			speed = 40;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isPhysical = true;
			hasTarget = true;
			variance = 0.2;
		}
		
		public function MagicMissile():void  // Mage' Basic Attack
		{
			name = "Magic Missile";
			power = 15;
			speed = 50;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isMagical = true;
			hasTarget = true;
			variance = 0.2;
		}
		
		public function FireArrow():void  // Archer' Basic Attack
		{
			name = "Fire Arrow";
			power = 15;
			speed = 30;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isMagical = true;
			hasTarget = true;
			variance = 0.2;
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