class Geometry {
	//
	// FIELDS
	//
	Vector location;
	Vector size;


	//
	// CONSTRUCTORS
	//
	Geometry([num x = 0, num y = 0, num width = 1, num height = 1]) {
		location = new Vector(x, y);
		size = new Vector(width, height);
	}

	//
	// PROPERTIES
	//
	num get x() => location.x;
	    set x(num value) => location.x = value;
	num get y() => location.y;
	    set y(num value) => location.y = value;

	// Getters
	Vector get start() => location - (size / 2);
	Vector get end() => location + (size / 2);

	double get area() => size.x * size.y;


	//
	// METHODS
	//

	// Setters
	setPosition(num x, num y) {
		location.x = x;
		location.y = y;
	}
	setSize(num x, num y) {
		size.x = x;
		size.y = y;
	}

	// Compare with other objects
	num distance(target) {
		if (target is Geometry)
			target = target.location;
		if (!(target is Vector)
			throw new Error('[PhysicObject.distance(target)]: Target is not a vector');
		return (location - target).hypotenuse;
	}

	num angle(target) {
		if (target is PhysicObject)
			target = target.location;
		if (!(target is Vector)
			throw new Error('[PhysicObject.angle(target)]: Target is not a vector');
		return (location - target).angle;
	}

	bool testCollision(PhysicObject target) {
		var start = this.start;
		var end = this.end;
		var targetStart = target.start;
		var targetEnd = target.end;

		return (
			start.x < targetEnd.x &&
			start.y < targetEnd.y &&
			end.x > targetStart.x &&
			end.y > targetStart.y
		);
	}

}