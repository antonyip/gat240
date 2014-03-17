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
				
		}
		public override function update():void
		{
			// handle inputs WS
			if (FlxG.keys.justReleased("SPACE"))
			{
				FlxG.fade(0xffffffff, 1, startGameFn);
			}
			
			if (FlxG.keys.justReleased("ESCAPE"))
			{
				System.exit(0);
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