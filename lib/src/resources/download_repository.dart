
import 'package:bloc_state_management/src/resources/download_provider.dart';

class DownloadRepository {

  final downloadProvider = DownloadProvider();

 Future<String> fetchDownloadImg() =>  downloadProvider.downloadUsingSpawningIsolateMethodWithErrorHandling();
}