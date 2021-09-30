part of my_dartz;

class Tuple2<A, B> {
  final A value1;
  final B value2;

  R apply<R>(Function2<A, B, R> f) => f(value1, value2);

  Tuple2<C, B> map1<C>(Function1<A, C> f) => Tuple2(f(value1), value2);
  Tuple2<A, C> map2<C>(Function1<B, C> f) => Tuple2(value1, f(value2));

  const Tuple2(this.value1, this.value2);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tuple2 && value1 == other.value1 && value2 == other.value2);

  @override
  int get hashCode => value1.hashCode ^ value2.hashCode;

  @override
  String toString() => '($value1, $value2)';

  Tuple2<A, B> copyWith({
    A? value1,
    B? value2,
  }) {
    return Tuple2(
      value1 ?? this.value1,
      value2 ?? this.value2,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value1': value1,
      'value2': value2,
    };
  }

  factory Tuple2.fromMap(Map<String, dynamic> map) {
    return Tuple2(
      map['value1'] as A,
      map['value2'] as B,
    );
  }
}

class Tuple2Semigroup<A, B> extends Semigroup<Tuple2<A, B>> {
  final Semigroup<A> _value1Semigroup;
  final Semigroup<B> _value2Semigroup;

  Tuple2Semigroup(this._value1Semigroup, this._value2Semigroup);

  @override
  Tuple2<A, B> append(Tuple2<A, B> a1, Tuple2<A, B> a2) => Tuple2(
      _value1Semigroup.append(a1.value1, a2.value1),
      _value2Semigroup.append(a1.value2, a2.value2));
}

Semigroup<Tuple2<A, B>> tuple2Semigroup<A, B>(
        Semigroup<A> value1Semigroup, Semigroup<B> value2Semigroup) =>
    Tuple2Semigroup(value1Semigroup, value2Semigroup);

Tuple2<A, B> tuple2<A, B>(A a, B b) => Tuple2(a, b);
