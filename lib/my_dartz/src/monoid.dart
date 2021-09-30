part of my_dartz;

/// 在semigroup的基础上，多了一个zero函数，返回泛型值
abstract class Monoid<A> extends Semigroup<A> {
  A zero();
}

class _AnonymousMonoid<A> extends Monoid<A> {
  final Function0<A> _zero;
  final Function2<A, A, A> _append;

  _AnonymousMonoid(this._zero, this._append);

  @override
  A zero() => _zero();

  @override
  A append(A a1, A a2) => _append(a1, a2);
}

Monoid<A> monoid<A>(Function0<A> zero, Function2<A, A, A> append) =>
    _AnonymousMonoid(zero, append);
