import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Custom buttons")),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              // Single btn
              SelectableButton(width: 400, height: 100),

              SizedBox(height: 16),

              // btn jrern
              SelectableButton(width: 400, height: 60),
              SizedBox(height: 8),
              SelectableButton(width: 400, height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectableButton extends StatefulWidget {
  final double width;
  final double height;

  const SelectableButton({
    super.key,
    this.width = 400,
    this.height = 100,
  });

  @override
  State<SelectableButton> createState() => SelectableButtonState();
}

class SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  // Getters 
  String get statusText => isSelected ? 'Selected' : 'Not Selected';
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color? get bgColor => isSelected ? Colors.blue[500] : Colors.blue[50];

  void _toggleSelected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: _toggleSelected,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
        ),
        child: Center(
          child: Text(
            statusText,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
