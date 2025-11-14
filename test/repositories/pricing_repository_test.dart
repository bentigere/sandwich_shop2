import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    const repository = PricingRepository();

    test('returns correct unit price for six-inch', () {
      expect(repository.pricePerItem(isFootlong: false), 7.0);
    });

    test('returns correct unit price for footlong', () {
      expect(repository.pricePerItem(isFootlong: true), 11.0);
    });

    test('calculateTotal returns 0.0 for zero quantity', () {
      expect(repository.calculateTotal(quantity: 0, isFootlong: true), 0.0);
      expect(repository.calculateTotal(quantity: 0, isFootlong: false), 0.0);
    });

    test('calculateTotal returns 0.0 for negative quantity', () {
      expect(repository.calculateTotal(quantity: -3, isFootlong: true), 0.0);
    });

    test('calculateTotal multiplies quantity by footlong price', () {
      expect(repository.calculateTotal(quantity: 3, isFootlong: true), 33.0);
    });

    test('calculateTotal multiplies quantity by six-inch price', () {
      expect(repository.calculateTotal(quantity: 2, isFootlong: false), 14.0);
    });
  });
}