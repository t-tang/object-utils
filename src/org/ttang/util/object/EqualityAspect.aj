package org.ttang.util.object;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

public aspect EqualityAspect {

	declare parents : Equality implements Equality;

	public boolean Equality.equals(Object other) {
		// transient fields are excluded
		// superclass fields are included
		return EqualsBuilder.reflectionEquals(this, other);
	}
	
	public int Equality.hashCode() {
		// transient fields are excluded
		// superclass fields are included
		return HashCodeBuilder.reflectionHashCode(this);
	}
}