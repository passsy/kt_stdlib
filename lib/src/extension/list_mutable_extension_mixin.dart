import 'package:dart_kollection/dart_kollection.dart';

abstract class KMutableListExtensionsMixin<T> implements KMutableListExtension<T>, KMutableList<T> {
  @override
  void fill(T value) {
    for (var i = 0; i < size; i++) {
      set(i, value);
    }
  }
}