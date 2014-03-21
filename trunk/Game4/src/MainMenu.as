package  
{
	import org.flixel.*;
	import flash.events.Event;
	import org.flixel.plugin.funstorm.FlxMovieClip;
	import flash.system.System;
	
	/**
	 * ...
	 * @author Anton Yip
	 */
	public class MainMenu extends FlxState 
	{
		// do once when come into game
		private var bg:FlxSprite = new FlxSprite(0, 0, Assets.mainMenuBG);
		private var howToPlay:FlxSprite = new FlxSprite(0, 0, Assets.splashHowToPlay);
		private var areYouSure:FlxSprite = new FlxSprite(300, 300, Assets.areYouSure);
		private var areYouSureYes:FlxSprite = new FlxSprite(350, 330, Assets.areYouSureYes);
		private var areYouSureNo:FlxSprite = new FlxSprite(250, 330, Assets.areYouSureNo);
		private var areYouSureArrow:FlxSprite = new FlxSprite(0, 0, Assets.areYouSureArrow);
		private var arrowPos:Boolean = false;
		public override function create():void
		{
			add(bg);
			add(howToPlay);
			howToPlay.visible = false;
			if (FlxG.stage)
				FlxG.stage.addEventListener(Event.RESIZE, Globals.toggle_fullscreen);
				
			if (FlxG.music == null)
			{
				FlxG.music = new FlxSound();
				FlxG.music.loadEmbedded(Assets.backgroundMusic, true);
				FlxG.music.play();
				FlxG.music.survive = true;
			}
			
			add(areYouSure);
			add(areYouSureYes);
			add(areYouSureNo);
			add(areYouSureArrow);
			
			areYouSure.visible = false;
			areYouSureYes.visible = false;
			areYouSureNo.visible = false;
			areYouSureArrow.visible = false;
			
			FlxG.flash();
		}
		public override function update():void
		{
			if (FlxG.keys.justReleased("ESCAPE"))
			{
				if (!howToPlay.visible)
				{
					areYouSure.visible 		= !areYouSure.visible;	
					areYouSureYes.visible 	= !areYouSureYes.visible; 	
					areYouSureNo.visible 	= !areYouSureNo.visible;
					areYouSureArrow.visible = !areYouSureArrow.visible;
					arrowPos = false;
				}
				else
				{
					howToPlay.visible ? howToPlay.visible = false : howToPlay.visible = true;
				}
			}
			
			if (areYouSure.visible)
			{
				if (FlxG.keys.justReleased("LEFT"))
				{
					arrowPos = false;
				}
				if (FlxG.keys.justReleased("RIGHT"))
				{
					arrowPos = true;
				}
				
				if (arrowPos)
				{
					areYouSureArrow.x = areYouSureYes.x - 10;
					areYouSureArrow.y = areYouSureYes.y;
				}
				else
				{
					areYouSureArrow.x = areYouSureNo.x - 10;
					areYouSureArrow.y = areYouSureNo.y;
				}
				
				if (FlxG.keys.justReleased("SPACE") || FlxG.keys.justReleased("ENTER"))
				{
					if (arrowPos)
						System.exit(0);	
					else
					{
						areYouSure.visible 		= !areYouSure.visible;	
						areYouSureYes.visible 	= !areYouSureYes.visible; 	
						areYouSureNo.visible 	= !areYouSureNo.visible;
						areYouSureArrow.visible = !areYouSureArrow.visible;
						arrowPos = false;
					}
				}
				
				return;
			}
			// handle inputs WS
			if (FlxG.keys.justReleased("SPACE"))
			{
				FlxG.fade(0xffffffff, 1, startGameFn);
			}
			

			if (FlxG.keys.justReleased("H"))
			{
				howToPlay.visible ? howToPlay.visible = false : howToPlay.visible = true;
			}
		}
		
		public function startGameFn():void 
		{
			FlxG.switchState(new GameLevel);
		}
	}

}