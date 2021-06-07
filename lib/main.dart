import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_bloc/bloc/bloc.dart';
import 'package:flutter_timer_bloc/views/timer.dart';

import 'data/ticker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
      create: (context) => TimerBloc(ticker: Ticker()),
      child: Timer(),
    ));
  }
}
