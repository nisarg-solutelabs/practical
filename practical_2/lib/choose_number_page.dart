import 'package:flutter/material.dart';
import 'package:practical_2/output_screen.dart';
import 'package:practical_2/snackbar.dart';
class ChooseNumberPage extends StatefulWidget {
  const ChooseNumberPage({
    super.key,
  });

  @override
  State<ChooseNumberPage> createState() => _ChooseNumberPageState();
}

class _ChooseNumberPageState extends State<ChooseNumberPage> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: _controller,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.isEmpty) {
                    showSnackBar(
                      context,
                      'enter value',
                    );
                  } else if (int.tryParse(_controller.text) == null) {
                    showSnackBar(
                      context,
                      'enter valid value',
                    );
                  } else if (int.parse(_controller.text) <= 0) {
                    showSnackBar(
                      context,
                      'enter more than zero',
                    );
                  } else {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return OutputScreen(
                          number: int.parse(_controller.text),
                        );
                      },
                    ));
                  }
                },
                child: const Text(
                  'Next Sceen',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
