import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert'; // JSON işlemleri için

int i = 0;

// A Aproach 1: http aprocah
void main(List<String> args) async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  //var server = await HttpServer.bind("localhost",8080); kullanabilirsin. localhost or 127.0.0.1
  print("Web server started at: http://localhost:8080");
  //this is an infinitive loop
  await for (HttpRequest request in server){
    request.response
    ..write("Hello World! ${i++}")
    ..close();
  }
}

// // B Aproach 2: web socket aproach
// void main(List<String> args) async {

//   var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
//   //var server = await HttpServer.bind("localhost",8080); kullanabilirsin. localhost or 127.0.0.1
//   print("Socket Server Started at: ws://localhost:8080");

// //this is an infinitive loop
//   await for (HttpRequest request in server){
//     if(WebSocketTransformer.isUpgradeRequest(request)){
//       var webSocket = await WebSocketTransformer.upgrade(request);

//       webSocket.listen((data){
//         print("Received Message: $data");
//         //somge logics
//         webSocket.add("Your request completed succesfully");
//       });
//     } else {
//       request.response
//         ..write("This is not socket request")
//         ..close();
//     }
//   }
// }

// void main(List<String> args) async {
//   var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

//   var getAllResponce = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

//   var getSpecificResponce = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));

//   var postResponce = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
//     body: jsonEncode({
//       "userId": 167,
//       "id": 250,
//       "title": "Dart Leng",
//       "body": "Networking"
//     }),
//     headers: {'Content-Type': 'application/json; charset=UTF-8'},
//   );

//   var putResponce = await http.put(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
//     body: jsonEncode({
//       "userId": 167,
//       "id": 250,
//       "title": "Dart Leng",
//       "body": "Networking"
//     }),
//     headers: {'Content-Type': 'application/json; charset=UTF-8'},
//   );

//   var deleteResponse = await http.delete(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));


//   var lastData = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/250"));

//   print(lastData.body);
// }