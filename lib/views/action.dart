import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_bloc/bloc/timer_bloc.dart';
import 'package:flutter_timer_bloc/bloc/timer_event.dart';
import 'package:flutter_timer_bloc/bloc/timer_state.dart';

class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _mapStateToActionButtons(
        timerBloc: BlocProvider.of<TimerBloc>(context),
      ),
    );
  }

  List<Widget> _mapStateToActionButtons({
    required TimerBloc timerBloc,
  }) {
    final TimerState currentState = timerBloc.state;
    if (currentState is TimerInitial) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () =>
              timerBloc.add(TimerStarted(duration: currentState.duration!)),
        ),
      ];
    }
    if (currentState is TimerRunInProgress) {
      return [
        FloatingActionButton(
          child: Icon(Icons.pause),
          onPressed: () => timerBloc.add(TimerPaused()),
        ),
        FloatingActionButton(
          onPressed: () => timerBloc.add(TimerReset()),
          child: Icon(Icons.replay),
        )
      ];
    }

    if (currentState is TimerRunPause) {
      return [
        FloatingActionButton(
          onPressed: () => timerBloc.add(TimerResumed()),
          child: Icon(Icons.play_arrow),
        ),
        FloatingActionButton(
          onPressed: () => timerBloc.add(TimerReset()),
          child: Icon(Icons.replay),
        ),
      ];
    }
    if (currentState is TimerRunComplete) {
      return [
        FloatingActionButton(
          onPressed: () => timerBloc.add(TimerReset()),
          child: Icon(Icons.replay),
        )
      ];
    }

    return [];
  }
}
