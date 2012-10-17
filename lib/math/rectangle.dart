class Rectangle {
	//
	// FIELDS
	//
	Vector _location;
	Vector _size;


	//
	// CONSTRUCTORS
	//
	Rectangle([num x = 0, num y = 0, num width = 1, num height = 1]) :
		_location = new Vector(x, y),
		_size = new Vector(width, height);

	String toString() => '[life Rectangle] { x: $x, y: $y, area: $area }';

	//
	// PROPERTIES
	//
	num get x() => _location.x;
	    set x(num value) => _location.x = value;
	num get y() => _location.y;
	    set y(num value) => _location.y = value;

	// Getters
	Vector get start() => _location - (_size / 2);
	Vector get end() => _location + (_size / 2);

	double get area() => _size.x * _size.y;


	//
	// METHODS
	//

	// Setters
	void setPosition(num x, num y) {
		_location.x = x;
		_location.y = y;
	}
	void setSize(num x, num y) {
		_size.x = x;
		_size.y = y;
	}

	// Compare with other objects
	num distance(target) {
		if (target is )
			target = target._location;
		if (!(target is Vector))
			throw new Error('[PhysicObject.distance(target)]: Target is not a vector');
		return (_location - target).hypotenuse;
	}

	num angle(target) {
		if (target is PhysicObject)
			target = target._location;
		if (!(target is Vector))
			throw new Error('[PhysicObject.angle(target)]: Target is not a vector');
		return (_location - target).angle;
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
