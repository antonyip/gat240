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
		private var text1:FlxText = new FlxText(141-100, 80, 200, "Select A Character");
		private var text2:FlxText = new FlxText(390-100, 80, 200, "Select A Character");
		private var text3:FlxText = new FlxText(650-100, 80, 200, "Select A Character");
		private var text4:FlxText = new FlxText(300, 20, 600, "Select A Character");
		
		private var char1:FlxSprite = new FlxSprite(63, 173, Assets.mageSpriteMale);
		private var char2:FlxSprite = new FlxSprite(315, 173, Assets.archerSpriteMale);
		private var char3:FlxSprite = new FlxSprite(568, 173, Assets.mageSpriteFemale);
		private var char4:FlxSprite = new FlxSprite(0, 300, Assets.testImage3);
		
		private var char1Name:FlxText 		= new FlxText(51, 245-7, 200, "");
		private var char1HP:FlxText			= new FlxText(51, 260-7, 200, "");
		private var char1pAttack:FlxText	= new FlxText(51, 275-7, 200, "");
		private var char1sAttack:FlxText	= new FlxText(51, 290-7, 200, "");
		private var char1pDef:FlxText	 	= new FlxText(51, 305-7, 200, "");
		private var char1sDef:FlxText 		= new FlxText(51, 320-7, 200, "");
		private var char1speed:FlxText 		= new FlxText(51, 335 - 7, 200, "");
		private var char1other1:FlxText 	= new FlxText(51, 350 - 7, 200, "");
		private var char1other2:FlxText 	= new FlxText(51, 365 - 7, 200, "");
		private var char1other3:FlxText 	= new FlxText(51, 380 - 7, 200, "");
		
		private var char2Name:FlxText 	 = new FlxText(295, 245-7, 200, "");
		private var char2HP:FlxText		 = new FlxText(295, 260-7, 200, "");
		private var char2pAttack:FlxText = new FlxText(295, 275-7, 200, "");
		private var char2sAttack:FlxText = new FlxText(295, 290-7, 200, "");
		private var char2pDef:FlxText	 = new FlxText(295, 305-7, 200, "");
		private var char2sDef:FlxText 	 = new FlxText(295, 320-7, 200, "");
		private var char2speed:FlxText 	 = new FlxText(295, 335 - 7, 200, "");
		private var char2other1:FlxText 	= new FlxText(295, 350 - 7, 200, "");
		private var char2other2:FlxText 	= new FlxText(295, 365 - 7, 200, "");
		private var char2other3:FlxText 	= new FlxText(295, 380 - 7, 200, "");
		
		private var char3Name:FlxText 	 = new FlxText(525, 245-7, 200, "");
		private var char3HP:FlxText		 = new FlxText(525, 260-7, 200, "");
		private var char3pAttack:FlxText = new FlxText(525, 275-7, 200, "");
		private var char3sAttack:FlxText = new FlxText(525, 290-7, 200, "");
		private var char3pDef:FlxText	 = new FlxText(525, 305-7, 200, "");
		private var char3sDef:FlxText 	 = new FlxText(525, 320-7, 200, "");
		private var char3speed:FlxText 	 = new FlxText(525, 335 - 7, 200, "");
		private var char3other1:FlxText 	= new FlxText(525, 350 - 7, 200, "");
		private var char3other2:FlxText 	= new FlxText(525, 365 - 7, 200, "");
		private var char3other3:FlxText 	= new FlxText(525, 380 - 7, 200, "");		
		
		private var char4Name:FlxText 	 = new FlxText(525, 245-7, 200, "");
		private var char4HP:FlxText		 = new FlxText(525, 260-7, 200, "");
		private var char4pAttack:FlxText = new FlxText(525, 275-7, 200, "");
		private var char4sAttack:FlxText = new FlxText(525, 290-7, 200, "");
		private var char4pDef:FlxText	 = new FlxText(525, 305-7, 200, "");
		private var char4sDef:FlxText 	 = new FlxText(525, 320-7, 200, "");
		private var char4speed:FlxText 	 = new FlxText(525, 335 - 7, 200, "");
		private var char4other1:FlxText 	= new FlxText(525, 350 - 7, 200, "");
		private var char4other2:FlxText 	= new FlxText(525, 365 - 7, 200, "");
		private var char4other3:FlxText 	= new FlxText(525, 380 - 7, 200, "");		
		                                                    
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
		
		private var arrowSprite:FlxSprite = new FlxSprite(0, 0, Assets.playerSelectArrows);
		private var turn:int = 0;
		private var selector:int = 1;
		
		private var deckOfSkills:Array = new Array();
		private var deckOfCharacters:Array = new Array();
		private var skillPos:int;
		
		private var background:FlxSprite = new FlxSprite(0, 0, Assets.playerSelectBackground);
		private var tempCharacterForUpdate:CharacterClass = new CharacterClass();
		
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
			
			char1Name.alignment = "center";
			char1HP.alignment = "center";
			char1pAttack.alignment = "center";
			char1sAttack.alignment = "center";
			char1pDef.alignment = "center";
			char1sDef.alignment = "center";
			char1speed.alignment = "center";
			char1other1.alignment = "center";
			char1other2.alignment = "center";
			char1other3.alignment = "center";			
			
			char2Name.alignment = "center";
			char2HP.alignment = "center";
			char2pAttack.alignment = "center";
			char2sAttack.alignment = "center";
			char2pDef.alignment = "center";
			char2sDef.alignment = "center";
			char2speed.alignment = "center";
			char2other1.alignment = "center";
			char2other2.alignment = "center";
			char2other3.alignment = "center";						
			
			char3Name.alignment = "center";
			char3HP.alignment = "center";
			char3pAttack.alignment = "center";
			char3sAttack.alignment = "center";
			char3pDef.alignment = "center";
			char3sDef.alignment = "center";
			char3speed.alignment = "center";
			char3other1.alignment = "center";
			char3other2.alignment = "center";
			char3other3.alignment = "center";						
			
			char4Name.alignment = "center";
			char4HP.alignment = "center";
			char4pAttack.alignment = "center";
			char4sAttack.alignment = "center";
			char4pDef.alignment = "center";
			char4sDef.alignment = "center";
			char4speed.alignment = "center";
			char4other1.alignment = "center";
			char4other2.alignment = "center";
			char4other3.alignment = "center";						
			
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
			
			char4Name.text = "";
			char4HP.text = "";
			char4pAttack.text = "";
			char4sAttack.text = "";
			char4pDef.text = "";
			char4sDef.text = "";
			char4speed.text = "";
			
			add(char1Name);
			add(char1HP);
			add(char1pAttack);
			add(char1sAttack);
			add(char1pDef);
			add(char1sDef);
			add(char1speed);
			add(char1other1);
			add(char1other2);
			add(char1other3);			
			
			add(char2Name);
			add(char2HP);
			add(char2pAttack);
			add(char2sAttack);
			add(char2pDef);
			add(char2sDef);
			add(char2speed);
			add(char2other1);
			add(char2other2);
			add(char2other3);				
			
			add(char3Name);
			add(char3HP);
			add(char3pAttack);
			add(char3sAttack);
			add(char3pDef);
			add(char3sDef);
			add(char3speed);
			add(char3other1);
			add(char3other2);
			add(char3other3);				
						
			add(char4Name);
			add(char4HP);
			add(char4pAttack);
			add(char4sAttack);
			add(char4pDef);
			add(char4sDef);
			add(char4speed);
			add(char4other1);
			add(char4other2);
			add(char4other3);				
			
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
		
		public function updateCharacterImages():void
		{
			tempCharacterForUpdate.changeCharTo(text1.text);
			char1.loadGraphic(tempCharacterForUpdate.bigCharacter);
			
			char1HP.text 	  = "HP: " + tempCharacterForUpdate.playerMAXHP;
			char1pAttack.text = "P Atk: " + tempCharacterForUpdate.playerAttackPower;
			char1sAttack.text = "S Atk: " + tempCharacterForUpdate.playerSpecialAttack;
			char1pDef.text    = "P Def: " + tempCharacterForUpdate.playerPhysicalDefense;
			char1sDef.text    = "S Def: " + tempCharacterForUpdate.playerSpecialDefense;
			char1speed.text   = "Speed: " + tempCharacterForUpdate.baseSpeed;
			
			tempCharacterForUpdate.changeCharTo(text2.text);
			char2.loadGraphic(tempCharacterForUpdate.bigCharacter);
			
			char2HP.text 	  = "HP: " + tempCharacterForUpdate.playerMAXHP;
			char2pAttack.text = "P Atk: " + tempCharacterForUpdate.playerAttackPower;
			char2sAttack.text = "S Atk: " + tempCharacterForUpdate.playerSpecialAttack;
			char2pDef.text    = "P Def: " + tempCharacterForUpdate.playerPhysicalDefense;
			char2sDef.text    = "S Def: " + tempCharacterForUpdate.playerSpecialDefense;
			char2speed.text   = "Speed: " + tempCharacterForUpdate.baseSpeed;
			
			tempCharacterForUpdate.changeCharTo(text3.text);
			char3.loadGraphic(tempCharacterForUpdate.bigCharacter);
			
			char3HP.text 	  = "HP: " + tempCharacterForUpdate.playerMAXHP;
			char3pAttack.text = "P Atk: " + tempCharacterForUpdate.playerAttackPower;
			char3sAttack.text = "S Atk: " + tempCharacterForUpdate.playerSpecialAttack;
			char3pDef.text    = "P Def: " + tempCharacterForUpdate.playerPhysicalDefense;
			char3sDef.text    = "S Def: " + tempCharacterForUpdate.playerSpecialDefense;
			char3speed.text   = "Speed: " + tempCharacterForUpdate.baseSpeed;
		}
		
		private function randomSkills():void 
		{
			skillPos = Globals.randomInt(0, deckOfSkills.length);
			text1.text = deckOfSkills[skillPos];
			char1.loadGraphic(Globals.getSkillFromString(text1.text).skillIcon);
			
			char1HP.text 	  = "Element: " 			+ Globals.getSkillFromString(text1.text).type;
			char1other1.text  = "Type: " 				+ Globals.getSkillFromString(text1.text).isPhysical ? "Physical" : "Magical" ;
			char1pAttack.text = "Atk Pwr: " 			+ Globals.getSkillFromString(text1.text).power;
			char1sAttack.text = "Accuracy: " 			+ Globals.getSkillFromString(text1.text).accuracy;
			char1pDef.text    = "Stam: " 				+ Globals.getSkillFromString(text1.text).cost;
			char1sDef.text    = "Targetable: " 			+ Globals.getSkillFromString(text1.text).hasTarget;
			char1speed.text   = "Speed: " 				+ Globals.getSkillFromString(text1.text).speed;
			
			skillPos = Globals.randomInt(0, deckOfSkills.length);
			text2.text = deckOfSkills[skillPos];
			char2.loadGraphic(Globals.getSkillFromString(text2.text).skillIcon);
			
			char2HP.text 	  = "Element: " 			+ Globals.getSkillFromString(text2.text).type;
			char2other1.text  = "Type: " 				+ Globals.getSkillFromString(text2.text).isPhysical ? "Physical" : "Magical" ;
			char2pAttack.text = "Atk Pwr: " 			+ Globals.getSkillFromString(text2.text).power;
			char2sAttack.text = "Accuracy: " 			+ Globals.getSkillFromString(text2.text).accuracy;
			char2pDef.text    = "Stam: " 				+ Globals.getSkillFromString(text2.text).cost;
			char2sDef.text    = "Targetable: " 			+ Globals.getSkillFromString(text2.text).hasTarget;
			char2speed.text   = "Speed: " 				+ Globals.getSkillFromString(text2.text).speed;
			
			skillPos = Globals.randomInt(0, deckOfSkills.length);
			text3.text = deckOfSkills[skillPos];
			char3.loadGraphic(Globals.getSkillFromString(text3.text).skillIcon);
			
			char3HP.text 	  = "Element: " 			+ Globals.getSkillFromString(text3.text).type;
			char3other1.text  = "Type: " 				+ Globals.getSkillFromString(text3.text).isPhysical ? "Physical" : "Magical" ;
			char3pAttack.text = "Atk Pwr: " 			+ Globals.getSkillFromString(text3.text).power;
			char3sAttack.text = "Accuracy: " 			+ Globals.getSkillFromString(text3.text).accuracy;
			char3pDef.text    = "Stam: " 				+ Globals.getSkillFromString(text3.text).cost;
			char3sDef.text    = "Targetable: " 			+ Globals.getSkillFromString(text3.text).hasTarget;
			char3speed.text   = "Speed: " 				+ Globals.getSkillFromString(text3.text).speed;
			
			skillPos = Globals.randomInt(0, deckOfSkills.length);
			text4.text = deckOfSkills[skillPos];
			char4.loadGraphic(Globals.getSkillFromString(text4.text).skillIcon);
			
			char4HP.text 	  = "Element: " 			+ Globals.getSkillFromString(text4.text).type;
			char4other1.text  = "Type: " 				+ Globals.getSkillFromString(text4.text).isPhysical ? "Physical" : "Magical" ;
			char4pAttack.text = "Atk Pwr: " 			+ Globals.getSkillFromString(text4.text).power;
			char4sAttack.text = "Accuracy: " 			+ Globals.getSkillFromString(text4.text).accuracy;
			char4pDef.text    = "Stam: " 				+ Globals.getSkillFromString(text4.text).cost;
			char4sDef.text    = "Targetable: " 			+ Globals.getSkillFromString(text4.text).hasTarget;
			char4speed.text   = "Speed: " 				+ Globals.getSkillFromString(text4.text).speed;
		}
		
		public function updateSelector(selector:int):void
		{
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
		}
		
		public function updateSelectorCharacters(selector:int):void
		{
			switch (selector) 
			{
				case 1:
					arrowSprite.x = 100;
					arrowSprite.y = 50;
				break;
				case 2:
					arrowSprite.x = 300;
					arrowSprite.y = 50;
				break;
				case 3:
					arrowSprite.x = 500;
					arrowSprite.y = 50;
				break;						
			}
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
					updateSelectorCharacters(selector);
					
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
					updateSelector(selector);
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
					updateSelector(selector);				
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
					updateSelector(selector);			
					break;
					
				case 200:
					// pick second character
					updateSelectorCharacters(selector);
					
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
					updateSelector(selector);		
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
					updateSelector(selector);				
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
					updateSelector(selector);				
					break;
					
				case 300:
					// pick third character
					updateSelectorCharacters(selector);
					
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
						background.loadGraphic(Assets.playerSelectBackground2);
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
					updateSelector(selector);				
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
					updateSelector(selector);				
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
						
						background.loadGraphic(Assets.playerSelectBackground);
						
						char4HP.text 	  = "";
						char4other1.text  = "";
						char4pAttack.text = "";
						char4sAttack.text = "";
						char4pDef.text    = "";
						char4sDef.text    = "";
						char4speed.text   = "";
						
						char3HP.text 	  = "";
						char3other1.text  = "";
						char3pAttack.text = "";
						char3sAttack.text = "";
						char3pDef.text    = "";
						char3sDef.text    = "";
						char3speed.text   = "";
						
						char2HP.text 	  = "";
						char2other1.text  = "";
						char2pAttack.text = "";
						char2sAttack.text = "";
						char2pDef.text    = "";
						char2sDef.text    = "";
						char2speed.text   = "";
						
						char1HP.text 	  = "";
						char1other1.text  = "";
						char1pAttack.text = "";
						char1sAttack.text = "";
						char1pDef.text    = "";
						char1sDef.text    = "";
						char1speed.text   = "";
					}
					updateSelector(selector);				
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
