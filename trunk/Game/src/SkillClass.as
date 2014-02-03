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
		
		public static var listOfSkills:Array = new Array( //"Swipe", "Magic Missile", "Fire Arrow" ,
														 "Blizzard",
														 "Star Frost", "Crystallic Shield", "Frost Dispel",
														 "Torrent Slash", "Piercing Flames", "Hell Fire", "Lava Claws",
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
			if (skillName == "Arrow Shot")
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
			if (skillName == "Hell Fire")
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
			isMagical = false;
			isAoe = false
			hasTarget = true;
			variance = 0.2;
			description = "Warrior's Basic Attack";
			skillIcon = Assets.warriorHead;
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
			
			skillIcon = Assets.mageHeadMale;
		}
		
		public function aFireArrow():void  // Archer' Basic Attack
		{
			name = "Arrow Shot";
			power = 15;
			speed = 30;
			type = "Nil"
			accuracy = 1;
			cost = 5;
			isPhysical = true;
			hasTarget = true;
			variance = 0.2;
			
			skillIcon = Assets.warriorHead;
		}		
		
		public function aBlizzard():void
		{
			name = "Blizzard";
			power = 100;
			speed = 35;
			type = "Ice"
			accuracy = .95;
			cost = 60;
			isPhysical = false;
			isMagical = true;
			isAoe = true;
			hasTarget = false;
			variance = 0.1;
			description = "Does significant amount of damage to enemy party, has 5% chance of freezing all of them.";
			skillIcon = Assets.skillIconBlizzard;
		}
		
		public function aStarFrost():void
		{
			name = "Star Frost";
			power = 75;
			speed = 70;
			type = "Ice"
			accuracy = 1;
			cost = 30;
			isPhysical = false;
			isMagical = true;
			isAoe = false;
			hasTarget = true;
			variance = 0.1;
			description = "Seriously just whacks a guy in the face with a star. A big one.";
			skillIcon = Assets.skillIconStarFrost;
		}
		public function aCrystallicShield():void
		{
			name = "Crystallic Shield";
			power = 0;
			speed = 50;
			type = "Buff"
			accuracy = 1;
			cost = 30;
			isPhysical = false;
			isMagical = false;
			isAoe = false;
			hasTarget = true;
			variance = 0.1;
			description = "Creates a reinforced shield that protects the user from harsh attacks. Damage -10% to -15%.";
			
			skillIcon  = Assets.skillIconCrystallicShield;
		}
		public function aFrostDispel():void
		{
			name = "Frost Dispel";
			power = 0;
			speed = 30;
			type = "Buff"
			accuracy = 1;
			cost = 60;
			isPhysical = false;
			isMagical = false;
			isAoe = true;
			hasTarget = false;
			variance = 0.1;
			description = "Removes all buffs/debuffs the enemy party has.";
			
			skillIcon  = Assets.skillIconFrostDispel;
		}
		public function aTorrentSlash():void
		{
			name = "Torrent Slash";
			power = 75;
			speed = 65;
			type = "Ice"
			accuracy = .9;
			cost = 40;
			isPhysical = true;
			isMagical = false;
			isAoe = false;
			hasTarget = true;
			variance = 0.1;
			description = "Slash an enemy with freezing cold water. Nomnomnomnom.";
			
			skillIcon  = Assets.skillIconTorrentSlash;
		}
		public function aPiercingFlames():void
		{
			name = "Piercing Flames";
			power = 70;
			speed = 80;
			type = "Fire"
			accuracy = .9;
			cost = 30;
			isPhysical = true;
			isMagical = false;
			isAoe = true;
			hasTarget = false;
			variance = 0.1;
			description = "Flaming arrows rain down on the enemies. 10% chance to burn the enemy.";
			
			skillIcon  = Assets.skillIconPiercingFlames;
		}
		public function aHellFire():void
		{
			name = "Hell Fire";
			power = 90;
			speed = 40;
			type = "Fire"
			accuracy = 1;
			cost = 60;
			isPhysical = false;
			isMagical = true;
			isAoe = false;
			hasTarget = true;
			variance = 0.1;
			description = "Cali got lazy to write something here.";
			skillIcon  = Assets.skillIconHellFire;
		}
		public function aLavaClaws():void
		{
			name = "Lava Claws";
			power = 85;
			speed = 60;
			type = "Fire"
			accuracy = .95;
			cost = 60;
			isPhysical = true;
			isMagical = false;
			isAoe = false;
			hasTarget = true;
			variance = 0.1;
			description = "Cali got lazy to write something here.";	
			skillIcon  = Assets.skillIconLavaStrike;
		}
		public function aRoaringFlare():void
		{
			name = "Roaring Flare";
			power = 0;
			speed = 50;
			type = "Buff"
			accuracy = 1;
			cost = 40;
			isPhysical = false;
			isMagical = false;
			isAoe = true;
			hasTarget = false;
			variance = 0.1;
			description = "Slightly lowers the attack of the opposing team by 5%.";
			skillIcon  = Assets.skillIconRoaringFlare;
		}
		public function aFireball():void
		{
			name = "Fireball";
			power = 70;
			speed = 75;
			type = "Fire"
			accuracy = .95;
			cost = 30;
			isPhysical = false;
			isMagical = true;
			isAoe = false;
			hasTarget = true;
			variance = 0.1;
			description = "(Seemingly Epic) Fireball";	
			skillIcon  = Assets.skillIconFireBall;
		}
		public function aWhirlwindGale():void
		{
			name = "Whirlwind Gale";
			power = 80;
			speed = 90;
			type = "Wind"
			accuracy = .95;
			cost = 40;
			isPhysical = true;
			isMagical = false;
			isAoe = false;
			hasTarget = true;
			variance = 0.1;
			description = "Why did i pick this name, art was so hard to draw.";	
			skillIcon  = Assets.skillIconWhirlwindGale;
		}
		public function aFeatherDance():void
		{
			name = "Feather Dance";
			power = 0;
			speed = 50;
			type = "Buff"
			accuracy = 1;
			cost = 30;
			isPhysical = false;
			isMagical = false;
			isAoe = true;
			hasTarget = false;
			variance = 0.1;
			description = "Removes all status effects and gently heals everyone.";	
			skillIcon  = Assets.skillIconFeatherDance;
		}
		public function aShootingStar():void
		{			
			name = "Shooting Star";
			power = 85;
			speed = 65;
			type = "Wind"
			accuracy = .95;
			cost = 60;
			isPhysical = false;
			isMagical = true;
			isAoe = true;
			hasTarget = false;
			variance = 0.1;
			description = "I love stars.";	
			skillIcon  = Assets.skillIconShootingStar;
		}
		public function aHealingWinds():void
		{
			name = "Healing Winds";
			power = 0;
			speed = 60;
			type = "Buff"
			accuracy = 1;
			cost = 30;
			isPhysical = false;
			isMagical = false;
			isAoe = false;
			hasTarget = true;
			variance = 0.1;
			description = "I love stars.";
			skillIcon  = Assets.skillIconHealingWinds;
		}
		public function aSacredWish():void
		{
			name = "Sacred Wish";
			power = 0;
			speed = 70;
			type = "Buff"
			accuracy = 1;
			cost = 60;
			isPhysical = false;
			isMagical = false;
			isAoe = false;
			hasTarget = true;
			variance = 0.1;
			description = "Raises the Attack Power and Attack Speed of the user by 5%";
			skillIcon  = Assets.skillIconSacredWish;
		}
	}

}