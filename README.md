object-utils
============

__Less mess java.lang__

Getting Java objects off the ground can involve a lot of upfront grunt work. This library aims to save writing yet-another-equals or yet-another-compareTo method. 

Simply declaring a class as ``implements Comparable<T>``` is sufficient. A default implementation will be injected into the class. If the default implementation is not suitable, the method can be overriden by the class.

__Equality__

To implement equals and hashCode in a consistent manner, declare the class as ```implements Equality```. AspectJ will delegate to [EqualsBuilder.reflectionEquals](http://commons.apache.org/proper/commons-lang/javadocs/api-3.1/org/apache/commons/lang3/builder/EqualsBuilder.html#reflectionEquals%28java.lang.Object,%20java.lang.Object,%20boolean%29) and [HashCodeBuilder.reflectionHashCode](http://commons.apache.org/proper/commons-lang/javadocs/api-3.1/org/apache/commons/lang3/builder/HashCodeBuilder.html#reflectionHashCode%28java.lang.Object,%20java.lang.String...%29).

__Comparable__

Declaring the class as ```implements Comparable<T>``` will forward compareTo to [CompareToBuilder](http://commons.apache.org/proper/commons-lang/javadocs/api-3.1/org/apache/commons/lang3/builder/CompareToBuilder.html#reflectionCompare%28java.lang.Object,%20java.lang.Object%29).

__Comparison__
Extra comparisons are available when using ```implements Comparison<T>```. The extra comparisons simplify compareTo code by providing less, lessEqual, greater, greaterEqual and notEqual methods.
The comparisons wrap compareTo, however simply declaring ```Comparison<T>``` also provides a compareTo method.

__ToString__
```implements ToString``` redirects toString to [ReflectionToStringBuilder](http://commons.apache.org/proper/commons-lang/apidocs/org/apache/commons/lang3/builder/ReflectionToStringBuilder.html#toString%28java.lang.Object%29), instance variables will be added to the string. ToString is non-recursive.

__RecursiveToString__
This interface recursively adds instance variables into toString.

__DeepClone__
Adding ```implemets DeepClone``` adds a deepClone method delegating to the [Java Deep Cloning library](https://code.google.com/p/cloning/). 

__Mixin' it up__
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

