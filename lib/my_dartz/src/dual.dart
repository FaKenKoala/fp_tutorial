part of my_dartz;

/// 只是一个代理类而已
class DualSemigroup<A> extends Semigroup<A> {
  final Semigroup<A> _aSemigroup;
  DualSemigroup(this._aSemigroup);

  @override
  A append(A a1, A a2) => _aSemigroup.append(a1, a2);
}

Semigroup<A> dualSemigroup<A>(Semigroup<A> si) => DualSemigroup(si);

class DualMonoid<A> extends Monoid<A> {
  final Monoid<A> _aMonoid;

  DualMonoid(this._aMonoid);

  @override
  A zero() => _aMonoid.zero();

  @override
  A append(A a1, A a2) => _aMonoid.append(a1, a2);
}

Monoid<A> dualMonoid<A>(Monoid<A> mi) => DualMonoid(mi);
