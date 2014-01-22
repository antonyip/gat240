package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Anton Yip
	 */
	public class ParticleSystemCreator extends FlxState
	{
		public var particleSystem:FlxEmitter = new FlxEmitter(400, 300, 1000);
		public var particle:FlxParticle;
		private var lifespan:int;
		private var emittorSpeed:int;
		private var emittorCount:int;
		public override function create():void
		{
			//particle.loadGraphic(Assets.testImage1);
			lifespan = 5;
			emittorSpeed = 0.1; // every 0.1 seconds emit one particle
			emittorCount = 1000; // emit 5 particles every 0.1 second
			particleSystem.setXSpeed(00, 00);
			particleSystem.setYSpeed(00, 00);
			particleSystem.setRotation(0, 0);
			particleSystem.setSize(1, 1);
			//particleSystem.lifespan = 0;
			//particleSystem.emitParticle();
			//particleSystem.frequency = 1;
			//particleSystem.gravity = 100;
			particleSystem.height = 100; // for box sized particles
			particleSystem.width = 100;
			//particleSystem.start(true, 0, 0.1, 1000);
			
			//particleSystem.particleClass = BlizzardParticles;
			//particleSystem.makeParticles(Assets.testImage3, 1000);
			//particleSystem.particleDrag = new FlxPoint(0, 10);
			
			add(particleSystem);
			particleSystem.start(false,2,0.1,10);
			trace(particleSystem.on);
		}
		
		public override function update():void
		{
			//particleSystem.emitParticle();
			particleSystem.update();
			if (FlxG.mouse.justPressed())
			{
				trace ("emit");
				//particleSystem.emitParticle();
				particleSystem.start(false,lifespan,emittorSpeed,emittorCount);
			}
			particleSystem.x = FlxG.mouse.getScreenPosition().x;
			particleSystem.y = FlxG.mouse.getScreenPosition().y;
		}
	}
}