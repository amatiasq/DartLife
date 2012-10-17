class Vector {
	final num x, y;

	static Map<String, Vector> _cache;
	Vector._internal(this.x, this.y);

	factory Vector(num x, num y) {
		var hash = '$x|$y';

		if (_cache === null)
			_cache = <Vector>{};

		if (!_cache.containsKey(hash))
			_cache[hash] = new Vector._internal(x, y);

		return _cache[hash];
	}

	factory Vector.zero() => new Vector(0, 0);

	factory Vector.fromAngle(num angle, [num hypotenuse = 1]) {
		angle %= 360;
		if (angle < 0)
			angle += 360;

		return new Vector.fromRadians(angle * Math.PI / 180);
	}

	factory Vector.fromRadians(num radians, [num hypotenuse = 1]) {
		return new Vector(
			Math.cos(radians) * hypotenuse,
			Math.sin(radians) * hypotenuse);
	}

	//
	// OPERATORS
	//
	Vector operator negate() => new Vector(-x, -y);

	bool isZero() => x == 0 && y == 0;

	bool operator ==(Vector target) => x == target.x && y == target.y;

	Vector operator +(target) {
		if (target is Vector)
			return new Vector(x + target.x, y + target.y);
		if (target is num)
			return new Vector(x + target, y + target);
		throw new Exception('[Vector operator+] Target --[$target]-- is not Vector or num');
	}

	Vector operator -(target) {
		if (target is Vector)
			return new Vector(x - target.x, y - target.y);
		if (target is num)
			return new Vector(x - target, y - target);
		throw new Exception('[Vector operator-] Target --[$target]-- is not Vector or num');
	}

	Vector operator *(num target) => new Vector(x * target, y * target);

	Vector operator /(num target) => new Vector(x / target, y / target);


	//
	// MATH
	//
	Vector round([int decimals = 0]) {
		// TODO: Integer.pow not implemented yet
		int operator = 10.pow(decimals);
		//int operator = pow(10, decimals);

		return new Vector(
			(x * operator).round() / operator,
			(y * operator).round() / operator);
	}

	Vector abs() => new Vector(x.abs(), y.abs());


	//
	// PROPERTIES
	//
	double get hypotenuse() => isZero() ? 0 : Math.sqrt((x * x) + (y * y), 2);

	double get angle()  {
		double angle = (this.radians / Math.PI * 180) % 360;

		if (angle < 0)
			angle += 360;

		return angle;
	}

	double get radians() {
		if (isZero())
			return 0;

		double arctan = Math.atan(y / x);

		if (arctan < 0)
			arctan += Math.PI;
		if (y < 0 || (y == 0 && x < 0))
			arctan += Math.PI;

		return arctan;
	}

	String toString() => '[life Vector] { $x, $y }';
}
