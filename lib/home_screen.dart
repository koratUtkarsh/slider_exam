import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double Value = 1;
  String pettern = '1';

  void _generatePattern(double value) {
    String pattern = '';
    for (int i = 1; i <= value; i++) {
      for(int j= 1; j<=i;j++) {
        pattern += '${List.generate(i, (j) => j + 1).join()} \n';
      }
    }
    setState(() {
      pettern = pattern;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Petten"),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(child: Text("Prttern", style: TextStyle(fontSize: 20),), decoration: BoxDecoration(color: Colors.amber,border: Border.all(width: 1,color: Colors.amber),),),
              const SizedBox(height: 20),
              Slider(
                activeColor: Colors.amber,
                inactiveColor: Colors.purpleAccent.shade100,
                value: Value,
                min: 1,
                max: 10,
                divisions: 9,
                label: Value.round().toString(),
                onChanged: (value) {
                  setState(() {
                    Value = value;
                  });
                },
                onChangeEnd: _generatePattern,
              ),
               SizedBox(height: 18),
              Text(
                pettern,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}