# Simplified Unidirectional Data Flow

A lightweight state management approach for Flutter that provides the benefits of unidirectional data flow without the complexity of BLoC.

[Try The Live Web Sample](https://nimblesite.github.io/simplified_unidirectional_dataflow/)

[Read the full technical documentation](simplified-unidirectional-data-flow.md)

## Overview

This sample implements a simplified unidirectional data flow pattern that maintains predictable state management while reducing boilerplate code. It combines the best aspects of BLoC (Business Logic Component) architecture with a more straightforward, functional approach.

## Key Features

- **Truly Unidirectional Data Flow** - State flows in one direction through the app, making the data flow predictable and easier to debug
- **Immutable State** - All state objects are immutable using Dart records and `typedef`s
- **Type-safe Error Handling** - Uses algebraic data types for predictable error handling
- **Simplified Business Logic** - Controllers using ValueNotifier replace BLoCs with a more straightforward approach
- **Built-in Pagination Support** - First-class support for infinite scrolling and pagination
- **Minimal Boilerplate** - No event classes, mappers, or complex streams required
- **Dependency Injection** - Simple service location pattern using ioc_container
- **Testable** - Easy to test due to clear separation of concerns and immutable state

## Architecture
 
### Core Components
 
1. **Controllers** - Extend ValueNotifier to handle business logic and state management
2. **DataState** - Algebraic data types representing all possible states (Loading, Loaded, Failed, etc.)
3. **Models** - Immutable data classes using Dart records and `typedef`s
4. **Framework** - Core utilities for state management and data flow
5. **UI** - Pure widgets that rebuild based on state changes

### Key Differences from BLoC

- No separate Event/State classes needed
- Uses ValueNotifier instead of Streams for simpler state management
- No need for complex transformers or stream operators
- Direct method calls instead of event dispatch
- Built-in support for common patterns like pagination
- Simpler testing due to fewer moving parts

## Getting Started

1. **State Definition**

```dart
typedef AppState = ({
  DataState<ImmutableList<Post>, Fault> postsData,
  int pageCount,
});
```

2. **Controller Setup**
```dart
class AppController extends ValueNotifier<AppState> {
  AppController(this.httpClient, this.navigatorKey) 
      : super(createAppState());

  final Client httpClient;
  final GlobalKey<NavigatorState> navigatorKey;
}
```

3. **UI Connection**
```dart
ValueListenableBuilder<AppState>(
  valueListenable: container<AppController>(),
  builder: (context, state, _) => // Build UI based on state
)
```

## Benefits

- **Simplicity**: Easier to understand and maintain than full BLoC implementation
- **Performance**: No unnecessary abstractions or stream transformations
- **Type Safety**: Full type safety with algebraic data types
- **Testing**: Straightforward testing due to immutable state and clear data flow
- **Scalability**: Scales well for both small and large applications
- **Maintainability**: Clear separation of concerns makes code easier to maintain

## Best Practices

1. Keep controllers focused and break them up to share across app components
2. Use records with `typedef`s for immutable state objects
3. Handle all error cases explicitly with algebraic data types
4. Avoid global state except for dependency injection
5. Write widget tests for business logic and user interactions
6. Avoid unnecessary layering and mapping

## Example Usage

See the sample app in this repository for a complete example of:
- Infinite scrolling list
- Error handling
- Loading states
- Animation integration
- Theme management
- Widget testing with golden files

## Further Reading

- [Full Technical Documentation](simplified-unidirectional-data-flow.md)
- [Dart: Algebraic Data Types](https://www.christianfindlay.com/blog/dart-algebraic-data-types)
- [ioc_container Package](https://pub.dev/packages/ioc_container)

## Contributing

Contributions are welcome! Please read our contributing guidelines before submitting pull requests.
