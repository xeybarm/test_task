import 'package:flutter/material.dart';
import 'package:refactoring_excercise/payment_dialog_model_1.dart';

class PayPage extends StatefulWidget {
  const PayPage({super.key});
  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Pay'),
            onPressed: () => showDialog(
              context: context,
              builder: (ctx) => const PaymentDialog(
                commandName: 'Pay',
              ),
            ),
          ),
        ));
  }
}
