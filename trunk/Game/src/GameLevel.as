package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class GameLevel extends FlxState 
	{
		// Sprites
		private var test:FlxText = new FlxText(400, 300, 300, "Hello World");
		private var playerSprite:FlxSprite = new FlxSprite(100, 400, Assets.testImage1);
		private var enemySprite:FlxSprite = new FlxSprite(600, 100, Assets.testImage2);
		private var guiSprite:FlxSprite = new FlxSprite(0, 500, Assets.testImage3);
		
		// GUI Sprites
		private var arrowSprite:FlxSprite = new FlxSprite(0, 0, Assets.arrowSprite);
		private var guiText1:FlxText = new FlxText(100, 450, 120, "");
		private var guiText2:FlxText = new FlxText(100, 480, 120, "");
		private var guiText3:FlxText = new FlxText(100, 510, 120, "");
		private var guiText4:FlxText = new FlxText(100, 540, 120, "");
		
		
		// Game Calculations
		private var p1:CharacterClass = new CharacterClass(); // player 1
		private var p2:CharacterClass = new CharacterClass(); // player 2
		private var p3:CharacterClass = new CharacterClass(); // player 3
		private var e1:CharacterClass = new CharacterClass(); // enemy 1
		private var e2:CharacterClass = new CharacterClass(); // enemy 2
		private var e3:CharacterClass = new CharacterClass(); // enemy 3
		
		// OtherStats
		private var damageVariance:Number = 0; 	// 0-1 .. if you put 0.5.. the damage will become 0.5 to 1.5 times.. works like a +- system
		private var damageType:String;			// unused.. following guide
		private var damageTypeMultiple:String;	// unused
		private var stamRegen:int = 15;
		
		// Game Logic
		private var turn:int = 0;
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

		// do once when come into game
		public override function create():void
		{
			add(test);
			add(guiSprite);
			add(playerSprite);
			add(enemySprite);
			add(arrowSprite);
			add(guiText1);
			add(guiText2);
			add(guiText3);
			add(guiText4);
			
			// HACKS
			p2.playerSkill1 = "player 2 turn";
			p3.playerSkill1 = "player 3 turn";
			
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
					break;
				case 100:
					guiText1.text = p1.playerSkill1;
					guiText2.text = p1.playerSkill2;
					guiText3.text = p1.playerSkill3;
					guiText4.text = p1.playerSkill4;
					if (FlxG.keys.justReleased("SPACE"))
					{
						turn = 200;
						selector = 1;
					}
					break;
				case 200:
					guiText1.text = p2.playerSkill1;
					guiText2.text = p2.playerSkill2;
					guiText3.text = p2.playerSkill3;
					guiText4.text = p2.playerSkill4;
					if (FlxG.keys.justReleased("SPACE"))
					{
						turn = 300;
						selector = 1;
					}
					break;
				case 300:
					guiText1.text = p3.playerSkill1;
					guiText2.text = p3.playerSkill2;
					guiText3.text = p3.playerSkill3;
					guiText4.text = p3.playerSkill4;
					if (FlxG.keys.justReleased("SPACE"))
					{
						turn = 400;
						selector = 1;
					}
					break;
				case 400:
					trace ("AI's Turn");
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
	}

}