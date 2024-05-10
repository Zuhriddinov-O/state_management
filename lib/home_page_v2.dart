import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:state_management/observer_exp_v2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<ObserverV2>(context, listen: false).getPigeons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final observer = context.watch<ObserverV2>();
    final items = observer.pigeons;
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.builder(
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: size > 500 ? 5 : 2,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                      "https://sebastianaigner.github.io/demo-image-api/${items[index].path}")),
            );
          },
        ),
      ),
    );
  }
}
