import 'package:flutter/material.dart';
import 'package:refactoring_excercise/payment_dialog_model_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Excercise',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter'),
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
  @override
  Widget build(BuildContext context) {
    var balance = 12.0;
    var price = 5.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Pay'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => PaymentDialog(
                  balance: balance,
                  totalPrice: price,
                  commandName: 'Pay',
                  onCommandFunction: () async {
                    if (balance > price) {
                      balance = balance - price;
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('error')));
                    }
                  }),
            );
          },
        ),
      ),
    );
  }
}
