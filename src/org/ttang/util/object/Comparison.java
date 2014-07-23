package org.ttang.util.object;

public interface Comparison<T> extends Comparable<T> {
	boolean less(T rhs);
	boolean lessEqual(T rhs);
	boolean greater(T rhs);
	boolean greaterEqual(T rhs);
	boolean notEqual(T rhs);
}
