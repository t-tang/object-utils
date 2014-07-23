import org.ttang.util.object.Comparison;

public aspect ComparisonAspect {

	declare parents : Comparison && Comparable implements Comparison;

	public boolean Comparison<T>.less(T rhs) {
		return this.compareTo(rhs) == -1;
	}

	public boolean Comparison<T>.lessEqual(T rhs) {
		 return this.compareTo(rhs) < 1;
	}

	public boolean Comparison<T>.greater(T rhs) {
		return this.compareTo(rhs) == 1;
	}

	public boolean Comparison<T>.greaterEqual(T rhs) {
		return this.compareTo(rhs) > -1;
	}

	public boolean Comparison<T>.notEqual(T rhs) {
		return this.compareTo(rhs) != 0;
	}
}