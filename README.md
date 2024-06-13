
# Simple state management solution supporting Signals

The [Signals](https://pub.dev/packages/signals) package, is a way to listen to values and to rebuild the UI when the value changes.

Because rebuilding the UI is a feature of Signals itself we don't need a full fledged state management solution. The only thing we need is to be able to access Signal in a clean way.

## StateProvider
StateProvider is a widget that accepts a create method to create an instance of a class. This instance is shared with all descending widgets with the help of an InheritedWidget. This class will not create any bindings between the caller and the provider, as that is what Signals is for.

If the class implements the Disposable interface, it can react on the StateProvider being disposed.

## MultiStateProvider
MultiStateProvider is a widget that accepts a list of StateProviders. The only function of this class is to prevent excessive indentation in the source code (similar to the MultiProvider in the [Provider package](https://pub.dev/packages/provider#multiprovider)).

The sample shows three ways how you can use a StateProvider.
- Shared state across pages
- Local state in a page
- The use of the MultiStateProvider  