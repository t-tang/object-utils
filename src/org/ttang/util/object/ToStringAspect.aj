package org.ttang.util.object;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

// Defaults toString to use reflection (from commons-lang3)
public aspect ToStringAspect {

	declare parents : RecursiveToString implements RecursiveToString;

	public String RecursiveToString.toString(){
		return ReflectionToStringBuilder.toString(this);
	}
}
