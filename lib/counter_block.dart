import 'dart:async';

enum CounterAction { Increment, Dcrement, Reset }

class CounterBlock {
  int counter = 0;

  // ignore: close_sinks
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get countSink => _stateStreamController.sink;
  Stream<int> get countStream => _stateStreamController.stream;

  // ignore: close_sinks
  final _eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  Stream<CounterAction> get eventStream => _eventStreamController.stream;

  CounterBlock() {
    eventStream.listen((event) {
      if (event == CounterAction.Increment)
        counter++;
      else if (event == CounterAction.Dcrement)
        counter--;
      else if (event == CounterAction.Reset) counter = 0;

      countSink.add(counter);
    });
  }
}
