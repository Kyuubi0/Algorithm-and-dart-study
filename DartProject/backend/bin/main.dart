import 'dart:io';

int i = 0;

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