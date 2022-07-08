import "package:flutter/material.dart";

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Set<String> namesSelected =
        ModalRoute.of(context)?.settings.arguments as Set<String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: namesSelected.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 32),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      namesSelected.elementAt(index),
                      style: const TextStyle(fontSize: 18),
                    )),
                index != namesSelected.length - 1
                    ? const Divider()
                    : const SizedBox.shrink()
              ],
            );
          }),
    );
  }
}
