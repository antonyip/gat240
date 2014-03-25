package  
{
	/**
	 * ...
	 * @author Anton
	 */
	import flash.events.Event;
	import GameObjectManagers.*;
	import GameObjects.*;
	import org.flixel.FlxG;
	import org.flixel.FlxCamera;
	import flash.display.StageDisplayState;
	 
	public class Globals 
	{
		public static var playerCharacter:Aeroplane;
		public static var floorManager:FloorManager;
		public static var platformManager:PlatformManager;
		public static var enemyManager:EnemyManager;
		public static var checkPointManager:CheckPointManager;
		public static var jumpwallManager:JumpableWallManager;
		
		public function Globals() 
		{
			
		}

		public static function randomInt(minValue:int, maxValue:int):int
		{
			return Math.floor(minValue + Math.random() * (maxValue-minValue));
		}
		
		public static function toggle_fullscreen(e:Event):void
		{
			window_resized();
		}
		
        public static function window_resized(e:Event = null):void
		{
            FlxG.height = FlxG.stage.stageHeight / FlxCamera.defaultZoom;
			var HoverW:Number  = FlxG.stage.stage.stageHeight / 600;
			FlxCamera.defaultZoom = HoverW;
            FlxG.resetCameras(new FlxCamera(0, 0, FlxG.width, FlxG.height));
        }
		
		public static function GlobalsInit():void
		{

		}
		
		public static function outOfScreen(x:Number, y:Number):Boolean
		{
			if (x < -200)
				return true;
			if (x > 1000)
				return true;
			if (y < -200)
				return true;
			if (y > 1000)
				return true;
			
			return false;			
		}
		
	}
}