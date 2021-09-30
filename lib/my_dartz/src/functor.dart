// ignore_for_file: use_function_type_syntax_for_parameters

part of my_dartz;

abstract class Functor<F> {
  F map<A, B>(F fa, B f(A a));

  F strengthL<A, B>(F fa, B b) => map(fa, (a) => tuple2(b, a));

  F strengthR<A, B>(F fa, B b) => map(fa, (a) => tuple2(a, b));

  Functor<F> compseF(Functor G) => ComposedFunctor(this, G);
}

class ComposedFunctor<F, G> extends Functor<F> {
  final Functor<F> _F;
  final Functor<G> _G;

  ComposedFunctor(this._F, this._G);

  @override
  F map<A, B>(F fa, B f(A _)) => _F.map(fa, (G ga) => _G.map(ga, f));
}

abstract class FunctorOps<F, A> {
  F map<B>(B f(A a));

  F strengthL<B>(B b);

  F strengthR<B>(B b);
}
