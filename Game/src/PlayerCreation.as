package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Anton Yip
	 */
	public class PlayerCreation extends FlxState 
	{
		private var text:FlxText = new FlxText(300, 20, 600, "Select A Character");
		private var text1:FlxText = new FlxText(141-100, 390-5, 200, "Select A Character");
		private var text2:FlxText = new FlxText(390-100, 390-5, 200, "Select A Character");
		private var text3:FlxText = new FlxText(650-100, 390-5, 200, "Select A Character");
		private var text4:FlxText = new FlxText(300, 20, 600, "Select A Character");
		
		private var char1:FlxSprite = new FlxSprite(63, 73, Assets.mageSpriteMale);
		private var char2:FlxSprite = new FlxSprite(315, 73, Assets.archerSpriteMale);
		private var char3:FlxSprite = new FlxSprite(568, 73, Assets.mageSpriteFemale);
		private var char4:FlxSprite = new FlxSprite(0, 300, Assets.testImage3);
		
		private var p1text:FlxText = new FlxText(200, 400, 600, "");
		private var p1text1:FlxText = new FlxText(200, 420, 600, "");
		private var p1text2:FlxText = new FlxText(200, 440, 600, "");
		private var p1text3:FlxText = new FlxText(200, 460, 600, "");
		private var p1text4:FlxText = new FlxText(200, 480, 600, "");
		
		private var p2text:FlxText = new FlxText(400, 400, 600, "");
		private var p2text1:FlxText = new FlxText(400, 420, 600, "");
		private var p2text2:FlxText = new FlxText(400, 440, 600, "");
		private var p2text3:FlxText = new FlxText(400, 460, 600, "");
		private var p2text4:FlxText = new FlxText(400, 480, 600, "");
		
		private var p3text:FlxText = new FlxText(600, 400, 600, "");
		private var p3text1:FlxText = new FlxText(600, 420, 600, "");
		private var p3text2:FlxText = new FlxText(600, 440, 600, "");
		private var p3text3:FlxText = new FlxText(600, 460, 600, "");
		private var p3text4:FlxText = new FlxText(600, 480, 600, "");
		
		private var arrowSprite:FlxSprite = new FlxSprite(0, 0, Assets.arrowSprite);
		private var turn:int = 0;
		private var selector:int = 1;
		
		private var deckOfSkills:Array = new Array();
		private var deckOfCharacters:Array = new Array();
		private var skillPos:int;
		
		private var background:FlxSprite = new FlxSprite(0, 0, Assets.playerSelectBackground);
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
			add(arrowSprite);
			
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
			/*
			p1text
			p1text1
			p1text2
			p1text3
			p1text4
			p2text)
			p2text1
			p2text2
			p2text3
			p2text4
			p3text)
			p3text1
			p3text2
			p3text3
			p3text4
			*/
			
			
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
					break;
				case 100:
					// pick first character
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
						break;
						case 2:
							arrowSprite.x = char2.x;
							arrowSprite.y = char2.y - 100;
						break;
						case 3:
							arrowSprite.x = char3.x;
							arrowSprite.y = char3.y - 100;
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
						break;
						case 2:
							arrowSprite.x = char2.x;
							arrowSprite.y = char2.y - 100;
						break;
						case 3:
							arrowSprite.x = char3.x;
							arrowSprite.y = char3.y - 100;
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
