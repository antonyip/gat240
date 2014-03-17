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
		public function PauseMenu(MaxSize:uint=0) 
		{
			title.scrollFactor.x = 0;
			title.scrollFactor.y = 0;
			title.alpha = 0.5;
			super(MaxSize);
			add(title);
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}