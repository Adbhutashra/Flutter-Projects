import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketTest extends StatefulWidget {
  WebSocketChannel channel = IOWebSocketChannel.connect("wss://ws.ifelse.io/");

  @override
  State<WebSocketTest> createState() => _WebSocketTestState();
}

class _WebSocketTestState extends State<WebSocketTest> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      appBar: AppBar(
        title:  Text("WebSocket Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Send message to the server"),
                controller: _controller,
              ),
            ),
             StreamBuilder(
              stream: widget.channel.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              },
            )
        
      
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: sendData,
      ),
    );
  }

  void sendData() {  
  if (_controller.text.isNotEmpty) {  
    widget.channel.sink.add(_controller.text);  
  }  
}

void dispose() {  
  widget.channel.sink.close();  
 super.dispose();  
}
  }
