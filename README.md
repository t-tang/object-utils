object-utils
============

Less mess java.lang.

Getting Java objects off the ground can involve a lot of upfront grunt work. This library aims to save writing yet-another-equals or yet-another-compareTo method. The library uses AspectJ AOP to provide sensible implementations from open source libraries. If the default implementation is not suitable, the method can be overriden by the class.

__Equality__

To implement equals and hashCode in a consistent manner, simply declare the class as ```implements Equality```. AspectJ will delegate to the commons-lang3 reflection class.

__Comparable__

Declaring the class as ```implements Comparable<T>``` will forward compareTo to the commons-lang3 reflection class.

__Comparison__

Extra comparisons are added to the class when declared as ```implements Comparison<T>```. The additional comparisons wrap compareTo, however it is not necessary to declare both ```Comparison<T>``` and ```Comparable<T>```, compareTo is added automatically when using ```Comparison<T>```. The extra operators simplify compareTo code by providing less, lessEqual, greater, greaterEqual and notEqual methods. 

__ToString__

```implements ToString``` will provide an override using commons-lang3 ReflectionToStringBuilder, instance variables are added to the string. ToString is non-recursive.

__RecursiveToString__

This interface recursively adds instance variables into toString.

__DeepClone__

Adding ```implemets DeepClone``` adds a deepClone method delegating to the [Java Deep Cloning library](https://code.google.com/p/cloning/). 

__Mixing it up__

If you need more than a couple of these aspects, a mixin interface will save typing. For example:

```java
public interface CanonicalObject implements Equality, Comparable, DeepClone {}

public class Point implements CanonicalObject {
  private int x;
  private int y;
  // equals, hashCode, compareTo and deepClone are available without additional code
}
```

__Overriding__

Overriding an implementation is straightforward, here is a (nonsensical) example for illustration.

```java
Public MyClass implements ToString {
  // overrides the stock implementation supplied by ToString
  public String toString() {
    return "my toString method";
  }
}
````

