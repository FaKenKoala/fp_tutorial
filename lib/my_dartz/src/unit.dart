part of my_dartz;

class Unit {
  const Unit._internal();
  @override
  String toString() => "()";
}

const Unit unit = Unit._internal();

class UnitMonoid extends Monoid<Unit> {
  @override
  Unit append(Unit a1, Unit a2) => unit;

  @override
  Unit zero() => unit;
}

final Monoid<Unit> UnitMi = UnitMonoid();
