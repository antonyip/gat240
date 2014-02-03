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
		private var text4:FlxText = new FlxText(300,     20, 200, "Select A Character");
		
		private var char1:FlxSprite = new FlxSprite(65, 142, Assets.mageSpriteMale);
		private var char2:FlxSprite = new FlxSprite(318, 142, Assets.archerSpriteMale);
		private var char3:FlxSprite = new FlxSprite(571, 142, Assets.mageSpriteFemale);
		private var char4:FlxSprite = new FlxSprite(0, 300, Assets.testImage3);
		
		private var offsety:Number = 73;
		private var char1Name:FlxText 		= new FlxText(144.5-100, 245 - 7+offsety, 200, "");
		private var char1HP:FlxText			= new FlxText(144.5-100, 260 - 7+offsety, 200, "");
		private var char1pAttack:FlxText	= new FlxText(144.5-100, 275 - 7+offsety, 200, "");
		private var char1sAttack:FlxText	= new FlxText(144.5-100, 290 - 7+offsety, 200, "");
		private var char1pDef:FlxText	 	= new FlxText(144.5-100, 305 - 7+offsety, 200, "");
		private var char1sDef:FlxText 		= new FlxText(144.5-100, 320 - 7+offsety, 200, "");
		private var char1speed:FlxText 		= new FlxText(144.5-100, 335 - 7+offsety, 200, "");
		private var char1other1:FlxText 	= new FlxText(144.5-100, 245 - 7+offsety, 200, "");
		private var char1other2:FlxText 	= new FlxText(144.5-100, 365 - 7+offsety, 200, "");
		private var char1other3:FlxText 	= new FlxText(144.5-100, 380 - 7+offsety, 200, "");
		
		private var char2Name:FlxText 	 	= new FlxText(397.5-100, 245 - 7+offsety, 200, "");
		private var char2HP:FlxText		 	= new FlxText(397.5-100, 260 - 7+offsety, 200, "");
		private var char2pAttack:FlxText 	= new FlxText(397.5-100, 275 - 7+offsety, 200, "");
		private var char2sAttack:FlxText 	= new FlxText(397.5-100, 290 - 7+offsety, 200, "");
		private var char2pDef:FlxText	 	= new FlxText(397.5-100, 305 - 7+offsety, 200, "");
		private var char2sDef:FlxText 	 	= new FlxText(397.5-100, 320 - 7+offsety, 200, "");
		private var char2speed:FlxText 	 	= new FlxText(397.5-100, 335 - 7+offsety, 200, "");
		private var char2other1:FlxText 	= new FlxText(397.5-100, 245 - 7+offsety, 200, "");
		private var char2other2:FlxText 	= new FlxText(397.5-100, 365 - 7+offsety, 200, "");
		private var char2other3:FlxText 	= new FlxText(397.5-100, 380 - 7+offsety, 200, "");
		
		private var char3Name:FlxText 	 	= new FlxText(650.5-100, 245 - 7+offsety, 200, "");
		private var char3HP:FlxText		 	= new FlxText(650.5-100, 260 - 7+offsety, 200, "");
		private var char3pAttack:FlxText 	= new FlxText(650.5-100, 275 - 7+offsety, 200, "");
		private var char3sAttack:FlxText 	= new FlxText(650.5-100, 290 - 7+offsety, 200, "");
		private var char3pDef:FlxText	 	= new FlxText(650.5-100, 305 - 7+offsety, 200, "");
		private var char3sDef:FlxText 	 	= new FlxText(650.5-100, 320 - 7+offsety, 200, "");
		private var char3speed:FlxText 	 	= new FlxText(650.5-100, 335 - 7+offsety, 200, "");
		private var char3other1:FlxText 	= new FlxText(650.5-100, 245 - 7+offsety, 200, "");
		private var char3other2:FlxText 	= new FlxText(650.5-100, 365 - 7+offsety, 200, "");
		private var char3other3:FlxText 	= new FlxText(650.5-100, 380 - 7+offsety, 200, "");
		
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
		                                                    
		private var p1text:FlxText  = new FlxText(100-45+5, 488+20-2, 600, "");
		private var p1text1:FlxText = new FlxText(100+45, 506, 600, "");
		private var p1text2:FlxText = new FlxText(100+45, 528, 600, "");
		private var p1text3:FlxText = new FlxText(100+45, 550, 600, "");
		private var p1text4:FlxText = new FlxText(100+45, 571, 600, "");
		
		private var p2text:FlxText  = new FlxText(344-45+5, 488+20-2, 600, "");
		private var p2text1:FlxText = new FlxText(344+45, 506, 600, "");
		private var p2text2:FlxText = new FlxText(344+45, 528, 600, "");
		private var p2text3:FlxText = new FlxText(344+45, 550, 600, "");
		private var p2text4:FlxText = new FlxText(344+45, 571, 600, "");
		
		private var p3text:FlxText  = new FlxText(610-45+1, 488+20-2, 600, "");
		private var p3text1:FlxText = new FlxText(610+45, 506, 600, "");
		private var p3text2:FlxText = new FlxText(610+45, 528, 600, "");
		private var p3text3:FlxText = new FlxText(610+45, 550, 600, "");
		private var p3text4:FlxText = new FlxText(610+45, 571, 600, "");
		
		private var arrowSprite:FlxSprite = new FlxSprite(0, 0, Assets.playerSelectCharacterArrows);
		private var turn:int = 0;
		private var selector:int = 1;
		
		private var deckOfSkills:Array = new Array();
		private var deckOfCharacters:Array = new Array();
		private var skillPos:int;
		
		private var background:FlxSprite = new FlxSprite(0, 0, Assets.playerSelectBackground);
		
		private var flxHead1:FlxSprite;
		private var flxHead2:FlxSprite;
		private var flxHead3:FlxSprite;
		
		private var tempCharacterForUpdate:CharacterClass = new CharacterClass();
		
		private function repositionText():void
		{
			char1Name       .x  = 105    -100;
			char1HP         .x  = 105    -100;
			char1pAttack	.x  = 105    -100;
			char1sAttack	.x  = 105    -100;
			char1pDef       .x  = 105    -100;
			char1sDef       .x  = 105    -100;
			char1speed      .x  = 105    -100;
			char1other1	    .x  = 105    -100;
			char1other2	    .x  = 105    -100;
			char1other3	    .x  = 105    -100;
                                         
			char2Name       .x  = 301    -100;
			char2HP	        .x  = 301    -100;
			char2pAttack	.x  = 301    -100;
			char2sAttack	.x  = 301    -100;
			char2pDef       .x  = 301    -100;
			char2sDef	    .x  = 301    -100;
			char2speed      .x  = 301    -100;
			char2other1     .x  = 301    -100;
			char2other2	    .x  = 301    -100;
			char2other3	    .x  = 301    -100;
                                         
			char3Name	    .x  = 497    -100;
			char3HP	        .x  = 497    -100;
			char3pAttack	.x  = 497    -100;
			char3sAttack	.x  = 497    -100;
			char3pDef	    .x  = 497    -100;
			char3sDef	    .x  = 497    -100;
			char3speed	    .x  = 497    -100;
			char3other1	    .x  = 497    -100;
			char3other2	    .x  = 497    -100;
			char3other3	    .x  = 497    -100;
                                         
			char4Name		.x  = 693    -100;
			char4HP	  		.x  = 693    -100;
			char4pAttack	.x  = 693    -100;
			char4sAttack	.x  = 693    -100;
			char4pDef		.x  = 693    -100;
			char4sDef		.x  = 693    -100;
			char4speed	   	.x  = 693    -100;
			char4other1		.x  = 693    -100;
			char4other2		.x  = 693    -100;
			char4other3		.x  = 693    -100;
			
			char1Name       .y  = 360    -100;
			char1HP         .y  = 375    -100;
			char1pAttack	.y  = 390    -100;
			char1sAttack	.y  = 405    -100;
			char1pDef       .y  = 420    -100;
			char1sDef       .y  = 435    -100;
			char1speed      .y  = 450    -100;
			char1other1	    .y  = 465    -100;
			char1other2	    .y  = 480    -100;
			char1other3	    .y  = 495    -100;

			char2Name       .y  = 360    -100;
			char2HP	        .y  = 375    -100;
			char2pAttack	.y  = 390    -100;
			char2sAttack	.y  = 405    -100;
			char2pDef       .y  = 420    -100;
			char2sDef	    .y  = 435    -100;
			char2speed      .y  = 450    -100;
			char2other1     .y  = 465    -100;
			char2other2	    .y  = 480    -100;
			char2other3	    .y  = 495    -100;

			char3Name	    .y  = 360    -100;
			char3HP	        .y  = 375    -100;
			char3pAttack	.y  = 390    -100;
			char3sAttack	.y  = 405    -100;
			char3pDef	    .y  = 420    -100;
			char3sDef	    .y  = 435    -100;
			char3speed	    .y  = 450    -100;
			char3other1	    .y  = 465    -100;
			char3other2	    .y  = 480    -100;
			char3other3	    .y  = 495    -100;

			char4Name		.y  = 360     -100;
			char4HP	  		.y  = 375     -100;
			char4pAttack	.y  = 390     -100;
			char4sAttack	.y  = 405     -100;
			char4pDef		.y  = 420     -100;
			char4sDef		.y  = 435     -100;
			char4speed	   	.y  = 450     -100;
			char4other1		.y  = 465     -100;
			char4other2		.y  = 480     -100;
			char4other3		.y  = 495     -100;
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
			text4.alignment = "center";
			
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
			
			char1HP.text 	  = "Hit Points: " + tempCharacterForUpdate.playerMAXHP;
			char1pAttack.text = "Physical Attack: " + tempCharacterForUpdate.playerAttackPower;
			char1sAttack.text = "Special Attack: " + tempCharacterForUpdate.playerSpecialAttack;
			char1pDef.text    = "Physical Defence: " + tempCharacterForUpdate.playerPhysicalDefense;
			char1sDef.text    = "Special Defence: " + tempCharacterForUpdate.playerSpecialDefense;
			char1speed.text   = "Speed: " + tempCharacterForUpdate.baseSpeed;
			char1other1.text   = tempCharacterForUpdate.element +  " " +tempCharacterForUpdate.job;
			
			tempCharacterForUpdate.changeCharTo(text2.text);
			char2.loadGraphic(tempCharacterForUpdate.bigCharacter);
			
			char2HP.text 	  = "Hit Points: " + tempCharacterForUpdate.playerMAXHP;
			char2pAttack.text = "Physical Attack: " + tempCharacterForUpdate.playerAttackPower;
			char2sAttack.text = "Special Attack: " + tempCharacterForUpdate.playerSpecialAttack;
			char2pDef.text    = "Physical Defence: " + tempCharacterForUpdate.playerPhysicalDefense;
			char2sDef.text    = "Special Defence: " + tempCharacterForUpdate.playerSpecialDefense;
			char2speed.text   = "Speed: " + tempCharacterForUpdate.baseSpeed;
			char2other1.text   = tempCharacterForUpdate.element +" " + tempCharacterForUpdate.job;
			
			tempCharacterForUpdate.changeCharTo(text3.text);
			char3.loadGraphic(tempCharacterForUpdate.bigCharacter);
			
			char3HP.text 	  = "Hit Points: " + tempCharacterForUpdate.playerMAXHP;
			char3pAttack.text = "Physical Attack: " + tempCharacterForUpdate.playerAttackPower;
			char3sAttack.text = "Special Attack: " + tempCharacterForUpdate.playerSpecialAttack;
			char3pDef.text    = "Physical Defence: " + tempCharacterForUpdate.playerPhysicalDefense;
			char3sDef.text    = "Special Defence: " + tempCharacterForUpdate.playerSpecialDefense;
			char3speed.text   = "Speed: " + tempCharacterForUpdate.baseSpeed;
			char3other1.text   = tempCharacterForUpdate.element +" " +  tempCharacterForUpdate.job;
		}
		
		private function randomSkills():void 
		{
			skillPos = Globals.randomInt(0, deckOfSkills.length);
			text1.text = deckOfSkills[skillPos];
			char1.loadGraphic(Globals.getSkillFromString(text1.text).skillIcon);
			
			char1HP.text 	  = "Element: " 			+ Globals.getSkillFromString(text1.text).type;
			char1other1.text  = "Type: " 				+ Globals.getSkillFromString(text1.text).isPhysical ? "Physical" : "Magical" ;
			char1pAttack.text = "Attack Power: " 		+ Globals.getSkillFromString(text1.text).power;
			char1sAttack.text = "Accuracy: " 			+ Globals.getSkillFromString(text1.text).accuracy * 100;
			char1pDef.text    = "Stamina: " 			+ Globals.getSkillFromString(text1.text).cost;
			char1sDef.text    = "Area of Effect: " 		+ Globals.getSkillFromString(text1.text).hasTarget ? "Single Target" : "Multiple Targets";
			char1speed.text   = "Speed: " 				+ Globals.getSkillFromString(text1.text).speed;
			
			skillPos = Globals.randomInt(0, deckOfSkills.length);
			text2.text = deckOfSkills[skillPos];
			char2.loadGraphic(Globals.getSkillFromString(text2.text).skillIcon);
			
			char2HP.text 	  = "Element: " 			+ Globals.getSkillFromString(text2.text).type;
			char2other1.text  = "Type: " 				+ Globals.getSkillFromString(text2.text).isPhysical ? "Physical" : "Magical" ;
			char2pAttack.text = "Attack Power: " 		+ Globals.getSkillFromString(text2.text).power;
			char2sAttack.text = "Accuracy: " 			+ Globals.getSkillFromString(text2.text).accuracy * 100;
			char2pDef.text    = "Stamina: " 			+ Globals.getSkillFromString(text2.text).cost;
			char2sDef.text    = "Area of Effect: " 		+ Globals.getSkillFromString(text2.text).hasTarget ? "Single Target" : "Multiple Targets";
			char2speed.text   = "Speed: " 				+ Globals.getSkillFromString(text2.text).speed;
			
			skillPos = Globals.randomInt(0, deckOfSkills.length);
			text3.text = deckOfSkills[skillPos];
			char3.loadGraphic(Globals.getSkillFromString(text3.text).skillIcon);
			
			char3HP.text 	  = "Element: " 			+ Globals.getSkillFromString(text3.text).type;
			char3other1.text  = "Type: " 				+ Globals.getSkillFromString(text3.text).isPhysical ? "Physical" : "Magical" ;
			char3pAttack.text = "Attack Power: " 		+ Globals.getSkillFromString(text3.text).power;
			char3sAttack.text = "Accuracy: " 			+ Globals.getSkillFromString(text3.text).accuracy * 100;
			char3pDef.text    = "Stamina: " 			+ Globals.getSkillFromString(text3.text).cost;
			char3sDef.text    = "Area of Effect: " 		+ Globals.getSkillFromString(text3.text).hasTarget ? "Single Target" : "Multiple Targets";
			char3speed.text   = "Speed: " 				+ Globals.getSkillFromString(text3.text).speed;
			
			skillPos = Globals.randomInt(0, deckOfSkills.length);
			text4.text = deckOfSkills[skillPos];
			char4.loadGraphic(Globals.getSkillFromString(text4.text).skillIcon);
			
			char4HP.text 	  = "Element: " 			+ Globals.getSkillFromString(text4.text).type;
			char4other1.text  = "Type: " 				+ Globals.getSkillFromString(text4.text).isPhysical ? "Physical" : "Magical" ;
			char4pAttack.text = "Attack Power: " 			+ Globals.getSkillFromString(text4.text).power;
			char4sAttack.text = "Accuracy: " 			+ Globals.getSkillFromString(text4.text).accuracy * 100;
			char4pDef.text    = "Stamina: " 				+ Globals.getSkillFromString(text4.text).cost;
			char4sDef.text    = "Area of Effect: " 		+ Globals.getSkillFromString(text4.text).hasTarget ? "Single Target" : "Multiple Targets";
			char4speed.text   = "Speed: " 				+ Globals.getSkillFromString(text4.text).speed;
		}
		
		public function updateSelector(selector:int):void
		{
			switch (selector) 
			{
				case 1:
					arrowSprite.x = 7;
					arrowSprite.y = 69;
					break;
				case 2:
					arrowSprite.x = 203;
					arrowSprite.y = 69;
				break;
				case 3:
					arrowSprite.x = 399;
					arrowSprite.y = 69;				
					break;
				case 4:
					arrowSprite.x = 595;
					arrowSprite.y = 69;			
				break;						
			}
		}
		
		public function updateSelectorCharacters(selector:int):void
		{
			switch (selector) 
			{
				case 1:
					arrowSprite.x = 36;
					arrowSprite.y = 69;
				break;
				case 2:
					arrowSprite.x = 289;
					arrowSprite.y = 69;
				break;
				case 3:
					arrowSprite.x = 542;
					arrowSprite.y = 69;
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
						flxHead1 = new FlxSprite(37-41, 510-41, Globals.p1.smallFace);
						add(flxHead1);
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
						flxHead2 = new FlxSprite(294-51, 510-41, Globals.p2.smallFace);
						add(flxHead2);
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
						flxHead3 = new FlxSprite(546-41, 510-41, Globals.p3.smallFace);
						add(flxHead3);
						trace("First Char Skill 1");
						background.loadGraphic(Assets.playerSelectBackground2);
						arrowSprite.loadGraphic(Assets.playerSelectSkillArrows);
						turn = 110;
						char1.x = 41+5;
						char1.y = 142+5;
						char2.x = 237+5;
						char2.y = 142+5;
						char3.x = 433+5;
						char3.y = 142+5;
						char4.x = 629+5;
						char4.y = 142+5;
						add(char4);
						add(text4);
						text1.x = 105-100;
						text1.y = 85-5;
						text2.x = 301-100;
						text2.y = 85-5;
						text3.x = 497-100;
						text3.y = 85-5;
						text4.x = 693-100;
						text4.y = 85-5;
						randomSkills();
						repositionText();
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
						
						text.text = "";
						remove(arrowSprite);
						trace("READY to Go");
						
						// TODO:
						// Show final party composition
						
						background.loadGraphic(Assets.fightPageBackground);
						
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