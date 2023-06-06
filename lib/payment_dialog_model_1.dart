import 'package:flutter/material.dart';

import 'pages/widgets/price_text.dart';

class PaymentDialog extends StatefulWidget {
  const PaymentDialog({
    Key? key,
    this.commandName = '',
    this.commandButtonColor = Colors.blue,
  }) : super(key: key);

  final String commandName;
  final Color commandButtonColor;

  @override
  State<PaymentDialog> createState() => _PaymentDialogState();
}

double balance = 12.0;
double price = 5.0;

class _PaymentDialogState extends State<PaymentDialog> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Column(
            children: [
              PriceText(
                title: 'Balance: ',
                value: '$balance \$',
              ),
              PriceText(
                title: 'Total Price: ',
                value: '$price \$',
              ),
              const PriceText(
                title: 'Commision: ',
                value: '0.0 \$',
              ),
              const Divider(thickness: 1),
              PriceText(
                title: 'New balance: ',
                value: '${balance - price} \$',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (balance > price) {
                  setState(() {
                    balance = balance - price;
                  });
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('error')));
                }
              },
              child: Text(
                widget.commandName,
                style:
                    TextStyle(color: widget.commandButtonColor, fontSize: 12),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel',
                    style: TextStyle(color: Colors.black, fontSize: 12)))
          ]);
    });
  }
}
