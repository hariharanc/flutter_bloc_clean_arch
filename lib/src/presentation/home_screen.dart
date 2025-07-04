
import 'dart:isolate';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home/home_bloc.dart';
import 'bloc/home/home_event.dart';
import 'bloc/home/home_state.dart';

class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(title: Text('COVID-19 List')),
      body: _buildListCovid(),
    );
  }
}
final HomeBloc homeBloc =HomeBloc();
int _counter = 0;
Widget _buildListCovid() {

  return Container(
    margin: EdgeInsets.all(8.0),
    child: BlocProvider(
      create: (_) => homeBloc,
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
         if(state is CounterState){
           _counter = state.counter;
         }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return _buildCounter(context,homeBloc,state);

            // if (state) {
            //   return _buildCounter(context,homeBloc,state);
            // }
            // else if(state is DownloadState){
            //   return _buildDownload(context,homeBloc,state);
            //
            // }
            // else {
            //   print('listener ${state}');
            //   return Container();
            // }
          },
        ),
      ),
    ),
  );
}

Widget _buildCounter(BuildContext context,HomeBloc homeBloc, HomeState state) {

    return Column(
        children: <Widget>[
          Center(
              child:  Padding(padding: const EdgeInsets.all(30.0),
                  child:Text('Counter: $_counter',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ))

          ),
          Padding(padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(onPressed: () {
              _counter =(state is CounterState)? state.counter:_counter;
              homeBloc..add(CounterIncrementPressed(counter: _counter))
              ..add(DownloadPressed(downloadImg: ""));
              // downloadImag = await
            }, child: Text("Click", style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            ),),),
          Padding(padding: const EdgeInsets.all(30.0),
            child: Text('Update from ioslate ${(state is DownloadState)?state.downloadImage: ''}',style: TextStyle(fontSize: 18),),)

        ]

    );
}


Widget _buildDownload(BuildContext context,HomeBloc homeBloc, DownloadState state) {
  return Column(
      children: <Widget>[
        Padding(padding: const EdgeInsets.all(30.0),
          child: Text('Update from ioslate ${state.downloadImage}',style: TextStyle(fontSize: 18),),)

      ]

  );
}

