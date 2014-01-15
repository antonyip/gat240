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
		private var char1:FlxSprite = new FlxSprite(200, 300, Assets.testImage1);
		private var char2:FlxSprite = new FlxSprite(400, 300, Assets.testImage2);
		private var char3:FlxSprite = new FlxSprite(600, 300, Assets.testImage3);
		private var char4:FlxSprite = new FlxSprite(0, 300, Assets.testImage3);
		private var arrowSprite:FlxSprite = new FlxSprite(0, 0, Assets.arrowSprite);
		private var turn:int = 0;
		private var selector:int = 1;
		
		// do once when come into game
		public override function create():void
		{
			add(text);
			add(char1);
			add(char2);
			add(char3);
			add(arrowSprite);
		}
		
		public override function update():void
		{
			switch(turn)
			{
				case 0:
					// game start
					trace("Start Game");
					selector = 1;
					turn = 100;
					break;
					
				case 100:
					// pick first character
					trace("First Char");
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
						turn = 200;
					}
					
					break;
				case 110:
					// pick first character skill 1
					trace("First Char Skill 1");
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
						turn = 120;
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
					trace("First Char Skill 2");
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
						turn = 130;
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
					trace("First Char Skill 3");
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
						turn = 210;
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
					trace("Second Char");
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
						turn = 300;
					}
					break;
				case 210:
					// pick second character skill 1
					trace("Second Char Skill 1");
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
						turn = 220;
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
					trace("Second Char Skill 2");
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
						turn = 230;
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
					trace("Second Char Skill 3");
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
						turn = 310;
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
					trace("Third Char");
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
						turn = 110;
						char1.x = 50;
						char2.x = 250;
						char3.x = 450;
						char4.x = 650;
						add(char4);
					}
					break;
				case 310:
					// pick third character skill 1
					trace("Third Char Skill 1");
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
						turn = 320;
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
					trace("Third Char Skill 2");
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
						turn = 330;
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
					trace("Third Char Skill 3");
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
						turn = 400;
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
					trace("READY to Go");
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