//#library('bio.physic');
//#import('Vector.dart');

class Force {
	Vector _direction;
	double _strength;


	Force(num direction, num strength) {
		this._direction = new Vector.fromAngleHypo(direction, 1);
		this._strength = strength;
	}

	Force.empty() {
		this._direction = new Vector.zero();
		this._strength = 0;
	}

	Force.fromVector(Vector vector) {
		this._strength = vector.hypotenuse;
		this._direction = vector / this._strength;
	}


	num get direction() => _direction.angle;
	    set direction(num value) => _direction = new Vector.fromAngle(valueb);
	
	num get radians() => _direction.radians;
	    set radians(num value) => _direction = new Vector.fromRadians(value);

	num get strength() => _strength;
	    set strength(num value) {
	    	if (value < 0) {
	    		value = -value;
	    		_direction = -_direction;
	    	}
	    	_strength = value;
	    }
	
	Vector get vector() => _direction * _strength;
	

	bool operator ==(Force target) =>
		this._direction.radians = target._direction.radians &&
		this._strength = target._strength;
	
	bool operator <(Force target) => this._strength < target._strength;
	bool operator <=(Force target) => this._strength <= target._strength;
	bool operator >(Force target) => this._strength > target._strength;
	bool operator >=(Force target) => this._strength >= target._strength;

	bool operator +(Force target) => new Force.fromVector(this.vector + target.vector);
	bool operator -(Force target) => new Force.fromVector(this.vector - target.vector);
	

	String toString() => "[Force { direction: $direction, strength: $strength }]";
}