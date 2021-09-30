part of my_dartz;

abstract class Applicative<F> implements Functor<F> {
  F pure<A>(A a);

  F ap<A, B>(F fa, F ff);

  F get nothing => pure(unit);

  @override
  F map<A, B>(F fa, B Function(A a) f) => ap(fa, pure(f));
}

abstract class ApplicativeOps<F, A> implements FunctorOps<F, A> {
  F ap<B>(covariant F ff);

  @override
  F map<B>(B Function(A a) f);
}

