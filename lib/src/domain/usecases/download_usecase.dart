
import 'package:bloc_state_management/src/data/repositories/download_repository_impl.dart';

import '../repository/download_respository.dart';

class DownloadUsecase {
  DownloadRepositoryImpl downloadRepository = DownloadRepositoryImpl();
  Future<String> fetchDownloadImg() {
    return downloadRepository.getDownloadImage();
  }
}