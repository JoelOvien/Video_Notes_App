import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:pod_player/pod_player.dart';

class TextEditor extends StatefulWidget {
  final PodPlayerController controller;

  const TextEditor({Key? key, required this.controller}) : super(key: key);

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  final QuillController _controller = QuillController.basic();
  final TextEditingController _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.lightBlueAccent,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ]),
                child: TextFormField(
                  controller: _noteController,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _noteController.text = _noteController.text +
                    " " +
                    "${widget.controller.currentVideoPosition.toString().replaceRange(0, 1, "").replaceRange(7, 13, "").replaceFirst(":", "").replaceAll(".", "")}";
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
