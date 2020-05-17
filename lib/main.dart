import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_navigation/bloc/my_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (context) => MyBloc(),
        child: BlocBuilder<MyBloc, MyState>(
          builder: (context, state) {
            return state is StateA ? PageA() : PageB();
          },
        ),
      ),
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page A'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Hello World'),
          onPressed: () {
            BlocProvider.of<MyBloc>(context).add(MyEvent.eventB);
          },
        ),
      ),
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page B'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Hello World'),
          onPressed: () {
            BlocProvider.of<MyBloc>(context).add(MyEvent.eventA);
          },
        ),
      ),
    );
  }
}
