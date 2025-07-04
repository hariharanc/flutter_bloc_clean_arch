
import 'package:bloc/bloc.dart' show Bloc;
import 'package:bloc_state_management/src/domain/usecases/download_usecase.dart';
import 'package:bloc_state_management/src/resources/download_repository.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeBloc():super(CounterState(counter: 0)){
    final _downloadUsecae = DownloadUsecase();
    on<CounterIncrementPressed>((event, emit){
      emit(CounterState(counter: event.counter +1 ));
    });

    on<DownloadPressed>((event, emit) async{
      final String downloadImagePath = await _downloadUsecae.fetchDownloadImg();
      emit(DownloadState(downloadImage: downloadImagePath));
    });
  }
}
