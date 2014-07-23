object-utils
============

Less mess java.lang.

Getting Java objects off the ground can involve a lot of upfront grunt work. This library aims to save time writing yet-another-equals or yet-another-compareTo method. The code uses AspectJ AOP to provide default sensible implementations from readily available open source libraries. If the default implementation is not suitable, the method can simply be overriden.

__Equality__

To implement equals and hashCode in a consistent manner, simply declare the class as implements Equality. AspectJ will kick in and delegate these methods to the commons-lang3 reflective builders.

__Comparable__

Declare the class as implements Comparable<T> and the compareTo will be delegated to the commons-lang3 reflective builder class.

__Comparison__

Additional comparative operators are added to the class when it is declared as implements Comparison<T>. The additional methods use compareTo, however it is not necessary to declare both the Comparison<T> and Comparable<T> interfaces. Declaring Comparison<T> will automatically add the Comparable<T> interface. The additional operators simplifies code which is using compareTo by providing less, lessEqual, greater, greaterEqual and notEqual methods. 

__ToString__

The ToString interface will override Object's toString with the commons-lang3 ReflectionToStringBuilder which adds the instance variables to the string. ToString is non-recursive. Care must be taken if the object is accessed by multiple threads since the stock implementation cannot know about the objects locking strategy.

__RecursiveToString__

This interface recursively adds instance variables into toString.

__DeepClone__

Adding the DeepClone interface adds a new deepClone methods which delegates to the Java Deep Cloning library.

__Mixing it up__

If you need more than a couple of these interfaces, it is possible to provide a mixin interface to save typing. For example:

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

