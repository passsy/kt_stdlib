import "package:kt_dart/collection.dart";
import "package:kt_dart/src/collection/impl/dart_iterable.dart";

class EmptyList<T> extends Object implements KtList<T> {
  const EmptyList();

  @override
  List<T> get list => List.unmodifiable(const []);

  @override
  List<T> asList() => List.unmodifiable(const []);

  @override
  bool contains(T element) => false;

  @override
  bool containsAll(KtCollection<T> elements) {
    return elements.isEmpty();
  }

  @override
  T get(int index) {
    throw IndexOutOfBoundsException(
        "Empty list doesn't contain element at index: $index.");
  }

  @override
  T operator [](int index) {
    throw IndexOutOfBoundsException(
        "Empty list doesn't contain element at index: $index.");
  }

  @override
  int indexOf(T element) => -1;

  @override
  bool isEmpty() => true;

  @override
  KtIterator<T> iterator() => _EmptyIterator<T>();

  @override
  int lastIndexOf(T element) => -1;

  @override
  KtListIterator<T> listIterator([int index = 0]) {
    return _EmptyIterator<T>();
  }

  @override
  int get size => 0;

  @override
  KtList<T> subList(int fromIndex, int toIndex) {
    if (fromIndex == 0 && toIndex == 0) return this;
    throw IndexOutOfBoundsException(
        "fromIndex: $fromIndex, toIndex: $toIndex, size: $size");
  }

  @override
  String toString() => "[]";

  @override
  int get hashCode => 1;

  @override
  bool operator ==(Object other) => other is KtList && other.isEmpty();

  @override
  Iterable<T> get iter => EmptyDartIterable();
}

class _EmptyIterator<T> implements KtListIterator<T> {
  @override
  bool hasNext() => false;

  @override
  bool hasPrevious() => false;

  @override
  T next() {
    throw const NoSuchElementException();
  }

  @override
  int nextIndex() => 0;

  @override
  T previous() {
    throw const NoSuchElementException();
  }

  @override
  int previousIndex() => -1;
}
