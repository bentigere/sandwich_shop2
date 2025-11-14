class OrderRepository {
  int _quantity = 0;
  final int maxQuantity;

  OrderRepository({required this.maxQuantity});

  int get quantity => _quantity;

  bool get canIncrement => _quantity < maxQuantity;
  bool get canDecrement => _quantity > 0;

  void increment() {
    if (canIncrement) {
      _quantity++;
    }
  }

  void decrement() {
    if (canDecrement) {
      _quantity--;
    }
  }

  /// Calculates the total price for the order based on quantity and sandwich type.
  double calculateOrderTotal({required int quantity, required bool isFootlong}) {
    final PricingRepository pricingRepository = PricingRepository();
    return pricingRepository.calculateOrderTotal(quantity: quantity, isFootlong: isFootlong);
  }
}

class PricingRepository {
  double calculateOrderTotal({required int quantity, required bool isFootlong}) {}
}