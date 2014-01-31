package  
{
	import flash.display.MovieClip;
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
		public var description:String = "unwritten!";
		
		public var skillIcon:Class = Assets.testImage1;
		public var skillEffect:MovieClip;
		
		public static var listOfSkills:Array = new Array("Swipe", "Magic Missile","Fire Arrow" ,"Blizzard",
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
				aSwipe();
			if (skillName == "Magic Missile")
				aMagicMissile();
			if (skillName == "Blizzard")
				aBlizzard();
			if (skillName == "Fire Arrow")
				aFireArrow();				
			if (skillName == "Star Frost")
				aStarFrost();
			if (skillName == "Crystallic Shield")
				aCrystallicShield();
			if (skillName == "Frost Dispel")
				aFrostDispel();
			if (skillName == "Torrent Slash")
				aTorrentSlash();
			if (skillName == "Piercing Flames")
				aPiercingFlames();
			if (skillName == "Hellfire")
				aHellFire();
			if (skillName == "Lava Claws")
				aLavaClaws();
			if (skillName == "Roaring Flare")
				aRoaringFlare();
			if (skillName == "Fireball")
				aFireball();
			if (skillName == "Whirlwind Gale")
				aWhirlwindGale();
			if (skillName == "Feather Dance")
				aFeatherDance();
			if (skillName == "Shooting Star")
				aShootingStar();
			if (skillName == "Healing Winds")
				aHealingWinds();
			if (skillName == "Sacred Wish")
				aSacredWish();
			//trace("SkillName: ", skillName);
		}
		
		public function aSwipe():void  // Warriors' Basic Attack
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
		
		public function aMagicMissile():void  // Mage' Basic Attack
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
		
		public function aFireArrow():void  // Archer' Basic Attack
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
		
		public function aBlizzard():void
		{
			name = "Blizzard";
			power = 70;
			type = "Ice";
			speed = 20; 
			hasTarget = false;
			isAoe = true;
			isMagical = true;
			
			skillIcon  = Assets.skillIconBlizzard;
		}
		
		public function aStarFrost():void
		{
			name = "Star Frost";
			power = 15;
			speed = 40;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isPhysical = true;
			hasTarget = true;
			variance = 0.2;
			
			skillIcon  = Assets.skillIconBlizzard;
		}
		public function aCrystallicShield():void
		{
			name = "Crystallic Shield";
			power = 15;
			speed = 40;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isPhysical = true;
			hasTarget = true;
			variance = 0.2;
			
			skillIcon  = Assets.skillIconCrystallicShield;
		}
		public function aFrostDispel():void
		{
			name = "Frost Dispel";
			power = 15;
			speed = 40;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isPhysical = true;
			hasTarget = true;
			variance = 0.2;
			
			skillIcon  = Assets.skillIconFrostDispel;
		}
		public function aTorrentSlash():void
		{
			name = "Torrent Slash";
			power = 15;
			speed = 40;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isPhysical = true;
			hasTarget = true;
			variance = 0.2;
			
			skillIcon  = Assets.skillIconTorrentSlash;
		}
		public function aPiercingFlames():void
		{
			name = "Piercing Flames";
			power = 15;
			speed = 40;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isPhysical = true;
			hasTarget = true;
			variance = 0.2;
			
			skillIcon  = Assets.skillIconPiercingFlames;
		}
		public function aHellFire():void
		{
			name = "Hell Fire";
			power = 15;
			speed = 40;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isPhysical = true;
			hasTarget = true;
			variance = 0.2;
			
			skillIcon  = Assets.skillIconHellFire;
		}
		public function aLavaClaws():void
		{
			name = "Lava Claws";
			power = 15;
			speed = 40;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isPhysical = true;
			hasTarget = true;
			variance = 0.2;
			skillIcon  = Assets.skillIconLavaStrike;
		}
		public function aRoaringFlare():void
		{
			name = "Roaring Flare";
			power = 15;
			speed = 40;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isPhysical = true;
			hasTarget = true;
			variance = 0.2;
			skillIcon  = Assets.skillIconRoaringFlare;
		}
		public function aFireball():void
		{
			name = "Fire ball";
			power = 15;
			speed = 40;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isPhysical = true;
			hasTarget = true;
			variance = 0.2;
			skillIcon  = Assets.skillIconFireBall;
		}
		public function aWhirlwindGale():void
		{
			name = "Whirlwind Gale";
			power = 15;
			speed = 40;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isPhysical = true;
			hasTarget = true;
			variance = 0.2;
			skillIcon  = Assets.skillIconWhirlwindGale;
		}
		public function aFeatherDance():void
		{
			name = "Feather Dance";
			power = 15;
			speed = 40;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isPhysical = true;
			hasTarget = true;
			variance = 0.2;
			skillIcon  = Assets.skillIconFeatherDance;
		}
		public function aShootingStar():void
		{			
			name = "Shooting Star";
			power = 15;
			speed = 40;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isPhysical = true;
			hasTarget = true;
			variance = 0.2;
			skillIcon  = Assets.skillIconShootingStar;
		}
		public function aHealingWinds():void
		{
			name = "Healing Winds";
			power = 15;
			speed = 40;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isPhysical = true;
			hasTarget = true;
			variance = 0.2;
			skillIcon  = Assets.skillIconHealingWinds;
		}
		public function aSacredWish():void
		{
			name = "Sacred Wish";
			power = 15;
			speed = 40;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isPhysical = true;
			hasTarget = true;
			variance = 0.2;
			skillIcon  = Assets.skillIconSacredWish;
		}
	}

}