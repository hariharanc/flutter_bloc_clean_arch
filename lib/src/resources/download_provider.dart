
import 'dart:isolate';

class DownloadProvider {
  // Error Handling
  Future<String> downloadUsingSpawningIsolateMethodWithErrorHandling() async {
    const String downloadLink = 'Image download Link';
    // create the port to receive data from
    final resultPort = ReceivePort();
    // Adding errorsAreFatal makes sure that the main isolates receives a message
    // that something has gone wrong
    try {
      await Isolate.spawn(
        _readAndParseJson,
        [resultPort.sendPort, downloadLink],
        errorsAreFatal: true,
        onExit: resultPort.sendPort,
        onError: resultPort.sendPort,
      );
    } on Object {
      // check if sending the entrypoint to the new isolate failed.
      // If it did, the result port won’t get any message, and needs to be closed
      resultPort.close();
    }

    final response = await resultPort.first;

    if (response == null) {
      // this means the isolate exited without sending any results
      // TODO throw error
      return 'No message';
    } else if (response is List) {
      // if the response is a list, this means an uncaught error occurred
      final errorAsString = response[0];
      final stackTraceAsString = response[1];
      // TODO throw error
      return 'Uncaught Error';
    } else {
      return response as String;
    }
  }



  Future<void> _readAndParseJson(List<dynamic> args) async {
    SendPort resultPort = args[0];
    String fileLink = args[1];

    String newImageData = fileLink;

    await Future.delayed(const Duration(seconds: 2));

    Isolate.exit(resultPort, newImageData);
  }

}