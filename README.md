# 🥪 Sandwich Shop

A Flutter mobile application for managing sandwich orders with customizable options. Users can select sandwich types, bread varieties, adjust quantities, and add special notes to their orders.

## ✨ Features

- **Quantity Management**: Add or remove sandwiches with a maximum quantity limit (default: 5)
- **Sandwich Size Selection**: Toggle between six-inch and footlong options
- **Bread Type Selection**: Choose from white, wheat, or wholemeal bread using a dropdown menu
- **Special Notes**: Add custom notes to your order (e.g., "Extra mayo", "No onions")
- **Visual Feedback**: Sandwich emoji (🥪) displays proportional to quantity ordered
- **Input Validation**: Prevents quantity from going below 0 or exceeding the maximum

## 🛠️ Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK**: Version 2.17.0 or higher ([Install Flutter](https://flutter.dev/docs/get-started/install))
- **Dart SDK**: Included with Flutter
- **IDE**: Visual Studio Code, Android Studio, or IntelliJ IDEA
- **Git**: For cloning the repository

## 📥 Installation & Setup

### 1. Clone the Repository

```bash
git clone <repository-url>
cd sandwich_shop
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the Application

#### On Android/iOS Emulator or Physical Device

```bash
flutter run
```

#### On Web Browser

```bash
flutter run -d chrome
```

#### On macOS

```bash
flutter run -d macos
```

## 📱 Usage

### Main Screen (Order Screen)

1. **View Current Order**: The display shows your current sandwich quantity, bread type, size, and any special notes
2. **Select Sandwich Size**: Use the toggle switch to choose between "six-inch" and "footlong"
3. **Choose Bread Type**: Select your preferred bread type from the dropdown menu (white, wheat, wholemeal)
4. **Add Special Notes**: Type any special instructions in the text field (e.g., "Extra lettuce", "No pickles")
5. **Adjust Quantity**:
   - Click the **Add** (green) button to increase quantity
   - Click the **Remove** (red) button to decrease quantity
   - Quantity cannot go below 0 or exceed the maximum (5 by default)

### Example Order Flow

```
1. Start with 0 sandwiches (white footlong)
2. Toggle to select bread type → "wheat"
3. Toggle size → "six-inch"
4. Add note → "Extra mayo, no onions"
5. Click Add button 3 times → 3 wheat six-inch sandwiches
```

## 🧪 Testing

### Run All Tests

```bash
flutter test
```

### Run Specific Test File

```bash
flutter test test/repositories/order_repository_test.dart
flutter test test/views/widget_test.dart
```

### Test Coverage

The app includes comprehensive tests for:
- **Unit Tests**: [`OrderRepository`](lib/repositories/order_repository.dart) quantity logic
- **Widget Tests**: UI components and user interactions
  - App initialization
  - Quantity increment/decrement
  - Bread type selection
  - Size toggle
  - Note text entry
  - Custom button rendering

Run tests with verbose output:

```bash
flutter test -v
```

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point and main UI screens
├── repositories/
│   └── order_repository.dart   # Business logic for order management
└── views/
    └── app_styles.dart         # Shared text styles and theme constants

test/
├── repositories/
│   └── order_repository_test.dart   # Unit tests for OrderRepository
└── views/
    └── widget_test.dart             # Widget and integration tests
```

### Key Files

| File | Purpose |
|------|---------|
| [`lib/main.dart`](lib/main.dart) | Contains `App`, `OrderScreen`, `StyledButton`, and `OrderItemDisplay` widgets |
| [`lib/repositories/order_repository.dart`](lib/repositories/order_repository.dart) | Manages sandwich quantity state with min/max validation |
| [`lib/views/app_styles.dart`](lib/views/app_styles.dart) | Defines reusable `TextStyle` constants |
| [`pubspec.yaml`](pubspec.yaml) | Project dependencies and metadata |

## 📦 Dependencies

### Core Dependencies
- **flutter**: Flutter SDK framework
- **cupertino_icons**: iOS-style icons

### Dev Dependencies
- **flutter_test**: Testing framework
- **flutter_lints**: Lint rules for code quality

See [`pubspec.yaml`](pubspec.yaml) for the complete dependency list.

## 🏗️ Architecture

The app follows a simple layered architecture:

- **UI Layer** (`main.dart`): Flutter widgets for user interface
  - `App`: Root widget
  - `OrderScreen`: Stateful screen managing order state
  - `StyledButton`: Reusable button component
  - `OrderItemDisplay`: Display component for order details

- **Repository Layer** (`order_repository.dart`): Business logic
  - `OrderRepository`: Manages sandwich quantity with validation

- **Styles Layer** (`app_styles.dart`): Design constants
  - Text styles for consistent UI

## 🐛 Known Limitations

- **No Persistence**: Orders are not saved to device storage; data resets on app restart
- **No Backend Integration**: Currently a local app with no server communication
- **Web Support**: Basic web support available but optimized for mobile
- **Maximum Quantity**: Fixed at 5 sandwiches (configurable via `OrderScreen` constructor)

## 🚀 Future Improvements

- [ ] Add order history/persistence using local database (Hive or SQLite)
- [ ] Implement checkout and payment functionality
- [ ] Add more sandwich customization options (toppings, sauces)
- [ ] Integrate with backend API for menu management
- [ ] Add order status tracking
- [ ] Implement user authentication
- [ ] Add multi-language support
- [ ] Order history and favorites

## 📝 License

This project is provided as-is for educational purposes.

## 👤 Author
https://github.com/bentigere/sandwich_shop2
Created as a Flutter learning project.

---

**Last Updated**: 2024

For more information about Flutter, visit [flutter.dev](https://flutter.dev)
