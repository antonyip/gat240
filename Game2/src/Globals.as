package  
{
	/**
	 * ...
	 * @author Anton
	 */
	import flash.events.Event;
	import GameObjectManagers.PlayerBulletManager;
	import GameObjectManagers.PowerUpManager;
	import GameObjects.PlayerBullet;
	import org.flixel.FlxG;
	import org.flixel.FlxCamera;
	import flash.display.StageDisplayState;
	 
	public class Globals 
	{
		public static var playerBulletManager:PlayerBulletManager = new PlayerBulletManager();
		public static var powerUpManager:PowerUpManager = new PowerUpManager();
		
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
		
	}
}