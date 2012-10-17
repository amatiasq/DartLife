#library('life');

#source('math/vector.dart');
#source('math/rectangle.dart');

/*
#source('math/Geometry.dart');

#source('physic/Force.dart');
#source('physic/Physic.dart');

num pow(num base, int exponent) {
	var op = 1;

	while (exponent-- != 0)
		op *= base;

	return op;
}
*/

void main() {
	var vec = new Rectangle(1.5, 5.1, 3, 4);
	print(vec);
}

/*
int main() {
	var force = new Force.empty();
	print(force);

	var vec = new Vector(2, 4);
	print(vec);
	print(vec.angle);
	print(vec += 1);
	print(vec += new Vector(7, 5));
	print(-vec);
	print(vec.angle);
	print(vec.round(2));
	print(vec);
	print(vec.abs());
	print(vec);
	print(vec.hypotenuse);
}
*/
