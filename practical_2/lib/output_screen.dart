import 'package:flutter/material.dart';
import 'package:practical_2/random.dart';

class OutputScreen extends StatefulWidget {
  const OutputScreen({
    super.key,
    required this.number,
  });
  final int number;

  @override
  State<OutputScreen> createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  int selectedButton = 0;
  List<int> doneButton = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedButton = getRandom(
        widget.number,
        doneButton,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(50),
        itemCount: widget.number,
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
              (states) => index == selectedButton
                  ? Colors.blue
                  : doneButton.contains(index)
                      ? Colors.red
                      : Colors.white,
            )),
            onPressed: () {
              if (index == selectedButton) {
                setState(() {
                  if (!doneButton.contains(selectedButton)) {
                    doneButton.add(selectedButton);
                  }
                  selectedButton = getRandom(
                    widget.number,
                    doneButton,
                  );
                });
              }
            },
            child: Text(
              'Button $index',
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
