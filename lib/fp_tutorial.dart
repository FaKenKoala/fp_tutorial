int calculate() {
  return 6 * 7;
}

typedef B MyFunction1<A, B>(A a);
typedef C MyFunction2<A, B, C>(A a, B b);

class Lenses<In1, Out1, In2, Out2> {
  final MyFunction1<In1, Out2> _getter;

  final MyFunction2<In1, In2, Out1> _setter;

  Lenses(this._getter, this._setter);

  Out2 get(In1 a) => _getter(a);

  Out1 set(In1 a, In2 b) => _setter(a, b);

  MyFunction1<In1, Out1> setC(In2 b) => (a) => set(a, b);

  Out1 modify(In1 a, MyFunction1<Out2, In2> f) => set(a, f(get(a)));

  MyFunction1<In1, Out1> modifyC(MyFunction1<Out2, In2> f) =>
      (a) => modify(a, f);

  
}
