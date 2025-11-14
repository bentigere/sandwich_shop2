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
  // Get unit price from PricingRepository (adjust call to match your API)
  final double unitPrice = PricingRepository().getUnitPrice(isFootlong: isFootlong);
  // Return total = unit price * quantity
  return unitPrice * quantity;
}
}

class PricingRepository {
  double calculateOrderTotal({required int quantity, required bool isFootlong}) {
    final double unitPrice = getUnitPrice(isFootlong: isFootlong);
    return unitPrice * quantity;
  }
  
  double getUnitPrice({required bool isFootlong}) {
    // Example pricing: footlongs cost 8.0, regular sandwiches cost 5.0
    return isFootlong ? 8.0 : 5.0;
  }
}