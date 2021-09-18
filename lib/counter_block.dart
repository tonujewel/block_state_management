import 'dart:async';

class CounterBlock {
  final stateStreamController = StreamController<int>();

  StreamSink<int> get countSinc => stateStreamController.sink;
}
