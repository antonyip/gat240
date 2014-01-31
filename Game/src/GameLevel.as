package  
{
	import flash.display.MovieClip;
	import org.flixel.*;
	import org.flixel.plugin.funstorm.FlxMovieClip;
	import Blizzard;
	
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
		private var guiText1:FlxText = new FlxText(400, 250, 120, "");
		private var guiText2:FlxText = new FlxText(400, 280, 120, "");
		private var guiText3:FlxText = new FlxText(400, 310, 120, "");
		private var guiText4:FlxText = new FlxText(400, 340, 120, "");
		private var guiText5:FlxText = new FlxText(-400, 420, 120, "");
		private var topBarText:FlxText = new FlxText(200, 100, 600, "I tell you what happens here");
		
		private var topBarImage:FlxSprite = new FlxSprite(200, 50, Assets.gameLevelTopBorder);
		private var skillSelectImage:FlxSprite = new FlxSprite(300, 200, Assets.gameLevelSkillSelect);
		
		// Game Calculations
		private var p1:CharacterClass = Globals.p1; // player 1
		private var p2:CharacterClass = Globals.p2; // player 2
		private var p3:CharacterClass = Globals.p3; // player 3
		private var e1:CharacterClass = Globals.e1; // enemy 1
		private var e2:CharacterClass = Globals.e2; // enemy 2
		private var e3:CharacterClass = Globals.e3; // enemy 3
		
		private var playerSprite1:FlxSprite = new FlxSprite(80, 100, p1.sideViewCharater);
		private var playerSprite2:FlxSprite = new FlxSprite(40, 200, p2.sideViewCharater);
		private var playerSprite3:FlxSprite = new FlxSprite(80, 300, p3.sideViewCharater);
		private var enemySprite1:FlxSprite = new FlxSprite(550, 100, e1.sideViewCharater);
		private var enemySprite2:FlxSprite = new FlxSprite(600, 200, e2.sideViewCharater);
		private var enemySprite3:FlxSprite = new FlxSprite(550, 300, e3.sideViewCharater);
		
		private var playerFaceSprite1:FlxSprite = new FlxSprite(50,  450, p1.smallFace);
		private var playerFaceSprite2:FlxSprite = new FlxSprite(250, 450, p2.smallFace);
		private var playerFaceSprite3:FlxSprite = new FlxSprite(450, 450, p3.smallFace);
		
		// gui text for hp and stam
		private var p1hp:FlxText = new FlxText(200, 450, 120, "");
		private var p2hp:FlxText = new FlxText(250, 450, 120, "");
		private var p3hp:FlxText = new FlxText(300, 450, 120, "");
		private var e1hp:FlxText = new FlxText(400, 450, 120, "");
		private var e2hp:FlxText = new FlxText(450, 450, 120, "");
		private var e3hp:FlxText = new FlxText(500, 450, 120, "");
		
		private var p1s:FlxText = new FlxText(200, 480, 120, "");
		private var p2s:FlxText = new FlxText(250, 480, 120, "");
		private var p3s:FlxText = new FlxText(300, 480, 120, "");
		private var e1s:FlxText = new FlxText(400, 480, 120, "");
		private var e2s:FlxText = new FlxText(450, 480, 120, "");
		private var e3s:FlxText = new FlxText(500, 480, 120, "");
		
		// OtherStats
		private var damageVariance:Number = 0; 	// 0-1 .. if you put 0.5.. the damage will become 0.5 to 1.5 times.. works like a +- system
		private var damageType:String;			// unused.. following guide
		private var damageTypeMultiple:String;	// unused
		private var stamRegen:int = 15;
		
		private var animationStatus:int = 0;
		
		// Skill Animation
		//private var crystallicShield:CrystallicShield = new CrystallicShield();
		
		// storage for skills used as well as structure and target
		private var skillsUsedThisTurn:Array = new Array();
		private var animationThisTurn:Vector.<AnimationClassDisplay> = new Vector.<AnimationClassDisplay>;
		
		// Game Logic
		private var turn:int = 0;
		private var animationDoOnce:Boolean = true;
		// using big numbers just incase we need to insert special effects
		// turn 0 start of game
		// turn 100 player 1 turn
		// turn 200 player 2 turn
		// turn 300 player 3 turn
		// turn 400 enemy 1 turn
		// turn 500 enemy 2 turn
		// turn 600 enemy 3 turn
		
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
			
			//FlxG.stage.addChild(crystallicShield);
			//crystallicShield.x = 400;
			//crystallicShield.y = 300
			// HACKS
			
			p1.playerSkill1.aBlizzard();
			p1.playerSkill2.aStarFrost();
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
					guiText4.text = "Back";
					guiText5.text = "Player 1 Target";
					if (FlxG.keys.justReleased("SPACE"))
					{
						switch (selector)
						{
							default:
								skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "e1";
								break;
						}
						turn = 200;
					}
					break;
				case 200:
					guiText1.text = p2.playerSkill1.name;
					guiText2.text = p2.playerSkill2.name;
					guiText3.text = p2.playerSkill3.name;
					guiText4.text = p2.playerSkill4.name;
					guiText5.text = "Player 2 Turn";
					
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
					guiText4.text = "Back";
					guiText5.text = "Player 2 Target";
					if (FlxG.keys.justReleased("SPACE"))
					{
						switch (selector)
						{
							default:
								skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "e1";
								break;
						}
						turn = 200;
						turn = 300;
					}
					break;					
				case 300:
					guiText1.text = p3.playerSkill1.name;
					guiText2.text = p3.playerSkill2.name;
					guiText3.text = p3.playerSkill3.name;
					guiText4.text = p3.playerSkill4.name;
					guiText5.text = "Player 3 Turn";
					
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
					guiText4.text = "Back";
					guiText5.text = "Player 3 Target";
					if (FlxG.keys.justReleased("SPACE"))
					{
						turn = 400;
						switch (selector)
						{
							default:
								skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "e1";
								break;
						}					
					}
					break;					
				case 400:
					trace ("AI's Turn");
					// select e1 skill
					var temp:int = Globals.randomInt(1, 4);
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
					}
					
					// select e2 skill
					temp = Globals.randomInt(1, 4);
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
						skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "p1";
					}
					
					// select e3 skill
					temp = Globals.randomInt(1, 4);
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
						skillsUsedThisTurn[skillsUsedThisTurn.length - 1].target = "p1";
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
						
						
						// calculating damage to be done
						if (skillsUsedThisTurn[j].target == "p1")
						{
							p1.playerHP -= skillsUsedThisTurn[j].damage;
						}
						if (skillsUsedThisTurn[j].target == "p2")
						{
							p2.playerHP -= skillsUsedThisTurn[j].damage;
						}
						if (skillsUsedThisTurn[j].target == "p3")
						{
							p3.playerHP -= skillsUsedThisTurn[j].damage;
						}
						if (skillsUsedThisTurn[j].target == "e1")
						{
							e1.playerHP -= skillsUsedThisTurn[j].damage;
						}
						if (skillsUsedThisTurn[j].target == "e2")
						{
							e2.playerHP -= skillsUsedThisTurn[j].damage;
						}
						if (skillsUsedThisTurn[j].target == "e3")
						{
							e3.playerHP -= skillsUsedThisTurn[j].damage;
						}
						skillsUsedThisTurn[j].callTextDisplay();
					}
					animationStatus = 0;
					animationDoOnce = true;
					break;
				case 600:
					//trace ("Animations occur here");
					//p1hp.text = p1.playerHP.toString();
					//p2hp.text = p2.playerHP.toString();
					//p3hp.text = p3.playerHP.toString();
					//e1hp.text = e1.playerHP.toString();
					//e2hp.text = e2.playerHP.toString();
					//e3hp.text = e3.playerHP.toString();
	
					if (FlxG.keys.justReleased("SPACE")) // lets the user press the space bar to continue viewing what happened
					{
						++animationStatus;
						animationDoOnce = true;
						
						if (animationStatus == animationThisTurn.length)
						{
							turn = 700;
							topBarText.text = "antob says hi?";
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
						animationDoOnce = false;
					}

					break;
				case 700:
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
					turn = 100;
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
					arrowSprite.x = guiText1.x - 100;
					arrowSprite.y = guiText1.y;
				break;
			case 2:
					arrowSprite.visible = true;
					arrowSprite.x = guiText2.x - 100;
					arrowSprite.y = guiText2.y;
				break;				
			case 3:
					arrowSprite.visible = true;
					arrowSprite.x = guiText3.x - 100;
					arrowSprite.y = guiText3.y;
				break;
			case 4:
					arrowSprite.visible = true;
					arrowSprite.x = guiText4.x - 100;
					arrowSprite.y = guiText4.y;
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
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);
						break;
					case "Magic Missile":
						tmp = new MagicMissle;
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);
						break;
					case "Fire Arrow":
						tmp = new ArrowShot;
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);
						break;
					case "Blizzard":
						tmp = new Blizzard;
						myMovieClip = new FlxMovieClip(200, 150);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);
					break;
					
					case "Star Frost":
						tmp = new StarFrost;
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);
					break;
					
					case  "Crystallic Shield":
						tmp = new CrystallicShield;
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);						
						break;
					case "Frost Dispel":
						tmp = new FrostDispel;
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);					
						break;
					case "Torrent Slash":
						tmp = new TorrentSlash;
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);						
						break;
					case "Piercing Flames":
						tmp = new PiercingFlames;
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);
						break;
					case "Hellfire":
						tmp = new HellFire;
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);						
						break;
					case "Lava Claws":
						tmp = new LavaStrike;
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);						
						break;
					case "Roaring Flare":
						tmp = new RoaringFlare;
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);					
						break;
					case "Fireball":
						tmp = new Fireball;
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);				
						break;
					case "Whirlwind Gale":
						tmp = new WhirlwindGale;
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);				
						break;
					case "Feather Dance":
						tmp = new FeatherDance;
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);			
						break;
					case "Shooting Star":
						tmp = new ShootingStar;
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);					
						break;
					case "Healing Winds":
						tmp = new HealingWinds;
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);						
						break;
					case "Sacred Wish":
						tmp = new SacredWish;
						myMovieClip = new FlxMovieClip(400,300);
						myMovieClip.loadMovieClip(tmp, tmp.width, tmp.height, false, true);
						if (object.caster.charAt(0) == "e")
						{
							myMovieClip.scale.x = -myMovieClip.scale.x;
							myMovieClip.x = 400;
						}
						add(myMovieClip);						
						break;
					default:
						trace("ERROR! - Skill not found - ",object.skillName);
						break;
						
					/*
				}
	   public static var listOfSkills:Array = new Array("Swipe", "Magic Missile","Fire Arrow" ,"Blizzard",
														"Star Frost", "Crystallic Shield", "Frost Dispel",
														 "Torrent Slash", "Piercing Flames", "Hellfire", "Lava Claws",
														 "Roaring Flare", "Fireball", "Whirlwind Gale", "Feather Dance",
														 "Shooting Star", "Healing Winds", "Sacred Wish");
														 
					 */
				}
				//myMovieClip = new CrystallicShield();
				//myMovieClip.x = 200;
				//myMovieClip.y = 400;
				
			}
	}

}