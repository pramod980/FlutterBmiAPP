import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchController = TextEditingController();
  var bgcolor = Colors.indigo.shade200;
  var total = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: Container(
              width: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BMI Calculator",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: weightController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.line_weight),
                        label: Text("Enter your weight")),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: feetController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.height),
                        label: Text("Enter height in feet")),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: inchController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.height),
                        label: Text("Enter your height inch")),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var weight = weightController.text.toString();
                        var feet = feetController.text.toString();
                        var inch = inchController.text.toString();
                        if (weight != "" && feet != "" && inch != "") {
                          var pweight = int.parse(weight);
                          var pfeet = int.parse(feet);
                          var pinch = int.parse(inch);

                          var tinch = (pfeet * 12) + pinch;
                          var tcm = tinch * 2.54;
                          var tm = tcm / 100;
                          var bmi = pweight / (tm * tm);
                          var msg = "";
                          if (bmi < 18) {
                            msg = "You are underweight";
                            bgcolor = Colors.red.shade200;
                          } else if (bmi > 25) {
                            msg = "You are overweight";
                            bgcolor = Colors.red.shade300;
                          } else {
                            msg = "You are healthy";
                            bgcolor = Colors.green.shade200;
                          }
                          setState(() {
                            total =
                                " $msg \n Your bmi is: ${bmi.toStringAsFixed(4)}";
                          });
                        } else {
                          setState(() {
                            total = "Fill the missing field";
                          });
                        }
                      },
                      child: Text("Calculate")),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    total,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
