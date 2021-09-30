part of my_dartz;

/// semigroup就是有一个方法，将两个相同类型的值，使用一个方法组合起来，返回一个同一类型的值
abstract class Semigroup<A> {
  A append(A a1, A a2);

  Endo<A> appendC(A a1) => (A a2) => append(a1, a2);
}
