import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as english_words;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<english_words.WordPair> names = [];
  final Set<String> namesSelected = {};

  void handleSelectName({required String nameSelected}) {
    setState(() {
      if (namesSelected.contains(nameSelected)) {
        namesSelected.remove(nameSelected);
      } else {
        namesSelected.add(nameSelected);
      }
    });
  }

  bool isNameSelected({required String name}) => namesSelected.contains(name);

  void goToFavorites() {
    Navigator.pushNamed(context, "/favorites", arguments: namesSelected);
  }

  @override
  void initState() {
    super.initState();
    names.addAll(english_words.generateWordPairs().take(40));
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = TextButton.styleFrom(
        primary: Colors.grey[800],
        alignment: Alignment.centerLeft,
        textStyle: const TextStyle(fontSize: 18),
        padding: const EdgeInsets.all(24),
        minimumSize: const Size(double.infinity, 56));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Name App"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: goToFavorites,
            tooltip: 'Saved Names',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: names.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                style: buttonStyle,
                onPressed: () {
                  handleSelectName(nameSelected: names[index].asPascalCase);
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(names[index].asPascalCase),
                      Icon(
                        isNameSelected(name: names[index].asPascalCase)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: isNameSelected(name: names[index].asPascalCase)
                            ? Colors.red[500]
                            : Colors.grey[600],
                      )
                    ]),
              ),
              index != names.length - 1
                  ? const Divider()
                  : const SizedBox.shrink()
            ],
          );
        },
      ),
    );
  }
}
