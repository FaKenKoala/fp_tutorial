// ignore_for_file: use_function_type_syntax_for_parameters

part of my_dartz;

abstract class Monad<F> implements Applicative<F> {
  F bind<A, B>(F fa, F f(A a));

  F join(F ffa) => bind(ffa, (F f) => f);

  @override
  F map<A, B>(F fa, B Function(A a) f) => bind(fa, (A a) => pure(f(a)));

  @override
  F ap<A, B>(F fa, F ff) => bind(ff, ((f(_)) => map(fa, f)));
}

/// TODO

/// 只要一个类，没有构造函数，那么他就可以作为mixin使用。不管定义时是class还是mixin
/// mixin 不能作为extends 之后的父类，但是可以作为接口使用，即跟在implements后面

mixin Hello1 {}

class Hello2 {}

class Hello with Hello1, Hello2 implements Hello1 {}
