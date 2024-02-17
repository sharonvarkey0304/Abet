import 'package:flutter/material.dart';
import 'package:loginpage/chatbot/api_key.dart';

class chatbot extends StatefulWidget {
  const chatbot({super.key});

  @override
  State<chatbot> createState() => _chatbotState();
}

class _chatbotState extends State<chatbot> {
  final _question = TextEditingController();
  String _answerText = '';
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'CODY',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 238, 4),
      ),
      body: Column(children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            reverse: true,
            children: [
              Text(
                _answerText,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(height: 1.5),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromARGB(255, 255, 238, 4),
                  ),
                  child: TextField(
                    controller: _question,
                    decoration: InputDecoration(
                        hintText: 'Ask your question',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              _loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _sendRequest,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 255, 238, 4),
                          fixedSize: Size(50, 50)),
                      child: Icon(
                        Icons.send,
                        color: Colors.black,
                      ),
                    )
            ],
          ),
        )
      ]),
    );
  }

  _sendRequest() async {
    setState(() {
      _loading = true;
    });

    final result = await ApiClient.postRequest(msg: _question.text);
    setState(() {
      _loading = false;
    });

    if (result != null) {
      setState(() {
        _answerText = result;
        _question.clear();
      });
    }
  }
}
