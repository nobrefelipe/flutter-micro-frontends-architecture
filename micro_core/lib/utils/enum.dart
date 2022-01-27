abstract class Enum<T> {
  final T _value;
  const Enum(this._value);
  T get value => _value;
}
