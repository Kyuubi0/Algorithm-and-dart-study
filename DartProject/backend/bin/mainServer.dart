import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert'; // JSON işlemleri için

// WebSocket yaklaşımı
void main(List<String> args) async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  print("Socket Server Started at: ws://localhost:8080");

  // Sonsuz döngü
  await for (HttpRequest request in server) {
    if (WebSocketTransformer.isUpgradeRequest(request)) {
      WebSocketTransformer.upgrade(request).then((WebSocket websocket) {
        print('New WebSocket connection established');
        websocket.listen((data) {
          print("Incoming: $data");
          // Sunucu tarafından yanıt gönderiliyor
          websocket.add("Server response: Hello, WebSocket client!");
        },
        onDone: () {
          print('WebSocket connection closed');
        },
        onError: (error) {
          print('WebSocket error: $error');
        });
      });
    } else {
      request.response
        ..statusCode = HttpStatus.forbidden
        ..close();
    }
  }
}