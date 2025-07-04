
import 'package:bloc/bloc.dart' show Bloc;
import 'package:bloc_state_management/src/domain/usecases/download_usecase.dart';


import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
    DownloadUsecase downloadUsecae = DownloadUsecase();

  HomeBloc():super(CounterState(counter: 0)){
    on<CounterIncrementPressed>((event, emit){
      emit(CounterState(counter: event.counter +1 ));
    });

    on<DownloadPressed>((event, emit) async{
      final String downloadImagePath = await downloadUsecae.fetchDownloadImg();
      emit(DownloadState(downloadImage: downloadImagePath));
    });
  }
}
