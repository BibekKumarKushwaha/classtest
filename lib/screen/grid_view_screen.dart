import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  final String nameData;
  const GridViewScreen({required this.nameData, super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  late List<String> letters;
  late List<bool> isClicked;

  @override
  void initState() {
    letters = widget.nameData.split('');
    isClicked = List.generate(widget.nameData.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
        backgroundColor: const Color.fromARGB(255, 224, 166, 19),
        foregroundColor: const Color.fromARGB(255, 232, 220, 220),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          for (int i = 0; i < letters.length; i++)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (isClicked[i]) {
                    letters.removeAt(i);
                    isClicked.removeAt(i);
                  } else {
                    isClicked[i] = true;
                  }
                });
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.resolveWith<Color>((states) {
                  if (isClicked[i]) {
                    return const Color.fromARGB(255, 38, 18, 212);
                  } else {
                    return const Color.fromARGB(255, 21, 200, 158);
                  }
                }),
              ),
              child: Text(
                letters[i],
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
            ),
        ],
      ),
    );
  }
}
