package  
{
	import flash.display.MovieClip;
	import org.flixel.*;
	import org.flixel.plugin.funstorm.FlxMovieClip;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class GameLevel extends FlxState 
	{
		// Sprites
		private var test:FlxText = new FlxText(400, 300, 300, "Hello World");

		private var guiSprite:FlxSprite = new FlxSprite(0, 500, Assets.testImage3);
		private var background:FlxSprite = new FlxSprite(0, 0, Assets.gameLevelBackground);
		// GUI Sprites
		private var arrowSprite:FlxSprite = new FlxSprite(0, 0, Assets.gameLevelSkillSelectArrows);
		private var guiText1:FlxText = new FlxText(406-60, 220.5-5, 120, "");
		private var guiText2:FlxText = new FlxText(406-60, 259.5-5, 120, "");
		private var guiText3:FlxText = new FlxText(406-60, 298.5-5, 120, "");
		private var guiText4:FlxText = new FlxText(406-60, 337.5-5, 120, "");
		private var guiText5:FlxText = new FlxText(-400, 420, 120, "");
		private var topBarText:FlxText = new FlxText(400.5-100, 25, 200, "I tell you what happens here");
		
		private var topBarImage:FlxSprite = new FlxSprite(141, 0, Assets.gameLevelTopBorder);
		private var skillSelectImage:FlxSprite = new FlxSprite(286, 201, Assets.gameLevelSkillSelect);
		
		// Game Calculations
		private var p1:CharacterClass = Globals.p1; // player 1
		private var p2:CharacterClass = Globals.p2; // player 2
		private var p3:CharacterClass = Globals.p3; // player 3
		private var e1:CharacterClass = Globals.e1; // enemy 1
		private var e2:CharacterClass = Globals.e2; // enemy 2
		private var e3:CharacterClass = Globals.e3; // enemy 3
		
		private var playerSprite1:FlxSprite = new FlxSprite(66, 101, p1.sideViewCharater);
		private var playerSprite2:FlxSprite = new FlxSprite(-14, 191, p2.sideViewCharater);
		private var playerSprite3:FlxSprite = new FlxSprite(46, 295, p3.sideViewCharater);
		private var enemySprite1:FlxSprite  = new FlxSprite(572, 100, e1.sideViewCharater);
		private var enemySprite2:FlxSprite  = new FlxSprite(659, 199, e2.sideViewCharater);
		private var enemySprite3:FlxSprite  = new FlxSprite(598, 294, e3.sideViewCharater);
		
		private var p1nametext:FlxText  = new FlxText(100 - 45 + 5-80, 488 + 20 - 2, 200, p1.name);
		private var p2nametext:FlxText  = new FlxText(344 - 45 + 5-80, 488 + 20 - 2, 200, p2.name);
		private var p3nametext:FlxText  = new FlxText(610 - 45 + 1-80, 488 + 20 - 2, 200, p3.name);
		
		private var playerFaceSprite1:FlxSprite = new FlxSprite(37-41, 510-41, p1.smallFace);
		private var playerFaceSprite2:FlxSprite = new FlxSprite(294-51, 510-41, p2.smallFace);
		private var playerFaceSprite3:FlxSprite = new FlxSprite(546-41, 510-41, p3.smallFace);
		
		// gui text for hp and stam
		private var p1hp:FlxText = new FlxText(105+10+26	, 523+2, 120, "");
		private var p2hp:FlxText = new FlxText(343+10+10+26	, 523+2, 120, "");
		private var p3hp:FlxText = new FlxText(609+10+5+26	, 523+2, 120, "");
		private var e1hp:FlxText = new FlxText(400, 450, 120, "");
		private var e2hp:FlxText = new FlxText(450, 450, 120, "");
		private var e3hp:FlxText = new FlxText(500, 450, 120, "");
		
		private var p1h:FlxSprite = new FlxSprite (105+10	, 523+2, Assets.healthHeart);
		private var p2h:FlxSprite = new FlxSprite (343+10+10, 523+2, Assets.healthHeart);
		private var p3h:FlxSprite = new FlxSprite (609+10+5	, 523+2, Assets.healthHeart);
		private var p1s1:FlxSprite = new FlxSprite(105+10	, 548, Assets.staminaHeart);
		private var p2s1:FlxSprite = new FlxSprite(343+10+10, 548, Assets.staminaHeart);
		private var p3s1:FlxSprite = new FlxSprite(609+10+5	, 548, Assets.staminaHeart);
		
		private var p1s:FlxText = new FlxText(105+10+26		, 548+2, 120, "");
		private var p2s:FlxText = new FlxText(343+10+10+26	, 548+2, 120, "");
		private var p3s:FlxText = new FlxText(609+10+5+26	, 548+2, 120, "");
		private var e1s:FlxText = new FlxText(-400, 480, 120, "");
		private var e2s:FlxText = new FlxText(-450, 480, 120, "");
		private var e3s:FlxText = new FlxText(-500, 480, 120, "");
		
		// OtherStats
		private var damageVariance:Number = 0; 	// 0-1 .. if you put 0.5.. the damage will become 0.5 to 1.5 times.. works like a +- system
		private var damageType:String;			// unused.. following guide
		private var damageTypeMultiple:String;	// unused
		private var stamRegen:int = 15;
		
		private var animationStatus:int = 0;
		
		// storage for skills used as well as structure and target
		private var skillsUsedThisTurn:Array = new Array();
		private var animationThisTurn:Vector.<AnimationClassDisplay> = new Vector.<AnimationClassDisplay>;
		
		// Game Logic
		private var turn:int = 0;
		private var animationDoOnce:Boolean = true;
		// using big numbers just incase we need to insert special effects
		
		private var selector:int = 0;
		private var spacePressed:Boolean = false;
		
		private var myMovieClip:FlxMovieClip;

		// do once when come into game
		public override function create():void
		{
			//add(test);
			//add(guiSprite);
			add(background);
			add(skillSelectImage);
			add(playerSprite1);
			add(playerSprite2);
			add(playerSprite3);

			enemySprite1.scale.x = -enemySprite1.scale.x;
			enemySprite2.scale.x = -enemySprite2.scale.x;
			enemySprite3.scale.x = -enemySprite3.scale.x;
			
			add(enemySprite1);
			add(enemySprite2);
			add(enemySprite3);
			add(arrowSprite);
			add(guiText1);
			add(guiText2);
			add(guiText3);
			add(guiText4);
			add(guiText5);
			topBarText.alignment = "center";

			guiText1.alignment = "center";
			guiText2.alignment = "center";
			guiText3.alignment = "center";
			guiText4.alignment = "center";
			
			
			add(p1hp);
			add(p2hp);
			add(p3hp);
			add(e1hp);
			add(e2hp);
			add(e3hp);
			add(p1s);
			add(p2s);
			add(p3s);
			add(e1s);
			add(e2s);
			add(e3s);
			
			add(p1h);
			add(p2h);
			add(p3h);
			add(p1s1);
			add(p2s1);
			add(p3s1);
			
			p1hp.text = p1.playerHP.toString();
			p2hp.text = p2.playerHP.toString();
			p3hp.text = p3.playerHP.toString();
			e1hp.text = e1.playerHP.toString();
			e2hp.text = e1.playerHP.toString();
			e3hp.text = e1.playerHP.toString();
			
			p1s.text = p1.playerSpecialPoints.toString();
			p2s.text = p2.playerSpecialPoints.toString();
			p3s.text = p3.playerSpecialPoints.toString();
			e1s.text = e1.playerSpecialPoints.toString();
			e2s.text = e2.playerSpecialPoints.toString();
			e3s.text = e3.playerSpecialPoints.toString();
			
			add(playerFaceSprite1);
			add(playerFaceSprite2);
			add(playerFaceSprite3);
			
			add(topBarImage);
			
			add(topBarText);
			
			p1nametext.alignment = "center";
			p2nametext.alignment = "center";
			p3nametext.alignment = "center";
			
			add(p1nametext);
			add(p2nametext);
			add(p3nametext);
			
			
			//FlxG.stage.addChild(crystallicShield);
			//crystallicShield.x = 400;
			//crystallicShield.y = 300
			// HACKS
			
			p1.playerSkill1.aFireball();
			p2.playerSkill1.aFireball();
			p3.playerSkill1.aFireball();
			e1.playerSkill1.aFireball();
			e2.playerSkill1.aFireball();
			e3.playerSkill1.aFireball();
			/*
			p2.playerSkill1.aCrystallicShield();
			p3.playerSkill1.aTorrentSlash();
			p1.playerSkill2.aHellFire();
			p2.playerSkill2.aLavaClaws();
			p3.playerSkill2.aFireball();
			p1.playerSkill3.aWhirlwindGale();
			p2.playerSkill3.aHealingWinds();
			p3.playerSkill3.aSacredWish();
			p1.playerSkill4.aSwipe();
			p2.playerSkill4.aMagicMissile();
			p3.playerSkill4.aFireArrow();
			*/
			
		} // create close bracket
		
		// called everyframe
		public override function update():void
		{
			// GUI Switching and turn base logic
			switch (turn)
			{
				case 0:
					// start of game
					// play animations and stuffs, set player 1 to go
					turn = 100;
					selector = 1;
					break;
				case 100:
					guiText1.text = p1.playerSkill1.name;
					guiText2.text = p1.playerSkill2.name;
					guiText3.text = p1.playerSkill3.name;
					guiText4.text = p1.playerSkill4.name;
					guiText5.text = "Player 1 Turn";
					topBarText.text = "Character 1's turn";
					
					if (p1.checkDead())
					{
						turn = 200;
						break;
					}
					
					if (FlxG.keys.justReleased("SPACE"))
					{
						turn = 200;
						switch (selector) // incase need targeting
						{
							case 1:
								skillsUsedThisTurn.push(new SkillStorage(p1.playerSkill1.name));
								if (p1.playerSkill1.hasTarget)
									turn = 110;
								break;
							case 2:
								skillsUsedThisTurn.push(new SkillStorage(p1.playerSkill2.name));
								if (p1.playerSkill2.hasTarget)
									turn = 110;
								break;
							case 3:
								skillsUsedThisTurn.push(new SkillStorage(p1.playerSkill3.name));
								if (p1.playerSkill3.hasTarget)
									turn = 110;
								break;
							case 4:
								skillsUsedThisTurn.push(new SkillStorage(p1.playerSkill4.name));
								if (p1.playerSkill4.hasTarget)
									turn = 110;
								break;
						}
						
						skillsUsedThisTurn[skillsUsedThisTurn.length - 1].caster = "p1";
						selector = 1;
					}
					break;
				case 110: // targeting mode
					guiText1.text = e1.name;
					guiText2.text = e2.name;
					guiText3.text = e3.name;
					guiText4.text = " ";
					guiText5.text = "Player 1 Target";
					if (FlxG.keys.justReleased("SPACE"))
					{
						turn = 200;
						switch (selector)
						{
							case 1:
								skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "e1";
								break;
							case 2:
								skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "e2";
								break;
							case 3:
								skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "e3";
								break;
							case 4:
								turn = 110;
								break;
							default:
								skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "e1";
								break;
						}
						
					}
					break;
				case 200:
					guiText1.text = p2.playerSkill1.name;
					guiText2.text = p2.playerSkill2.name;
					guiText3.text = p2.playerSkill3.name;
					guiText4.text = p2.playerSkill4.name;
					guiText5.text = "Player 2 Turn";
					topBarText.text = "Character 2's turn";
					
					if (p2.checkDead())
					{
						turn = 300;
						break;
					}
					
					if (FlxG.keys.justReleased("SPACE"))
					{

						turn = 300;
						switch (selector) // incase need targeting
						{
							case 1:
								skillsUsedThisTurn.push(new SkillStorage(p2.playerSkill1.name));
								if (p2.playerSkill1.hasTarget)            
									turn = 210;                           
								break;                                    
							case 2:                                       
								skillsUsedThisTurn.push(new SkillStorage(p2.playerSkill2.name));
								if (p2.playerSkill2.hasTarget)            
									turn = 210;                           
								break;                                    
							case 3:                                       
								skillsUsedThisTurn.push(new SkillStorage(p2.playerSkill3.name));
								if (p2.playerSkill3.hasTarget)            
									turn = 210;                           
								break;                                    
							case 4:                                       
								skillsUsedThisTurn.push(new SkillStorage(p2.playerSkill4.name));
								if (p2.playerSkill4.hasTarget)
									turn = 210;
								break;
						}
						skillsUsedThisTurn[skillsUsedThisTurn.length - 1].caster = "p2";
						selector = 1;
					}
					break;
				case 210: // targeting mode
					guiText1.text = e1.name;
					guiText2.text = e2.name;
					guiText3.text = e3.name;
					guiText4.text = " ";
					guiText5.text = "Player 2 Target";
					if (FlxG.keys.justReleased("SPACE"))
					{
						turn = 300;
						switch (selector)
						{
							case 1:
								skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "e1";
								break;
							case 2:
								skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "e2";
								break;
							case 3:
								skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "e3";
								break;
							case 4:
								turn = 210;
								break;
							default:
								skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "e1";
								break;
						}
						
					}
					break;					
				case 300:
					guiText1.text = p3.playerSkill1.name;
					guiText2.text = p3.playerSkill2.name;
					guiText3.text = p3.playerSkill3.name;
					guiText4.text = p3.playerSkill4.name;
					guiText5.text = "Player 3 Turn";
					topBarText.text = "Character 3's turn";
					
					if (p3.checkDead())
					{
						turn = 400;
						break;
					}
					
					
					if (FlxG.keys.justReleased("SPACE"))
					{
						turn = 400;
						switch (selector) // incase need targeting
						{
							case 1:
								skillsUsedThisTurn.push(new SkillStorage(p3.playerSkill1.name));
								if (p3.playerSkill1.hasTarget)            
									turn = 310;                           
								break;                                    
							case 2:                                       
								skillsUsedThisTurn.push(new SkillStorage(p3.playerSkill2.name));
								if (p3.playerSkill2.hasTarget)            
									turn = 310;                           
								break;                                    
							case 3:                                       
								skillsUsedThisTurn.push(new SkillStorage(p3.playerSkill3.name));
								if (p3.playerSkill3.hasTarget)            
									turn = 310;                           
								break;                                    
							case 4:                                       
								skillsUsedThisTurn.push(new SkillStorage(p3.playerSkill4.name));
								if (p3.playerSkill4.hasTarget)
									turn = 310;
								break;
						}
						skillsUsedThisTurn[skillsUsedThisTurn.length - 1].caster = "p3";
						selector = 1;
					}
					break;
				case 310: // targeting mode
					guiText1.text = e1.name;
					guiText2.text = e2.name;
					guiText3.text = e3.name;
					guiText4.text = " ";
					guiText5.text = "Player 3 Target";
					if (FlxG.keys.justReleased("SPACE"))
					{
						turn = 400;
						switch (selector)
						{
							case 1:
								skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "e1";
								break;
							case 2:
								skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "e2";
								break;
							case 3:
								skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "e3";
								break;
							case 4:
								turn = 310;
							default:
								skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "e1";
								break;
						}					
					}
					break;					
				case 400:
					trace ("AI's Turn");
					// select e1 skill
					//var temp:int = Globals.randomInt(1, 4);
					var temp:int = Globals.randomInt(1, 1);
					switch (temp)
					{
						case 1:
							skillsUsedThisTurn.push(new SkillStorage(e1.playerSkill1.name));
							break;
						case 2:
							skillsUsedThisTurn.push(new SkillStorage(e1.playerSkill2.name));
							break;
						case 3:
							skillsUsedThisTurn.push(new SkillStorage(e1.playerSkill3.name));
							break;
						case 4:
							skillsUsedThisTurn.push(new SkillStorage(e1.playerSkill4.name));
							break;
					}
					skillsUsedThisTurn[skillsUsedThisTurn.length - 1].caster = "e1";
					if (skillsUsedThisTurn[skillsUsedThisTurn.length - 1].thisSkill.hasTarget)
					{
						// setTarget
						skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "p1";
						/*
						if (p1.playerHP > 0)
							skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "p1";
						else if (p2.playerHP > 0)
							skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "p2";
						else if (p3.playerHP > 0)
							skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "p3";
						else
							trace ("Shouldn't come here");
						*/
					}
					
					// select e2 skill
					//temp = Globals.randomInt(1, 4);
					switch (temp)
					{
						case 1:
							skillsUsedThisTurn.push(new SkillStorage(e2.playerSkill1.name));
							break;
						case 2:
							skillsUsedThisTurn.push(new SkillStorage(e2.playerSkill2.name));
							break;
						case 3:
							skillsUsedThisTurn.push(new SkillStorage(e2.playerSkill3.name));
							break;
						case 4:
							skillsUsedThisTurn.push(new SkillStorage(e2.playerSkill4.name));
							break;
					}
					skillsUsedThisTurn[skillsUsedThisTurn.length - 1].caster = "e2";
					if (skillsUsedThisTurn[skillsUsedThisTurn.length - 1].thisSkill.hasTarget)
					{
						// setTarget
						skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "p2";
						/*
						if (p1.playerHP > 0)
							skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "p1";
						else if (p2.playerHP > 0)
							skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "p2";
						else if (p3.playerHP > 0)
							skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "p3";
						else
							trace ("Shouldn't come here");
						*/
					}
					
					// select e3 skill
					//temp = Globals.randomInt(1, 4);
					switch (temp)
					{
						case 1:
							skillsUsedThisTurn.push(new SkillStorage(e3.playerSkill1.name));
							break;
						case 2:
							skillsUsedThisTurn.push(new SkillStorage(e3.playerSkill2.name));
							break;
						case 3:
							skillsUsedThisTurn.push(new SkillStorage(e3.playerSkill3.name));
							break;
						case 4:
							skillsUsedThisTurn.push(new SkillStorage(e3.playerSkill4.name));
							break;
					}
					skillsUsedThisTurn[skillsUsedThisTurn.length - 1].caster = "e3";
					if (skillsUsedThisTurn[skillsUsedThisTurn.length - 1].thisSkill.hasTarget)
					{
						// setTarget
						skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "p3";
						/*
						if (p1.playerHP > 0)
							skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "p1";
						else if (p2.playerHP > 0)
							skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "p2";
						else if (p3.playerHP > 0)
							skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "p3";
						else
							trace ("Shouldn't come here");
						*/
					}
					
					turn = 500;
					break;
				case 500:
					trace ("calculations of skills");
					turn = 600;
					//trace ("skillsUsedThisTurn: ", skillsUsedThisTurn);
					trace ("The 6 skills");
					for (var i:int = 0; i < skillsUsedThisTurn.length; i++) 
					{
						skillsUsedThisTurn[i].updateSpeeds();
						Globals.getCharacterFromString(skillsUsedThisTurn[i].caster).playerSpecialPoints -= skillsUsedThisTurn[i].thisSkill.cost;
						trace (skillsUsedThisTurn[i].caster, skillsUsedThisTurn[i].target ,skillsUsedThisTurn[i].thisSkill.name , skillsUsedThisTurn[i].speedOfSkill)
					}
					
					skillsUsedThisTurn.sortOn("speedOfSkill", 1);
					
					for (var j:int = 0; j < skillsUsedThisTurn.length; j++) 
					{
						// Dead characaters should not be able to cast skills
						if (skillsUsedThisTurn[j].caster == "p1" && p1.checkDead())
						{
							skillsUsedThisTurn[j].destroyed = true;
							continue;
						}
						if (skillsUsedThisTurn[j].caster == "p2" && p2.checkDead())
						{
							skillsUsedThisTurn[j].destroyed = true;
							continue;
						}
						if (skillsUsedThisTurn[j].caster == "p3" && p3.checkDead())
						{
							skillsUsedThisTurn[j].destroyed = true;
							continue;
						}
						if (skillsUsedThisTurn[j].caster == "e1" && e1.checkDead())
						{
							skillsUsedThisTurn[j].destroyed = true;
							continue;
						}
						if (skillsUsedThisTurn[j].caster == "e2" && e2.checkDead())
						{
							skillsUsedThisTurn[j].destroyed = true;
							continue;
						}
						if (skillsUsedThisTurn[j].caster == "e3" && e3.checkDead())
						{
							skillsUsedThisTurn[j].destroyed = true;
							continue;
						}
						
						// Dead characaters should not be able to take skills
						if (skillsUsedThisTurn[j].target == "p1" && p1.checkDead())
						{
							skillsUsedThisTurn[j].destroyed = true;
							continue;
						}
						if (skillsUsedThisTurn[j].target == "p2" && p2.checkDead())
						{
							skillsUsedThisTurn[j].destroyed = true;
							continue;
						}
						if (skillsUsedThisTurn[j].target == "p3" && p3.checkDead())
						{
							skillsUsedThisTurn[j].destroyed = true;
							continue;
						}
						if (skillsUsedThisTurn[j].target == "e1" && e1.checkDead())
						{
							skillsUsedThisTurn[j].destroyed = true;
							continue;
						}
						if (skillsUsedThisTurn[j].target == "e2" && e2.checkDead())
						{
							skillsUsedThisTurn[j].destroyed = true;
							continue;
						}
						if (skillsUsedThisTurn[j].target == "e3" && e3.checkDead())
						{
							skillsUsedThisTurn[j].destroyed = true;
							continue;
						}
						if (skillsUsedThisTurn[j].target != "none") // single target
						{
							var tmpSkill:SkillClass = skillsUsedThisTurn[j].thisSkill;
							var baseDamage:int 	= tmpSkill.power 
												+ tmpSkill.isPhysical ? Globals.getCharacterFromString(skillsUsedThisTurn[j].caster).playerAttackPower		 : Globals.getCharacterFromString(skillsUsedThisTurn[j].caster).playerSpecialAttack;
							var baseDefense:int = tmpSkill.isPhysical ? Globals.getCharacterFromString(skillsUsedThisTurn[j].target).playerPhysicalDefense	 : Globals.getCharacterFromString(skillsUsedThisTurn[j].target).playerSpecialDefense;
							var elementalMultiplier:Number = Globals.checkElementalDifference(skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].target);
							var classResistance:Number = Globals.checkClassResistance(skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].target);
															
							skillsUsedThisTurn[j].damage = (baseDamage * elementalMultiplier) - (baseDefense * classResistance);
							//trace (baseDamage, baseDefense, elementalMultiplier, classResistance);
							//trace ("dps:" ,skillsUsedThisTurn[j].damage);
							
							if (skillsUsedThisTurn[j].damage < 0)
								skillsUsedThisTurn[j].damage = 0;
								
							animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CASTER_ON_TARGET_WITH_SKILL, skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].target, skillsUsedThisTurn[j].thisSkill.name, skillsUsedThisTurn[j].thisSkill.name,skillsUsedThisTurn[j].thisSkill.name));
							animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.ANIMATION, skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].target, skillsUsedThisTurn[j].thisSkill.name, skillsUsedThisTurn[j].thisSkill.name,skillsUsedThisTurn[j].thisSkill.name));
							if (skillsUsedThisTurn[j].damage)
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CASTER_DAMAGE, skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].target, skillsUsedThisTurn[j].damage.toString(), skillsUsedThisTurn[j].thisSkill.name));	
							else
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.NO_DAMAGE, "", ""));
						}
						else // AOE
						{
							var tmpSkill2:SkillClass = skillsUsedThisTurn[j].thisSkill;
							var baseDamage2:int 	= tmpSkill2.power 
												+ tmpSkill2.isPhysical ? Globals.getCharacterFromString(skillsUsedThisTurn[j].caster).playerAttackPower		 : Globals.getCharacterFromString(skillsUsedThisTurn[j].caster).playerSpecialAttack;
							var baseDefense2:int = tmpSkill2.isPhysical ? Globals.e1.playerPhysicalDefense	 : Globals.e1.playerSpecialDefense;
							var elementalMultiplier2:Number = Globals.checkElementalDifference(skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].caster);
							var classResistance2:Number = Globals.checkClassResistance(skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].target);
															
							skillsUsedThisTurn[j].damage = (baseDamage * elementalMultiplier) - (baseDefense * classResistance);
							
							if (skillsUsedThisTurn[j].damage < 0)
								skillsUsedThisTurn[j].damage = 0;
								
							animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CASTER_ON_TARGET_WITH_SKILL, skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].target, skillsUsedThisTurn[j].thisSkill.name, skillsUsedThisTurn[j].thisSkill.name,skillsUsedThisTurn[j].thisSkill.name));
							animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.ANIMATION, skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].target, skillsUsedThisTurn[j].thisSkill.name, skillsUsedThisTurn[j].thisSkill.name,skillsUsedThisTurn[j].thisSkill.name));
							if (skillsUsedThisTurn[j].damage)
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CASTER_DAMAGE, skillsUsedThisTurn[j].caster, "e1", skillsUsedThisTurn[j].damage.toString(), skillsUsedThisTurn[j].thisSkill.name));	
							else
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.NO_DAMAGE, "", ""));
								
								// 2
						    tmpSkill2 = skillsUsedThisTurn[j].thisSkill;
							baseDamage2	= tmpSkill2.power 
											+ tmpSkill2.isPhysical ? Globals.getCharacterFromString(skillsUsedThisTurn[j].caster).playerAttackPower		 : Globals.getCharacterFromString(skillsUsedThisTurn[j].caster).playerSpecialAttack;
							baseDefense2 = tmpSkill2.isPhysical ? Globals.e1.playerPhysicalDefense	 : Globals.e1.playerSpecialDefense;
							elementalMultiplier2 = Globals.checkElementalDifference(skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].caster);
							classResistance2 = Globals.checkClassResistance(skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].target);
															
							skillsUsedThisTurn[j].damage = (baseDamage * elementalMultiplier) - (baseDefense * classResistance);
							
							if (skillsUsedThisTurn[j].damage < 0)
								skillsUsedThisTurn[j].damage = 0;
								
							//animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CASTER_ON_TARGET_WITH_SKILL, skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].target, skillsUsedThisTurn[j].thisSkill.name, skillsUsedThisTurn[j].thisSkill.name,skillsUsedThisTurn[j].thisSkill.name));
							//animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.ANIMATION, skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].target, skillsUsedThisTurn[j].thisSkill.name, skillsUsedThisTurn[j].thisSkill.name,skillsUsedThisTurn[j].thisSkill.name));
							if (skillsUsedThisTurn[j].damage)
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CASTER_DAMAGE, skillsUsedThisTurn[j].caster, "e2", skillsUsedThisTurn[j].damage.toString(), skillsUsedThisTurn[j].thisSkill.name));	
							else
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.NO_DAMAGE, "", ""));
								
								// 3
							tmpSkill2 = skillsUsedThisTurn[j].thisSkill;
							baseDamage2 	= tmpSkill2.power 
											+ tmpSkill2.isPhysical ? Globals.getCharacterFromString(skillsUsedThisTurn[j].caster).playerAttackPower		 : Globals.getCharacterFromString(skillsUsedThisTurn[j].caster).playerSpecialAttack;
							baseDefense2 = tmpSkill2.isPhysical ? Globals.e1.playerPhysicalDefense	 : Globals.e1.playerSpecialDefense;
							elementalMultiplier2 = Globals.checkElementalDifference(skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].caster);
							classResistance2 = Globals.checkClassResistance(skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].target);
															
							skillsUsedThisTurn[j].damage = (baseDamage * elementalMultiplier) - (baseDefense * classResistance);
							
							if (skillsUsedThisTurn[j].damage < 0)
								skillsUsedThisTurn[j].damage = 0;
								
							//animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CASTER_ON_TARGET_WITH_SKILL, skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].target, skillsUsedThisTurn[j].thisSkill.name, skillsUsedThisTurn[j].thisSkill.name,skillsUsedThisTurn[j].thisSkill.name));
							//animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.ANIMATION, skillsUsedThisTurn[j].caster, skillsUsedThisTurn[j].target, skillsUsedThisTurn[j].thisSkill.name, skillsUsedThisTurn[j].thisSkill.name,skillsUsedThisTurn[j].thisSkill.name));
							if (skillsUsedThisTurn[j].damage)
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CASTER_DAMAGE, skillsUsedThisTurn[j].caster, "e3", skillsUsedThisTurn[j].damage.toString(), skillsUsedThisTurn[j].thisSkill.name));	
							else
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.NO_DAMAGE, "", ""));
						}
						
						// calculating damage to be done
						if (skillsUsedThisTurn[j].target == "p1")
						{
							p1.playerHP -= skillsUsedThisTurn[j].damage;
							if (p1.playerHP <= 0)
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CHARCTER_DIES, p1.name, "p1"));
						}
						if (skillsUsedThisTurn[j].target == "p2")
						{
							p2.playerHP -= skillsUsedThisTurn[j].damage;
							if (p2.playerHP <= 0)
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CHARCTER_DIES, p2.name, "p2"));							
						}
						if (skillsUsedThisTurn[j].target == "p3")
						{
							p3.playerHP -= skillsUsedThisTurn[j].damage;
							if (p3.playerHP <= 0)
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CHARCTER_DIES, p3.name, "p3"));	
						}
						if (skillsUsedThisTurn[j].target == "e1")
						{
							e1.playerHP -= skillsUsedThisTurn[j].damage;
							if (e1.playerHP <= 0)
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CHARCTER_DIES, e1.name, "e1"));
						}
						if (skillsUsedThisTurn[j].target == "e2")
						{
							e2.playerHP -= skillsUsedThisTurn[j].damage;
							if (e2.playerHP <= 0)
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CHARCTER_DIES, e2.name, "e2"));							
						}
						if (skillsUsedThisTurn[j].target == "e3")
						{
							e3.playerHP -= skillsUsedThisTurn[j].damage;
							if (e3.playerHP <= 0)
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CHARCTER_DIES, e3.name, "e3"));							
						}
						if (skillsUsedThisTurn[j].target == "none")
						{
							e1.playerHP -= skillsUsedThisTurn[j].damage;
							if (e1.playerHP <= 0)
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CHARCTER_DIES, e1.name, "e1"));
							e2.playerHP -= skillsUsedThisTurn[j].damage;
							if (e2.playerHP <= 0)
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CHARCTER_DIES, e2.name, "e2"));										
							e3.playerHP -= skillsUsedThisTurn[j].damage;
							if (e3.playerHP <= 0)
								animationThisTurn.push(new AnimationClassDisplay(AnimationClassDisplay.CHARCTER_DIES, e3.name, "e3"));
						}
						skillsUsedThisTurn[j].callTextDisplay();
					}
					animationStatus = 0;
					animationDoOnce = true;
					break;
				case 600:
					//trace ("Animations occur here");
					skillSelectImage.visible = false;
					//arrowSprite.visible = false;
					remove(arrowSprite);
					guiText1.text = "";
					guiText2.text = "";
					guiText3.text = "";
					guiText4.text = "";
					
					if (animationStatus == animationThisTurn.length)
					{
						animationDoOnce = false;
						turn = 700;
						topBarText.text = "Character 1's turn";
						break;
					}
					
					if (FlxG.keys.justReleased("SPACE")) // lets the user press the space bar to continue viewing what happened
					{
						++animationStatus;
						animationDoOnce = true;
						
						if (animationStatus == animationThisTurn.length)
						{
							animationDoOnce = false;
							turn = 700;
							topBarText.text = "Character 1's turn";
							break;
						}
					}
					
					if (animationDoOnce) // animation happens here
					{
					    topBarText.text = animationThisTurn[animationStatus].topText;
						if (topBarText.text == "AntonCode") // stupid hardcode way of knowing that its time to play an animation
						{
							topBarText.text	= "";
							handleSkillAnimation(animationThisTurn[animationStatus]);
						}
						if (animationThisTurn[animationStatus].type == AnimationClassDisplay.CHARCTER_DIES)
						{
							if (animationThisTurn[animationStatus].target == "p1")
								playerSprite1.loadGraphic(p1.deadCharacter);
							if (animationThisTurn[animationStatus].target == "p2")
								playerSprite2.loadGraphic(p2.deadCharacter);
							if (animationThisTurn[animationStatus].target == "p3")
								playerSprite3.loadGraphic(p3.deadCharacter);
							if (animationThisTurn[animationStatus].target == "e1")
								enemySprite1.loadGraphic(e1.deadCharacter);
							if (animationThisTurn[animationStatus].target == "e2")
								enemySprite2.loadGraphic(e2.deadCharacter);
							if (animationThisTurn[animationStatus].target == "e3")
								enemySprite3.loadGraphic(e3.deadCharacter);
						}
						animationDoOnce = false;
					}

					break;
				case 700:
					skillSelectImage.visible = true;
					animationDoOnce = true;
					add(arrowSprite);
					
					if (myMovieClip)
					{
						remove(myMovieClip);	
						myMovieClip = null;
					}
				
					trace ("clean up");
					p1.addSpecialPoints();
					p2.addSpecialPoints();
					p3.addSpecialPoints();
					e1.addSpecialPoints();
					e2.addSpecialPoints();
					e3.addSpecialPoints();
					
					p1hp.text = p1.playerHP.toString();
					p2hp.text = p2.playerHP.toString();
					p3hp.text = p3.playerHP.toString();
					e1hp.text = e1.playerHP.toString();
					e2hp.text = e2.playerHP.toString();
					e3hp.text = e3.playerHP.toString();
					
					p1s.text = p1.playerSpecialPoints.toString();
					p2s.text = p2.playerSpecialPoints.toString();
					p3s.text = p3.playerSpecialPoints.toString();
					e1s.text = e1.playerSpecialPoints.toString();
					e2s.text = e2.playerSpecialPoints.toString();
					e3s.text = e3.playerSpecialPoints.toString();
					
					skillsUsedThisTurn = null;
					skillsUsedThisTurn = new Array();
					animationThisTurn = null;
					animationThisTurn = new Vector.<AnimationClassDisplay>;
					
					if (p3.playerHP <= 0)
						turn = 900;
					else if (e1.playerHP <= 0 && e2.playerHP <= 0 && e3.playerHP <= 0)
						turn = 800;
					else
						turn = 100;
					break;
				case 800:
					if (animationDoOnce)
					{
						add(new FlxSprite(0, 0, Assets.winPageBackground));
					}
					if (FlxG.keys.justReleased("SPACE"))
						FlxG.switchState(new MainMenu);
					break;
				case 900:
					if (animationDoOnce)
					{
						add(new FlxSprite(0, 0, Assets.losePageBackground));
					}
					if (FlxG.keys.justReleased("SPACE"))
						FlxG.switchState(new MainMenu);
					break;
				default:
					trace("Uncoded Turn - Anton to check");
			}
			
			// handle inputs WS
			if (FlxG.keys.justReleased("W"))
			{
				if (selector > 1)
					selector --;
			}
			if (FlxG.keys.justReleased("S"))
			{
				if (selector < 4)
					selector++;
			}
			if (FlxG.keys.justReleased("SPACE"))
			{
				// unused for now
			}
			
			// update arrow position
			switch (selector) 
			{
			case 0:
					arrowSprite.visible = false;
				break;
			case 1:
					arrowSprite.visible = true;
					arrowSprite.x = 268;
					arrowSprite.y = 204;
				break;
			case 2:
					arrowSprite.visible = true;
					arrowSprite.x = 268;
					arrowSprite.y = 243;
				break;				
			case 3:
					arrowSprite.visible = true;
					arrowSprite.x = 268;
					arrowSprite.y = 282;
				break;
			case 4:
					arrowSprite.visible = true;
					arrowSprite.x = 268;
					arrowSprite.y = 321;
				break;				
			default:
				trace("arrowSprite - Default shouldn't happen");
			}
			
		} // updateloop close bracket
		
		// additional functions goes here
			public function handleSkillAnimation(object:AnimationClassDisplay):void 
			{
				if (myMovieClip)
				{
					remove(myMovieClip);
					myMovieClip = null;
				}
					
				trace(object.skillName);
				var tmp:*
				switch (object.skillName)
				{
					case "Swipe":
						tmp = new Swipe;
						myMovieClip = new FlxMovieClip(1,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target == "e1")
						{
							myMovieClip.x = 572;
							myMovieClip.y = 100;
						}
						if (object.target == "e2")
						{
							myMovieClip.x = 659;
							myMovieClip.y = 199;
						}
						if (object.target == "e3")
						{
							myMovieClip.x = 598;
							myMovieClip.y = 294;
						}
						if (object.target == "p1")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 66;
							myMovieClip.y = 101;
						}
						if (object.target == "p2")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = -14;
							myMovieClip.y = 191;
						}
						if (object.target == "p3")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 46;
							myMovieClip.y = 295;
						}						
						add(myMovieClip);
						break;
					case "Magic Missile":					
						tmp = new MagicMissle;
												myMovieClip = new FlxMovieClip(1,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target == "e1")
						{
							myMovieClip.x = 572;
							myMovieClip.y = 100;
						}
						if (object.target == "e2")
						{
							myMovieClip.x = 659;
							myMovieClip.y = 199;
						}
						if (object.target == "e3")
						{
							myMovieClip.x = 598;
							myMovieClip.y = 294;
						}
						if (object.target == "p1")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 66;
							myMovieClip.y = 101;
						}
						if (object.target == "p2")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = -14;
							myMovieClip.y = 191;
						}
						if (object.target == "p3")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 46;
							myMovieClip.y = 295;
						}						
						add(myMovieClip);
						break;
					case "Arrow Shot":
						tmp = new ArrowShot;
												myMovieClip = new FlxMovieClip(1,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target == "e1")
						{
							myMovieClip.x = 572;
							myMovieClip.y = 100;
						}
						if (object.target == "e2")
						{
							myMovieClip.x = 659;
							myMovieClip.y = 199;
						}
						if (object.target == "e3")
						{
							myMovieClip.x = 598;
							myMovieClip.y = 294;
						}
						if (object.target == "p1")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 66;
							myMovieClip.y = 101;
						}
						if (object.target == "p2")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = -14;
							myMovieClip.y = 191;
						}
						if (object.target == "p3")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 46;
							myMovieClip.y = 295;
						}						
						add(myMovieClip);
						break;
					case "Star Frost":
						tmp = new StarFrost;
						myMovieClip = new FlxMovieClip(1,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target == "e1")
						{
							myMovieClip.x = 172;
							myMovieClip.y = 100;
						}
						if (object.target == "e2")
						{
							myMovieClip.x = 159;
							myMovieClip.y = 199;
						}
						if (object.target == "e3")
						{
							myMovieClip.x = 198;
							myMovieClip.y = 294;
						}
						if (object.target == "p1")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 610;
							myMovieClip.y = 101;
						}
						if (object.target == "p2")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = -14+500;
							myMovieClip.y = 191;
						}
						if (object.target == "p3")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 46+500;
							myMovieClip.y = 295;
						}						
						add(myMovieClip);
						break;
					case "Torrent Slash":
						tmp = new TorrentSlash;	
						myMovieClip = new FlxMovieClip(1,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target == "e1")
						{
							myMovieClip.x = 572;
							myMovieClip.y = 100;
						}
						if (object.target == "e2")
						{
							myMovieClip.x = 659;
							myMovieClip.y = 199;
						}
						if (object.target == "e3")
						{
							myMovieClip.x = 598;
							myMovieClip.y = 294;
						}
						if (object.target == "p1")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 66 + 181;
							myMovieClip.y = 101;
						}
						if (object.target == "p2")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = -14 + 181;
							myMovieClip.y = 191;
						}
						if (object.target == "p3")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 46 + 181;
							myMovieClip.y = 295;
						}						
						add(myMovieClip);
						break;
					case  "Crystallic Shield":
						tmp = new CrystallicShield;	
						myMovieClip = new FlxMovieClip(-100001,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target == "p1")
						{
							myMovieClip.x = 33;
							myMovieClip.y = 24;
						}
						if (object.target == "p2")
						{
							myMovieClip.x = 1;
							myMovieClip.y = 122;
						}
						if (object.target == "p3")
						{
							myMovieClip.x = 14;
							myMovieClip.y = 224;
						}						
						add(myMovieClip);
						break;		
					case "Lava Claws":
						tmp = new LavaStrike;		
						myMovieClip = new FlxMovieClip(1,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target == "e1")
						{
							myMovieClip.x = 487;
							myMovieClip.y = 34;
						}
						if (object.target == "e2")
						{
							myMovieClip.x = 516;
							myMovieClip.y = 124;
						}
						if (object.target == "e3")
						{
							myMovieClip.x = 501;
							myMovieClip.y = 219;
						}
						if (object.target == "p1")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 312;
							myMovieClip.y = 32;
						}
						if (object.target == "p2")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 284;
							myMovieClip.y = 127;
						}
						if (object.target == "p3")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 289;
							myMovieClip.y = 239;
						}						
						add(myMovieClip);
						break;						
					case "Fireball":
						tmp = new Fireball;
												myMovieClip = new FlxMovieClip(1,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target == "e1")
						{
							myMovieClip.x = 180;
							myMovieClip.y = 127;
						}
						if (object.target == "e2")
						{
							myMovieClip.x = 94;
							myMovieClip.y = 224;
						}
						if (object.target == "e3")
						{
							myMovieClip.x = 154;
							myMovieClip.y = 327;
						}
						if (object.target == "p1")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 630;
							myMovieClip.y = 126;
						}
						if (object.target == "p2")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 701;
							myMovieClip.y = 217;
						}
						if (object.target == "p3")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 641;
							myMovieClip.y = 320;
						}						
						add(myMovieClip);
						break;						
					case "Whirlwind Gale":
						tmp = new WhirlwindGale;
												myMovieClip = new FlxMovieClip(1,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target == "e1")
						{
							myMovieClip.x = 572;
							myMovieClip.y = 100;
						}
						if (object.target == "e2")
						{
							myMovieClip.x = 659;
							myMovieClip.y = 199;
						}
						if (object.target == "e3")
						{
							myMovieClip.x = 598;
							myMovieClip.y = 294;
						}
						if (object.target == "p1")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 66;
							myMovieClip.y = 101;
						}
						if (object.target == "p2")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = -14;
							myMovieClip.y = 191;
						}
						if (object.target == "p3")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 46;
							myMovieClip.y = 295;
						}						
						add(myMovieClip);
						break;			
					case "Healing Winds":
						tmp = new HealingWinds;
						myMovieClip = new FlxMovieClip(100000,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target == "p1")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 351;
							myMovieClip.y = 60;
						}
						if (object.target == "p2")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 268;
							myMovieClip.y = 160;
						}
						if (object.target == "p3")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 329;
							myMovieClip.y = 252;
						}						
						add(myMovieClip);
						break;
					case "Sacred Wish":
						tmp = new SacredWish;
						myMovieClip = new FlxMovieClip(1,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target == "e1")
						{
							myMovieClip.x = 572;
							myMovieClip.y = 100;
						}
						if (object.target == "e2")
						{
							myMovieClip.x = 659;
							myMovieClip.y = 199;
						}
						if (object.target == "e3")
						{
							myMovieClip.x = 598;
							myMovieClip.y = 294;
						}
						if (object.target == "p1")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 66;
							myMovieClip.y = 101;
						}
						if (object.target == "p2")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = -14;
							myMovieClip.y = 191;
						}
						if (object.target == "p3")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 46;
							myMovieClip.y = 295;
						}						
						add(myMovieClip);
						break;
					case "Hell Fire":
						tmp = new HellFire;				
						myMovieClip = new FlxMovieClip(1,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target == "e1")
						{
							myMovieClip.x = 542-40;
							myMovieClip.y = 1;
						}
						if (object.target == "e2")
						{
							myMovieClip.x = 603;
							myMovieClip.y = 28;
						}
						if (object.target == "e3")
						{
							myMovieClip.x = 544;
							myMovieClip.y = 120;
						}
						if (object.target == "p1")
						{
							//myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 1;
							myMovieClip.y = 1;
						}
						if (object.target == "p2")
						{
							//myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 1;
							myMovieClip.y = 29;
						}
						if (object.target == "p3")
						{
							//myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 1;
							myMovieClip.y = 121;
						}					
						add(myMovieClip);
						break;
						
// ----------------- AOE						
					case "Blizzard":
						tmp = new Blizzard;
						myMovieClip = new FlxMovieClip(1,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 799;
						}
						add(myMovieClip);
					break;
					case "Frost Dispel":
						tmp = new FrostDispel;	
						myMovieClip = new FlxMovieClip(475,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 799;
						}
						add(myMovieClip);
						break;
					case "Piercing Flames":
						tmp = new PiercingFlames;
						myMovieClip = new FlxMovieClip(400,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 799;
						}
						add(myMovieClip);
						break;
					case "Roaring Flare":
						tmp = new RoaringFlare;	
						myMovieClip = new FlxMovieClip(1,110);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 799;
						}
						add(myMovieClip);
						break;
					case "Feather Dance":
						tmp = new FeatherDance;
						myMovieClip = new FlxMovieClip(1,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 799;
						}
						add(myMovieClip);
						break;
					case "Shooting Star":
						tmp = new ShootingStar;
						myMovieClip = new FlxMovieClip(400,1);
						myMovieClip.loadMovieClip(tmp, 800, 600, false, true);
						if (object.target.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 799;
						}
						add(myMovieClip);
						break;
					default:
						trace("ERROR! - Skill not found - ",object.skillName);
						break;
						
				}
				
			}
	}

}