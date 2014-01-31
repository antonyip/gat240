package  
{
	/**
	 * ...
	 * @author Anton
	 */
	import flash.events.Event;
	import org.flixel.FlxG;
	import org.flixel.FlxCamera;
	import flash.display.StageDisplayState;
	 
	public class Globals 
	{
		public static var p1:CharacterClass = new CharacterClass();
		public static var p2:CharacterClass = new CharacterClass();
		public static var p3:CharacterClass = new CharacterClass();
		public static var e1:CharacterClass = new CharacterClass();
		public static var e2:CharacterClass = new CharacterClass();
		public static var e3:CharacterClass = new CharacterClass();
		
		public function Globals() 
		{
			
		}
		
		public static function randomInt(minValue:int, maxValue:int):int
		{
			return Math.floor(minValue + Math.random() * (maxValue-minValue));
		}
		
		public static function toggle_fullscreen(e:Event):void {

			// 1. Change the size of the Flash window to fullscreen/windowed
			//    This is easily done by checking stage.displayState and then setting it accordingly
			/*
			if (ForceDisplayState) {
				FlxG.stage.displayState = ForceDisplayState;
			} else {
				if (FlxG.stage.displayState == StageDisplayState.NORMAL) {
					FlxG.stage.displayState = StageDisplayState.FULL_SCREEN;
				} else {
					FlxG.stage.displayState = StageDisplayState.NORMAL;
				}
			}
			*/
			// The next function contains steps 2-4
			window_resized();
		}
		
		// This is called every time the window is resized
        // It's a separate function than toggle_fullscreen because we want to call it when the window
        // size changed even if the user didn't click the fullscreen button (eg by pressing escape to exit fullscreen mode)
        public static function window_resized(e:Event = null):void {
 
            // 2. Change the size of the Flixel game window
            //    We already changed the size of the Flash window, so now we need to update Flixel.
            //    Just update the FlxG dimensions to match the new stage dimensions from step 1
            FlxG.width = FlxG.stage.stageWidth / FlxCamera.defaultZoom;
            FlxG.height = FlxG.stage.stageHeight / FlxCamera.defaultZoom;
 
            // 3. Change the size of the Flixel camera
            //    Lastly, update the Flixel camera to match the new dimensions from the previous step
            //    This is so that the camera can see all of the freshly resized dimensions
			var HoverW:Number  = FlxG.stage.stage.stageHeight / 600;
			
			
			FlxCamera.defaultZoom = HoverW;
            FlxG.resetCameras(new FlxCamera(0, 0, FlxG.width, FlxG.height));
 
            // 4. Optionally, depening on your game, you may need to update couple more things:
            //    - Reposition / resize things such as the Hud to match the new screen dimensions
            //    - Camera bounds to allow the camera to travel everywhere within the resized dimensions
            //    - World bounds to allow everything to collide within the resized dimensions
            //    - For more information on camera/world bounds/hud positioning check out our other tutorial at
            //              http://www.funstormgames.com/blog/2011/10/flixel-setting-up-game-dimensions-swf-camera-level-hud-mouse/
            //    Anyways, we're just going to update the fullscreen button and dimensions text
            //buttonFullScreen.x = FlxG.width / 2 - buttonFullScreen.width / 2;
            //buttonFullScreen.y = FlxG.height / 2 - buttonFullScreen.height / 2;
            //textDimensions.width = FlxG.width;
            //textDimensions.text = "Current resolution: " + FlxG.width + "*" + FlxG.height;
			
 
        }
		
		public static function GlobalsInit():void
		{
			e1.Calissa();
			e2.Anton();
			e3.Kevin();
			e1.playerSkill1.aSwipe();
			e1.playerSkill2.aSwipe();
			e1.playerSkill3.aSwipe();
			e1.playerSkill4.aSwipe();
			e2.playerSkill1.aSwipe();
			e2.playerSkill2.aSwipe();
			e2.playerSkill3.aSwipe();
			e2.playerSkill4.aSwipe();
			e3.playerSkill1.aSwipe();
			e3.playerSkill2.aSwipe();
			e3.playerSkill3.aSwipe();
			e3.playerSkill4.aSwipe();
		}
		
		public static function getCharacterFromString(characterName:String):CharacterClass
		{
			if (characterName == "p1")
				return p1;
			if (characterName == "p2")
				return p2;
			if (characterName == "p3")
				return p3;
			if (characterName == "e1")
				return e1;
			if (characterName == "e2")
				return e2;
			if (characterName == "e3")
				return e3;
			return e1;
		}
		
		public static function getSkillFromString(skillName:String):SkillClass
		{
			var tempSkill:SkillClass = new SkillClass();
			tempSkill.changeSkillTo(skillName);
			return tempSkill;
		}
		
		public static function checkElementalDifference(attackerName:String, defenderName:String):Number
		{
			return 1;
		}
		
		public static function checkClassResistance(attackerName:String, defenderName:String):Number
		{
			return 1;
		}
		
	}

}