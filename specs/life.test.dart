#library('life:tests');

#import('../lib/Dartmine/src/dartmine.dart');
#import('../src/life.dart');

#source('math/Vector.dart');

main() {
	VectorTest();


	var temp = new Vector(1, 2);
	print(temp === new Vector(1, 2));

	print(new Vector.fromAngle(20, 3));

	/*
	var temp = new Vector.zero();
	print(temp === new Vector.zero());
	*/
}