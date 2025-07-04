


import 'package:bloc_state_management/src/resources/download_repository.dart';

class DownloadUsecase {
  final downloadProvider = DownloadRepository();
  Future<String> fetchDownloadImg() =>  downloadProvider.fetchDownloadImg();
}