package motion.easing;


class ElasticBase
{
	static public var easeIn (get, never):IEasing;
	static public var easeInOut (get, never):IEasing;
	static public var easeOut (get, never):IEasing;
	
	private static function get_easeIn ():IEasing
	{
		return new ElasticEaseIn (1, 1);
	}
	
	private static function get_easeInOut ():IEasing
	{
		return new ElasticEaseInOut (1, 1);
	}
	
	private static function get_easeOut ():IEasing
	{
		return new ElasticEaseOut (1, 1);
	}
}


class ElasticEaseIn implements IEasing
{
	public var a:Float;
	public var p:Float;
	
	public function new (a:Float, p:Float)
	{
		this.a = a;
		this.p = p;
	}
	
	public function calculate (k:Float):Float
	{
		if (k == 0)
			return 0;
			
		if (k == 1)
			return 1;
			
		var s:Float;
		if (a < 1)
		{
			a = 1;
			s = p / 4;
		}
		else
			s = p / (2 * Math.PI) * Math.asin (1 / a);
			
		return -(a * Math.pow(2, 10 * (k -= 1)) * Math.sin( (k - s) * (2 * Math.PI) / p ));
	}
	
	public function ease (t:Float, b:Float, c:Float, d:Float):Float
	{
		throw "not implemented";
	}	
}


class ElasticEaseInOut implements IEasing
{
	public var a:Float;
	public var p:Float;
	
	public function new (a:Float, p:Float)
	{
		this.a = a;
		this.p = p;
	}
	
	public function calculate (k:Float):Float
	{
		if (k == 0)
			return 0;
			
		if ((k /= 1 / 2) == 2)
			return 1;
		
		var p:Float = (0.3 * 1.5);
		var a:Float = 1;
		var s:Float = p / 4;
		
		return (k < 1)
			? -0.5 * (Math.pow(2, 10 * (k -= 1)) * Math.sin((k - s) * (2 * Math.PI) / p))
			: Math.pow(2, -10 * (k -= 1)) * Math.sin((k - s) * (2 * Math.PI) / p) * 0.5 + 1;
	}
	
	public function ease (t:Float, b:Float, c:Float, d:Float):Float
	{
		throw "not implemented";
	}	
}


class ElasticEaseOut implements IEasing
{
	public var a:Float;
	public var p:Float;
	
	public function new (a:Float, p:Float)
	{
		this.a = a;
		this.p = p;
	}
	
	public function calculate (k:Float):Float
	{
		if (k == 0)
			return 0;
			
		if (k == 1)
			return 1;
			
		var s:Float;
		if (a < 1)
		{
			a = 1;
			s = p / 4;
		}
		else
			s = p / (2 * Math.PI) * Math.asin (1 / a);
			
		return (a * Math.pow(2, -10 * k) * Math.sin((k - s) * (2 * Math.PI) / p ) + 1);
	}
	
	public function ease (t:Float, b:Float, c:Float, d:Float):Float
	{
		throw "not implemented";
	}	
}
