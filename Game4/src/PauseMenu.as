package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Anton
	 */
	public class PauseMenu extends FlxGroup 
	{
		private var title:FlxSprite = new FlxSprite(0, 0, Assets.splashLogoScreen);
		private var arrow:FlxSprite = new FlxSprite(200, 100, Assets.keyImage);
		private var resumeGame:FlxSprite = new FlxSprite(300, 100, Assets.resumeGameImage);
		private var quitGame:FlxSprite = new FlxSprite(300, 200, Assets.quitGameImage);
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
			add(resumeGame);
			
			quitGame.scrollFactor.x = 0;
			quitGame.scrollFactor.y = 0;
			add(quitGame);
			
			arrow.scrollFactor.x = 0;
			arrow.scrollFactor.y = 0;
			add(arrow);
		}
		
		override public function update():void 
		{
			super.update();
			if (FlxG.paused)
			{
				if (FlxG.keys.justReleased("UP"))
				{
					if (buttonCase > 0)
						buttonCase--;
				}
				if (FlxG.keys.justReleased("DOWN"))
				{
					if (buttonCase < maxCase-1)
						buttonCase++;
				}
				arrow.y = 100 + buttonCase * 100;
				if (FlxG.keys.justReleased("SPACE") || FlxG.keys.justReleased("ENTER") )
				{
					switch (buttonCase) 
					{
						case 0:
							Globals.iShouldUnpause = true;
						break;
						case 1:
							FlxG.switchState(new MainMenu);
						break;						
						default:
					}
				}
			}
		}
	}

}