class PricingRepository {
  // Prices in GBP
  static const double sixInchPrice = 7.0;
  static const double footlongPrice = 11.0;

  const PricingRepository();

  /// Returns the unit price for the given size.
  double pricePerItem({required bool isFootlong}) =>
      isFootlong ? footlongPrice : sixInchPrice;

  /// Calculates the total price for [quantity] items of the given size.
  /// If [quantity] <= 0 returns 0.0.
  double calculateTotal({required int quantity, required bool isFootlong}) {
    if (quantity <= 0) return 0.0;
    return quantity * pricePerItem(isFootlong: isFootlong);
  }

  /// Calculates the total price for the order based on quantity and sandwich type.
  double calculateOrderTotal({required int quantity, required bool isFootlong}) {
    return calculateTotal(quantity: quantity, isFootlong: isFootlong);
  }
}