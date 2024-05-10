extension NumX on num {
  double toCelcius() {
    return (this - 32) * 5 / 9;
  }

  double toFahrenheit() {
    return this * 9 / 5 + 32;
  }

  double toKm() {
    return this * 1.60934;
  }

  double toMiles() {
    return this / 1.60934;
  }
}
