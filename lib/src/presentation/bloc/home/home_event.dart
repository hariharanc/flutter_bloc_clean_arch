
sealed class HomeEvent{}

class CounterIncrementPressed extends HomeEvent {
  final int counter;
  CounterIncrementPressed({required this.counter});
}

class DownloadPressed extends HomeEvent {
  final String downloadImg;
  DownloadPressed({required this.downloadImg});
}