package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Anton Yip
	 */
	public class PlayerCreation extends FlxState 
	{
		private var text:FlxText = new FlxText(300, 20, 600, " ");
		private var text1:FlxText = new FlxText(141-100, 390-5, 200, "Select A Character");
		private var text2:FlxText = new FlxText(390-100, 390-5, 200, "Select A Character");
		private var text3:FlxText = new FlxText(650-100, 390-5, 200, "Select A Character");
		private var text4:FlxText = new FlxText(300, 20, 600, "Select A Character");
		
		private var char1:FlxSprite = new FlxSprite(63, 73, Assets.mageSpriteMale);
		private var char2:FlxSprite = new FlxSprite(315, 73, Assets.archerSpriteMale);
		private var char3:FlxSprite = new FlxSprite(568, 73, Assets.mageSpriteFemale);
		private var char4:FlxSprite = new FlxSprite(0, 300, Assets.testImage3);
		
		private var char1Name:FlxText 	 = new FlxText(51, 245-7, 200, "");
		private var char1HP:FlxText		 = new FlxText(51, 260-7, 200, "");
		private var char1pAttack:FlxText = new FlxText(51, 275-7, 200, "");
		private var char1sAttack:FlxText = new FlxText(51, 290-7, 200, "");
		private var char1pDef:FlxText	 = new FlxText(51, 305-7, 200, "");
		private var char1sDef:FlxText 	 = new FlxText(51, 320-7, 200, "");
		private var char1speed:FlxText 	 = new FlxText(51, 335 - 7, 200, "");
		
		private var char2Name:FlxText 	 = new FlxText(295, 245-7, 200, "");
		private var char2HP:FlxText		 = new FlxText(295, 260-7, 200, "");
		private var char2pAttack:FlxText = new FlxText(295, 275-7, 200, "");
		private var char2sAttack:FlxText = new FlxText(295, 290-7, 200, "");
		private var char2pDef:FlxText	 = new FlxText(295, 305-7, 200, "");
		private var char2sDef:FlxText 	 = new FlxText(295, 320-7, 200, "");
		private var char2speed:FlxText 	 = new FlxText(295, 335 - 7, 200, "");
		
		private var char3Name:FlxText 	 = new FlxText(525, 245-7, 200, "");
		private var char3HP:FlxText		 = new FlxText(525, 260-7, 200, "");
		private var char3pAttack:FlxText = new FlxText(525, 275-7, 200, "");
		private var char3sAttack:FlxText = new FlxText(525, 290-7, 200, "");
		private var char3pDef:FlxText	 = new FlxText(525, 305-7, 200, "");
		private var char3sDef:FlxText 	 = new FlxText(525, 320-7, 200, "");
		private var char3speed:FlxText 	 = new FlxText(525, 335-7, 200, "");
		                                                    
		private var p1text:FlxText  = new FlxText(100, 488, 600, "");
		private var p1text1:FlxText = new FlxText(100, 506, 600, "");
		private var p1text2:FlxText = new FlxText(100, 528, 600, "");
		private var p1text3:FlxText = new FlxText(100, 550, 600, "");
		private var p1text4:FlxText = new FlxText(100, 571, 600, "");
		
		private var p2text:FlxText  = new FlxText(344, 488, 600, "");
		private var p2text1:FlxText = new FlxText(344, 506, 600, "");
		private var p2text2:FlxText = new FlxText(344, 528, 600, "");
		private var p2text3:FlxText = new FlxText(344, 550, 600, "");
		private var p2text4:FlxText = new FlxText(344, 571, 600, "");
		
		private var p3text:FlxText  = new FlxText(610, 488, 600, "");
		private var p3text1:FlxText = new FlxText(610, 506, 600, "");
		private var p3text2:FlxText = new FlxText(610, 528, 600, "");
		private var p3text3:FlxText = new FlxText(610, 550, 600, "");
		private var p3text4:FlxText = new FlxText(610, 571, 600, "");
		
		private var arrowSprite:FlxSprite = new FlxSprite(0, 0, Assets.arrowSprite);
		private var turn:int = 0;
		private var selector:int = 1;
		
		private var deckOfSkills:Array = new Array();
		private var deckOfCharacters:Array = new Array();
		private var skillPos:int;
		
		private var background:FlxSprite = new FlxSprite(0, 0, Assets.playerSelectBackground);
		private var tempCharacterForUpdate:CharacterClass = new CharacterClass();
		
		public function updateCharacterImages():void
		{
			tempCharacterForUpdate.changeCharTo(text1.text);
			//trace(text1.text);
			char1.loadGraphic(tempCharacterForUpdate.bigCharacter);
			//remove(char1);
			//char1 = null;
			//char1 = new FlxSprite(63, 73,  tempCharacterForUpdate.bigCharacter);
			//add(char1);
			tempCharacterForUpdate.changeCharTo(text2.text);
			//trace(text2.text);
			char2.loadGraphic(tempCharacterForUpdate.bigCharacter);
			//remove(char2);
			//char2 = null;
			//char2 = new FlxSprite(315, 73, tempCharacterForUpdate.bigCharacter);
			//add(char2);
			tempCharacterForUpdate.changeCharTo(text3.text);
			//trace(text3.text);
			char3.loadGraphic(tempCharacterForUpdate.bigCharacter);
			//remove(char3);
			//char3 = null;
			//char3 = new FlxSprite(568, 73, tempCharacterForUpdate.bigCharacter);
			//add(char3);
		}
		
		// do once when come into game
		public override function create():void
		{
			add(background);

			add(text);
			add(text1);
			add(text2);
			add(text3);
			add(char1);
			add(char2);
			add(char3);
			//add(arrowSprite);
			
			add(p1text);
			add(p1text1);
			add(p1text2);
			add(p1text3);
			add(p1text4);
			add(p2text);
			add(p2text1);
			add(p2text2);
			add(p2text3);
			add(p2text4);
			add(p3text);
			add(p3text1);
			add(p3text2);
			add(p3text3);
			add(p3text4);
			
			text1.alignment = "center";
			text2.alignment = "center";
			text3.alignment = "center";
			
			char1Name.alignment = "center";
			char1HP.alignment = "center";
			char1pAttack.alignment = "center";
			char1sAttack.alignment = "center";
			char1pDef.alignment = "center";
			char1sDef.alignment = "center";
			char1speed.alignment = "center";
			
			char2Name.alignment = "center";
			char2HP.alignment = "center";
			char2pAttack.alignment = "center";
			char2sAttack.alignment = "center";
			char2pDef.alignment = "center";
			char2sDef.alignment = "center";
			char2speed.alignment = "center";
			
			char3Name.alignment = "center";
			char3HP.alignment = "center";
			char3pAttack.alignment = "center";
			char3sAttack.alignment = "center";
			char3pDef.alignment = "center";
			char3sDef.alignment = "center";
			char3speed.alignment = "center";
			
			char1Name.text = " ";
			char1HP.text = "Health Points: 100";
			char1pAttack.text = "Physical Atk: 50";
			char1sAttack.text = "Special Atk: 50";
			char1pDef.text = "Physical Def: 50";
			char1sDef.text = "Special Def: 50";
			char1speed.text = "Speed: 50";
			
			char2Name.text = " ";
			char2HP.text = "Health Points: 100";
			char2pAttack.text = "Physical Atk: 50";
			char2sAttack.text = "Special Atk: 50";
			char2pDef.text = "Physical Def: 50";
			char2sDef.text = "Special Def: 50";
			char2speed.text = "Speed: 50";
			
			char3Name.text = " ";
			char3HP.text = "Health Points: 100";
			char3pAttack.text = "Physical Atk: 50";
			char3sAttack.text = "Special Atk: 50";
			char3pDef.text = "Physical Def: 50";
			char3sDef.text = "Special Def: 50";
			char3speed.text = "Speed: 50";
			
			add(char1Name);
			add(char1HP);
			add(char1pAttack);
			add(char1sAttack);
			add(char1pDef);
			add(char1sDef);
			add(char1speed);
			
			add(char2Name);
			add(char2HP);
			add(char2pAttack);
			add(char2sAttack);
			add(char2pDef);
			add(char2sDef);
			add(char2speed);
			
			add(char3Name);
			add(char3HP);
			add(char3pAttack);
			add(char3sAttack);
			add(char3pDef);
			add(char3sDef);
			add(char3speed);
			
			// forming the decks
			for (var i:int = 0; i < CharacterClass.listOfCharacters.length; i++) 
			{
				deckOfCharacters.push(CharacterClass.listOfCharacters[i]);
			}
			
			// forming the skill
			for (var j:int = 0; j < SkillClass.listOfSkills.length; j++) 
			{
				deckOfSkills.push(SkillClass.listOfSkills[j]);
			}			
			
		}
		
		private function randomSkills():void 
		{
			skillPos = Globals.randomInt(0, deckOfSkills.length);
			text1.text = deckOfSkills[skillPos];
			
			skillPos = Globals.randomInt(0, deckOfSkills.length);
			text2.text = deckOfSkills[skillPos];
			
			skillPos = Globals.randomInt(0, deckOfSkills.length);
			text3.text = deckOfSkills[skillPos];
			
			skillPos = Globals.randomInt(0, deckOfSkills.length);
			text4.text = deckOfSkills[skillPos];
		}
		
		public override function update():void
		{
			switch(turn)
			{
				case 0:
					// game start
					trace("Start Game");
					selector = 1;
					turn = 50;
					break;
				case 50:
					turn = 100;
					skillPos = Globals.randomInt(0, deckOfCharacters.length);
					text1.text = deckOfCharacters[skillPos];
					deckOfCharacters.splice(skillPos, 1);
					
					skillPos = Globals.randomInt(0, deckOfCharacters.length);
					text2.text = deckOfCharacters[skillPos];
					deckOfCharacters.splice(skillPos, 1);
					
					skillPos = Globals.randomInt(0, deckOfCharacters.length);
					text3.text = deckOfCharacters[skillPos];
					deckOfCharacters.splice(skillPos, 1);
					trace("First Char");
					updateCharacterImages();
					break;
				case 100:
					// pick first character
					switch (selector) 
					{
						case 1:
							arrowSprite.x = char1.x;
							arrowSprite.y = char1.y - 100;
							char1.flicker(-1);
							char2.flicker(0);
							char3.flicker(0);
						break;
						case 2:
							arrowSprite.x = char2.x;
							arrowSprite.y = char2.y - 100;
							char2.flicker(-1);
							char1.flicker(0);
							char3.flicker(0);
						break;
						case 3:
							arrowSprite.x = char3.x;
							arrowSprite.y = char3.y - 100;
							char3.flicker(-1);
							char1.flicker(0);
							char2.flicker(0);							
						break;						
					}
					
					// handle inputs WS
					if (FlxG.keys.justReleased("A"))
					{
						if (selector > 1)
							selector --;
					}
					if (FlxG.keys.justReleased("D"))
					{
						if (selector < 3)
							selector++;
					}
					if (FlxG.keys.justReleased("SPACE"))
					{
						
						switch (selector)
						{
							case 1:
								Globals.p1.changeCharTo(text1.text);
							break;
							case 2:
								Globals.p1.changeCharTo(text2.text);
							break;
							case 3:
								Globals.p1.changeCharTo(text3.text);
								break;
							default:
								trace("Something went wrong, Player Creation case 100");
						}
						
						p1text.text = Globals.p1.name;
						p1text1.text = Globals.p1.playerSkill1.name;
						
						trace("SecondChar");
						turn = 200;
						
						skillPos = Globals.randomInt(0, deckOfCharacters.length);
						text1.text = deckOfCharacters[skillPos];
						deckOfCharacters.splice(skillPos, 1);
						
						skillPos = Globals.randomInt(0, deckOfCharacters.length);
						text2.text = deckOfCharacters[skillPos];
						deckOfCharacters.splice(skillPos, 1);
						
						skillPos = Globals.randomInt(0, deckOfCharacters.length);
						text3.text = deckOfCharacters[skillPos];
						deckOfCharacters.splice(skillPos, 1);
						updateCharacterImages();
					}
					
					break;
				case 110:
					// pick first character skill 1
					// handle inputs WS
					if (FlxG.keys.justReleased("A"))
					{
						if (selector > 1)
							selector --;
					}
					if (FlxG.keys.justReleased("D"))
					{
						if (selector < 4)
							selector++;
					}
					if (FlxG.keys.justReleased("SPACE"))
					{
						switch (selector)
						{
							case 1:
								Globals.p1.playerSkill2.changeSkillTo(text1.text);
							break;
							case 2:
								Globals.p1.playerSkill2.changeSkillTo(text2.text);
							break;
							case 3:
								Globals.p1.playerSkill2.changeSkillTo(text3.text);
								break;
							case 4:
								Globals.p1.playerSkill2.changeSkillTo(text4.text);
								break;										
							default:
								trace("Something went wrong, Player Creation case 110");
						}
						
						p1text2.text = Globals.p1.playerSkill2.name;
						
						turn = 120;
						trace("First Char Skill 2");
						randomSkills();
					}
					switch (selector) 
					{
						case 1:
							arrowSprite.x = char1.x;
							arrowSprite.y = char1.y - 100;
						break;
						case 2:
							arrowSprite.x = char2.x;
							arrowSprite.y = char2.y - 100;
						break;
						case 3:
							arrowSprite.x = char3.x;
							arrowSprite.y = char3.y - 100;
							break;
						case 4:
							arrowSprite.x = char4.x;
							arrowSprite.y = char4.y - 100;
						break;						
					}
					break;
				case 120:
					// pick first character skill 2
					// handle inputs WS
					if (FlxG.keys.justReleased("A"))
					{
						if (selector > 1)
							selector --;
					}
					if (FlxG.keys.justReleased("D"))
					{
						if (selector < 4)
							selector++;
					}
					if (FlxG.keys.justReleased("SPACE"))
					{
						switch (selector)
						{
							case 1:
								Globals.p1.playerSkill3.changeSkillTo(text1.text);
							break;
							case 2:
								Globals.p1.playerSkill3.changeSkillTo(text2.text);
							break;
							case 3:
								Globals.p1.playerSkill3.changeSkillTo(text3.text);
								break;
							case 4:
								Globals.p1.playerSkill3.changeSkillTo(text4.text);
								break;										
							default:
								trace("Something went wrong, Player Creation case 110");
						}
						p1text3.text = Globals.p1.playerSkill3.name;
						
						turn = 130;
						trace("First Char Skill 3");
						randomSkills();
					}
					switch (selector) 
					{
						case 1:
							arrowSprite.x = char1.x;
							arrowSprite.y = char1.y - 100;
						break;
						case 2:
							arrowSprite.x = char2.x;
							arrowSprite.y = char2.y - 100;
						break;
						case 3:
							arrowSprite.x = char3.x;
							arrowSprite.y = char3.y - 100;
							break;
						case 4:
							arrowSprite.x = char4.x;
							arrowSprite.y = char4.y - 100;
						break;						
					}					
					break;
				case 130:
					// pick first character skill 3
					// handle inputs WS
					if (FlxG.keys.justReleased("A"))
					{
						if (selector > 1)
							selector --;
					}
					if (FlxG.keys.justReleased("D"))
					{
						if (selector < 4)
							selector++;
					}
					if (FlxG.keys.justReleased("SPACE"))
					{
						switch (selector)
						{
							case 1:
								Globals.p1.playerSkill4.changeSkillTo(text1.text);
								break;
							case 2:
								Globals.p1.playerSkill4.changeSkillTo(text2.text);
								break;
							case 3:
								Globals.p1.playerSkill4.changeSkillTo(text3.text);
								break;
							case 4:
								Globals.p1.playerSkill4.changeSkillTo(text4.text);
								break;								
							default:
								trace("Something went wrong, Player Creation case 110 - selector: ", selector);
						}
									
						p1text4.text = Globals.p1.playerSkill4.name;
						turn = 210;
						trace("Second Char Skill 1");
						randomSkills();
					}
					switch (selector) 
					{
						case 1:
							arrowSprite.x = char1.x;
							arrowSprite.y = char1.y - 100;
						break;
						case 2:
							arrowSprite.x = char2.x;
							arrowSprite.y = char2.y - 100;
						break;
						case 3:
							arrowSprite.x = char3.x;
							arrowSprite.y = char3.y - 100;
							break;
						case 4:
							arrowSprite.x = char4.x;
							arrowSprite.y = char4.y - 100;
						break;						
					}					
					break;
					
				case 200:
					// pick second character
					
					switch (selector) 
					{
						case 1:
							arrowSprite.x = char1.x;
							arrowSprite.y = char1.y - 100;
							char1.flicker(-1);
							char2.flicker(0);
							char3.flicker(0);
						break;
						case 2:
							arrowSprite.x = char2.x;
							arrowSprite.y = char2.y - 100;
							char2.flicker(-1);
							char1.flicker(0);
							char3.flicker(0);							
						break;
						case 3:
							arrowSprite.x = char3.x;
							arrowSprite.y = char3.y - 100;
							char3.flicker(-1);
							char2.flicker(0);
							char1.flicker(0);							
						break;						
					}
					
					// handle inputs WS
					if (FlxG.keys.justReleased("A"))
					{
						if (selector > 1)
							selector --;
					}
					if (FlxG.keys.justReleased("D"))
					{
						if (selector < 3)
							selector++;
					}
					if (FlxG.keys.justReleased("SPACE"))
					{
						switch (selector)
						{
							case 1:
								Globals.p2.changeCharTo(text1.text);
							break;
							case 2:
								Globals.p2.changeCharTo(text2.text);
							break;
							case 3:
								Globals.p2.changeCharTo(text3.text);
								break;									
							default:
								trace("Something went wrong, Player Creation case 200");
						}						
						trace("Third Char");
						
						p2text.text = Globals.p2.name;
						p2text1.text = Globals.p2.playerSkill1.name;
						turn = 300;
						skillPos = Globals.randomInt(0, deckOfCharacters.length);
						text1.text = deckOfCharacters[skillPos];
						deckOfCharacters.splice(skillPos, 1);
						
						skillPos = Globals.randomInt(0, deckOfCharacters.length);
						text2.text = deckOfCharacters[skillPos];
						deckOfCharacters.splice(skillPos, 1);
						
						skillPos = Globals.randomInt(0, deckOfCharacters.length);
						text3.text = deckOfCharacters[skillPos];
						deckOfCharacters.splice(skillPos, 1);
						updateCharacterImages();

					}
					break;
				case 210:
					// pick second character skill 1
					
					// handle inputs WS
					if (FlxG.keys.justReleased("A"))
					{
						if (selector > 1)
							selector --;
					}
					if (FlxG.keys.justReleased("D"))
					{
						if (selector < 4)
							selector++;
					}
					if (FlxG.keys.justReleased("SPACE"))
					{
						switch (selector)
						{
							case 1:
								Globals.p2.playerSkill2.changeSkillTo(text1.text);
							break;
							case 2:
								Globals.p2.playerSkill2.changeSkillTo(text2.text);
							break;
							case 3:
								Globals.p2.playerSkill2.changeSkillTo(text3.text);
								break;
							case 4:
								Globals.p2.playerSkill2.changeSkillTo(text4.text);
								break;								
							default:
								trace("Something went wrong, Player Creation case 110");
						}
						
						p2text2.text = Globals.p2.playerSkill2.name;
						turn = 220;
						trace("Second Char Skill 2");
						randomSkills();
					}
					switch (selector) 
					{
						case 1:
							arrowSprite.x = char1.x;
							arrowSprite.y = char1.y - 100;
						break;
						case 2:
							arrowSprite.x = char2.x;
							arrowSprite.y = char2.y - 100;
						break;
						case 3:
							arrowSprite.x = char3.x;
							arrowSprite.y = char3.y - 100;
							break;
						case 4:
							arrowSprite.x = char4.x;
							arrowSprite.y = char4.y - 100;
						break;						
					}					
					break;
				case 220:
					// pick second character skill 2
					
					// handle inputs WS
					if (FlxG.keys.justReleased("A"))
					{
						if (selector > 1)
							selector --;
					}
					if (FlxG.keys.justReleased("D"))
					{
						if (selector < 4)
							selector++;
					}
					if (FlxG.keys.justReleased("SPACE"))
					{
						switch (selector)
						{
							case 1:
								Globals.p2.playerSkill3.changeSkillTo(text1.text);
							break;
							case 2:
								Globals.p2.playerSkill3.changeSkillTo(text2.text);
							break;
							case 3:
								Globals.p2.playerSkill3.changeSkillTo(text3.text);
								break;
							case 4:
								Globals.p2.playerSkill3.changeSkillTo(text4.text);
								break;										
							default:
								trace("Something went wrong, Player Creation case 110");
						}
						p2text3.text = Globals.p2.playerSkill3.name;
						turn = 230;
						trace("Second Char Skill 3");
						randomSkills();
					}
					switch (selector) 
					{
						case 1:
							arrowSprite.x = char1.x;
							arrowSprite.y = char1.y - 100;
						break;
						case 2:
							arrowSprite.x = char2.x;
							arrowSprite.y = char2.y - 100;
						break;
						case 3:
							arrowSprite.x = char3.x;
							arrowSprite.y = char3.y - 100;
							break;
						case 4:
							arrowSprite.x = char4.x;
							arrowSprite.y = char4.y - 100;
						break;						
					}					
					break;
				case 230:
					// pick second character skill 3
					
					// handle inputs WS
					if (FlxG.keys.justReleased("A"))
					{
						if (selector > 1)
							selector --;
					}
					if (FlxG.keys.justReleased("D"))
					{
						if (selector < 4)
							selector++;
					}
					if (FlxG.keys.justReleased("SPACE"))
					{
						switch (selector)
						{
							case 1:
								Globals.p2.playerSkill4.changeSkillTo(text1.text);
							break;
							case 2:
								Globals.p2.playerSkill4.changeSkillTo(text2.text);
							break;
							case 3:
								Globals.p2.playerSkill4.changeSkillTo(text3.text);
								break;
							case 4:
								Globals.p2.playerSkill4.changeSkillTo(text4.text);
								break;										
							default:
								trace("Something went wrong, Player Creation case 110");
						}
						
						p2text4.text = Globals.p2.playerSkill4.name;
						turn = 310;
						trace("Third Char Skill 1");
						randomSkills();
					}
					switch (selector) 
					{
						case 1:
							arrowSprite.x = char1.x;
							arrowSprite.y = char1.y - 100;
						break;
						case 2:
							arrowSprite.x = char2.x;
							arrowSprite.y = char2.y - 100;
						break;
						case 3:
							arrowSprite.x = char3.x;
							arrowSprite.y = char3.y - 100;
							break;
						case 4:
							arrowSprite.x = char4.x;
							arrowSprite.y = char4.y - 100;
						break;						
					}					
					break;
					
				case 300:
					// pick third character
					switch (selector) 
					{
						case 1:
							arrowSprite.x = char1.x;
							arrowSprite.y = char1.y - 100;
							char1.flicker(-1);
							char2.flicker(0);
							char3.flicker(0);							
						break;
						case 2:
							arrowSprite.x = char2.x;
							arrowSprite.y = char2.y - 100;
							char2.flicker(-1);
							char1.flicker(0);
							char3.flicker(0);							
						break;
						case 3:
							arrowSprite.x = char3.x;
							arrowSprite.y = char3.y - 100;
							char3.flicker(-1);
							char2.flicker(0);
							char1.flicker(0);							
						break;						
					}
					
					// handle inputs WS
					if (FlxG.keys.justReleased("A"))
					{
						if (selector > 1)
							selector --;
					}
					if (FlxG.keys.justReleased("D"))
					{
						if (selector < 3)
							selector++;
					}
					if (FlxG.keys.justReleased("SPACE"))
					{
						switch (selector)
						{
							case 1:
								Globals.p3.changeCharTo(text1.text);
							break;
							case 2:
								Globals.p3.changeCharTo(text2.text);
							break;
							case 3:
								Globals.p3.changeCharTo(text3.text);
								break;
							default:
								trace("Something went wrong, Player Creation case 300");
						}
						p3text.text = Globals.p3.name;
						p3text1.text = Globals.p3.playerSkill1.name;
						
						trace("First Char Skill 1");
						turn = 110;
						char1.x = 50;
						char2.x = 250;
						char3.x = 450;
						char4.x = 650;
						add(char4);
						add(text4);
						text1.x = char1.x;
						text1.y = char1.y - 100;
						text2.x = char2.x;
						text2.y = char2.y - 100;
						text3.x = char3.x;
						text3.y = char3.y - 100;
						text4.x = char4.x;
						text4.y = char4.y - 100;
						randomSkills();
						

					}
					break;
				case 310:
					// pick third character skill 1
					
					// handle inputs WS
					if (FlxG.keys.justReleased("A"))
					{
						if (selector > 1)
							selector --;
					}
					if (FlxG.keys.justReleased("D"))
					{
						if (selector < 4)
							selector++;
					}
					if (FlxG.keys.justReleased("SPACE"))
					{
						switch (selector)
						{
							case 1:
								Globals.p3.playerSkill2.changeSkillTo(text1.text);
							break;
							case 2:
								Globals.p3.playerSkill2.changeSkillTo(text2.text);
							break;
							case 3:
								Globals.p3.playerSkill2.changeSkillTo(text3.text);
								break;
							case 4:
								Globals.p3.playerSkill2.changeSkillTo(text4.text);
								break;										
							default:
								trace("Something went wrong, Player Creation case 110");
						}
						p3text2.text = Globals.p3.playerSkill2.name;
						turn = 320;
						trace("Third Char Skill 2");
						randomSkills();
					}
					switch (selector) 
					{
						case 1:
							arrowSprite.x = char1.x;
							arrowSprite.y = char1.y - 100;
						break;
						case 2:
							arrowSprite.x = char2.x;
							arrowSprite.y = char2.y - 100;
						break;
						case 3:
							arrowSprite.x = char3.x;
							arrowSprite.y = char3.y - 100;
							break;
						case 4:
							arrowSprite.x = char4.x;
							arrowSprite.y = char4.y - 100;
						break;						
					}					
					break;
				case 320:
					// pick third character skill 2
					// handle inputs WS
					if (FlxG.keys.justReleased("A"))
					{
						if (selector > 1)
							selector --;
					}
					if (FlxG.keys.justReleased("D"))
					{
						if (selector < 4)
							selector++;
					}
					if (FlxG.keys.justReleased("SPACE"))
					{
						switch (selector)
						{
							case 1:
								Globals.p3.playerSkill3.changeSkillTo(text1.text);
							break;
							case 2:
								Globals.p3.playerSkill3.changeSkillTo(text2.text);
							break;
							case 3:
								Globals.p3.playerSkill3.changeSkillTo(text3.text);
								break;
							case 4:
								Globals.p3.playerSkill3.changeSkillTo(text4.text);
								break;										
							default:
								trace("Something went wrong, Player Creation case 110");
						}
						p3text3.text = Globals.p3.playerSkill3.name;
						turn = 330;
						trace("Third Char Skill 3");
						randomSkills();
					}
					switch (selector) 
					{
						case 1:
							arrowSprite.x = char1.x;
							arrowSprite.y = char1.y - 100;
						break;
						case 2:
							arrowSprite.x = char2.x;
							arrowSprite.y = char2.y - 100;
						break;
						case 3:
							arrowSprite.x = char3.x;
							arrowSprite.y = char3.y - 100;
							break;
						case 4:
							arrowSprite.x = char4.x;
							arrowSprite.y = char4.y - 100;
						break;						
					}					
					break;
				case 330:
					// pick third character skill 3
					// handle inputs WS
					if (FlxG.keys.justReleased("A"))
					{
						if (selector > 1)
							selector --;
					}
					if (FlxG.keys.justReleased("D"))
					{
						if (selector < 4)
							selector++;
					}
					if (FlxG.keys.justReleased("SPACE"))
					{
						switch (selector)
						{
							case 1:
								Globals.p3.playerSkill4.changeSkillTo(text1.text);
							break;
							case 2:
								Globals.p3.playerSkill4.changeSkillTo(text2.text);
							break;
							case 3:
								Globals.p3.playerSkill4.changeSkillTo(text3.text);
								break;
							case 4:
								Globals.p3.playerSkill4.changeSkillTo(text4.text);
								break;										
							default:
								trace("Something went wrong, Player Creation case 110");
						}
						
						p3text4.text = Globals.p3.playerSkill4.name;
						turn = 400;
						remove(char1);
						remove(char2);
						remove(char3);
						remove(char4);
						
						remove(text1);
						remove(text2);
						remove(text3);
						remove(text4);
						
						text.text = "Press Space to Start Battle";
						remove(arrowSprite);
						trace("READY to Go");
						
						// TODO:
						// Show final party composition
					}
					switch (selector) 
					{
						case 1:
							arrowSprite.x = char1.x;
							arrowSprite.y = char1.y - 100;
						break;
						case 2:
							arrowSprite.x = char2.x;
							arrowSprite.y = char2.y - 100;
						break;
						case 3:
							arrowSprite.x = char3.x;
							arrowSprite.y = char3.y - 100;
							break;
						case 4:
							arrowSprite.x = char4.x;
							arrowSprite.y = char4.y - 100;
						break;						
					}					
					break;					
					
				case 400:
					
					if (FlxG.keys.justReleased("SPACE"))
					{
						FlxG.switchState(new GameLevel);
					}
					break;
				default:
					trace("PlayerCreation - This shouldn't happen");
				
			}
		}
	}

}
