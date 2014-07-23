package org.ttang.util.object;

import com.rits.cloning.Cloner;

public abstract aspect DeepCloneAspect {
	
	declare parents : DeepClone implements DeepClone;

	private static Cloner cloner = new Cloner();

	@SuppressWarnings("unchecked")
	public T DeepClone<T>.deepClone(){
		return (T)cloner.deepClone(this);
	}
}
