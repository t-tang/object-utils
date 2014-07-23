package org.ttang.util.object;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

// Defaults toString to use reflection (from commons-lang)
public aspect RecursiveToStringAspect {

	declare parents : ToString implements ToString;

	public String ToString.toString(){
		return ReflectionToStringBuilder.toString(this);
	}
}
