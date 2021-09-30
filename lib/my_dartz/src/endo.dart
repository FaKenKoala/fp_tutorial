part of my_dartz;

/// Endo就是输入一个参数，返回同类型参数的函数
typedef Endo<A> = A Function(A a);

Monoid<Endo<A>> endoMi<A>() =>
    monoid(() => (A a) => a, (Endo<A> p0, Endo<A> p1) => (A a) => p0(p1(a)));
final Monoid<Endo> EndoMi = endoMi();

Monoid<Endo<A>> dualEndoMi<A>() => dualMonoid(endoMi());
final Monoid<Endo> DualEndoMi = dualMonoid(EndoMi);
