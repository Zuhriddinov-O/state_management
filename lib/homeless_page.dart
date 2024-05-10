import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:state_management/observer.dart';

class HomeLessPage extends StatefulWidget {
  const HomeLessPage({super.key});

  @override
  State<HomeLessPage> createState() => _HomeLessPageState();
}

class _HomeLessPageState extends State<HomeLessPage> {
  final e = Observer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final observer = context.watch<Observer>();
    final counter = observer.counter;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(counter.toString(), style: const TextStyle(color: Colors.red, fontSize: 30)),
            const Gap(40),
            ElevatedButton(onPressed: () => observer.increment(), child: const Text("Incrementer")),
            ElevatedButton(onPressed: () => observer.decrement(), child: const Text("Decremented")),
            ElevatedButton(onPressed: () => observer.clear(), child: const Text("Clear")),
          ],
        ),
      ),
    );
  }
}
