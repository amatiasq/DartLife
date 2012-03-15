class Physic extend Geometry {
	//
	// FIELDS
	//
	Force movement;
	Force intent;
	double weight;


	//
	// CONSTRUCTORS
	//
	Physic() {
		movement = new Force(0, 0);
		intent = new Force(0, 0);
		weight = 0;
	}

	//
	// PROPERTIES
	//
	num get direction() => movement.direction;
	    set direction(num value) => movement.direction = value;
	num get velocity() => movement.strength;
	    set velocity(num value) => movement.strength = value;


	//
	// METHODS
	//

	// Setters
	move() {
		location += movement;
		fireEvent('move', this, location.x, location.y);
	}
	shove(var degrees, num strength) {
		Force force;
		if (degrees is Force)
			force = degrees;
		else
			force = new Force(degrees, strength * (1 - weight));
		
		movement += force;
	}

	accelerate(num strength) {
		movement.strength += strength;
	}
	brake(num strength) {
		num result = movement.strength - strength;
		if (result < 0)
			result = 0;
		movement.strength = result;
	}

	stop() {
		movement = new Force(0, 0);
	}
	isStopped() {
		return Math.round(movement.strength * 10) == 0;
	}
}