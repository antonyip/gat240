package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class PauseMenu extends FlxGroup 
	{
		private var title:FlxSprite = new FlxSprite(0, 0, Assets.splashPauseBG);
		private var arrow:FlxSprite = new FlxSprite(200, 325, Assets.keyImage);
		private var resumeGame:FlxSprite = new FlxSprite(79-40, 320, Assets.resumeGameImage);
		private var quitGame:FlxSprite = new FlxSprite(545-40, 320, Assets.quitGameImage);
		private var buttonCase:int = 0;
		private static var maxCase:int = 2; // counts from 0
		public function PauseMenu(MaxSize:uint=0) 
		{
			super(MaxSize);
			title.scrollFactor.x = 0;
			title.scrollFactor.y = 0;
			title.alpha = 0.5;
			
			add(title);
			
			resumeGame.scrollFactor.x = 0;
			resumeGame.scrollFactor.y = 0;
			//add(resumeGame);
			
			quitGame.scrollFactor.x = 0;
			quitGame.scrollFactor.y = 0;
			//add(quitGame);
			
			arrow.scrollFactor.x = 0;
			arrow.scrollFactor.y = 0;
			add(arrow);
		}
		
		override public function update():void 
		{
			super.update();
			if (FlxG.paused)
			{
				if (FlxG.keys.justReleased("RIGHT") || FlxG.keys.justReleased("D"))
				{
					if (buttonCase > 0)
						buttonCase--;
				}
				if (FlxG.keys.justReleased("LEFT") || FlxG.keys.justReleased("A"))
				{
					if (buttonCase < maxCase-1)
						buttonCase++;
				}
				buttonCase ? arrow.x = resumeGame.x : arrow.x = quitGame.x;
				if (FlxG.keys.justReleased("SPACE") || FlxG.keys.justReleased("ENTER") )
				{
					switch (buttonCase) 
					{
						case 1:
							Globals.iShouldUnpause = true;
						break;
						case 0:
							FlxG.switchState(new MainMenu);
						break;						
						default:
					}
				}
			}
		}
	}

}