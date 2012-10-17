interface Figure {
	num x;
	num y;

	Vector size;
	Vector location

	Vector get start();
	Vector get end();

	num get area();

	void setPosition(num x, num y);
	void setSize(num x, num y);

	num distance(Figure target);
	num angle(Figure target);

	bool testCollision(Figure target);
}
