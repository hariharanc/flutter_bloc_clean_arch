

import 'package:flutter/cupertino.dart';

@immutable
sealed class HomeState{}

final class CounterState extends HomeState {
   final int counter;
   CounterState({required this.counter});
}

final class DownloadState extends HomeState{
   final String downloadImage;

   DownloadState({required this.downloadImage});
}