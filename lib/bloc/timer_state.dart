import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  final int? duration;

  const TimerState(this.duration);

  @override
  List<Object> get props => [duration!];
}

class TimerInitial extends TimerState {
  const TimerInitial(int duration) : super(duration);

  @override
  String toString() => 'TimerInitial {duration: $duration}';
}

class TimerRunPause extends TimerState {
  TimerRunPause(int? duration) : super(duration);

  @override
  String toString() => 'TimerRunPause {duration: $duration}';
}

class TimerRunInProgress extends TimerState {
  TimerRunInProgress(int? duration) : super(duration);

  @override
  String toString() => 'TimerRunInProgress {duration: $duration}';
}

class TimerRunComplete extends TimerState {
  TimerRunComplete() : super(0);
}
