import java.lang.Comparable;
import org.apache.commons.lang3.builder.CompareToBuilder;

public aspect ComparableAspect {
	
	declare parents : Comparable implements Comparable;
	
	public int Comparable<T>.compareTo(T rhs) {
		return CompareToBuilder.reflectionCompare(this, rhs);
	}
}