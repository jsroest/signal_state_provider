# Simple state management solution supporting Signals

The [Signals](https://pub.dev/packages/signals) package, is a way to listen to values and to rebuild the UI when the value changes.

Because rebuilding the UI is a feature of Signals itself we don't need a full fledged state management solution. The only thing we need is to be able to access signals in a clean way.

## StateProvider
StateProvider is a widget that accepts a create method to create an instance of a class. This instance is shared with all descending widgets with the use of an InheritedWidget. The ```StateProvider.of<>``` method will not create bindings between the caller and the provider, as that is what Signals package is for.
```dart  
class CounterPageLocal extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return StateProvider(  
      create: () => CounterState(),  
      builder: (context) {  
        final counterState = StateProvider.of<CounterState>(context);  
        return Scaffold(...);
      }
    );
  }
}
```  

If the class ```CounterState``` implements the Disposable interface, it can react on the ```StateProvider``` being disposed (when it no longer is a part of the widget tree).

## MultiStateProvider
MultiStateProvider is a widget that accepts a list of StateProviders. The only function of this class is to prevent excessive indentation in the source code (similar to the MultiProvider in the [Provider package](https://pub.dev/packages/provider#multiprovider)).
```dart
class MyApp extends StatelessWidget {    
  @override    
  Widget build(BuildContext context) {    
    return MultiStateProvider(    
      stateProviders: [    
        StateProvider<MultiCounter1>(create: () => MultiCounter1()),    
        StateProvider<MultiCounter2>(create: () => MultiCounter2()),    
        StateProvider<MultiCounter3>(create: () => MultiCounter3()),    
      ],    
      builder: (context) {    
        final multiCounter1 = StateProvider.of<MultiCounter1>(context);    
        final multiCounter2 = StateProvider.of<MultiCounter2>(context);    
        final multiCounter3 = StateProvider.of<MultiCounter3>(context);    
        return Scaffold(...);  
      },  
    );
  }
}  
```  
The sample app shows three ways how you can use a StateProvider.
- Shared state across pages, by placing the ```StateProvider```  above the ```MaterialApp```.
- Local state in a page, by placing the ```StateProvider``` directly above the ```Scaffold```.
- Multiple ```StateProviders``` grouped in a ```MultiStateProvider```.

