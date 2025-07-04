

import 'package:bloc_state_management/src/domain/repository/download_respository.dart';

import '../data_sources/local/download_provider.dart';

class DownloadRepositoryImpl extends DownloadRepository{

  @override
  Future<String> getDownloadImage() {
    final downloadProvider = DownloadProvider();
   return downloadProvider.downloadUsingSpawningIsolateMethodWithErrorHandling();
  }
}