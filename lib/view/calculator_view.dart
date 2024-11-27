import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int firstNumber = 0;
  int secondNumber = 0;
  num result = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayOneController.text = firstNumber.toString();
    displayOneController.text = secondNumber.toString();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Display1(
            hint: "Enter first number ",
            controller: displayOneController,
          ),
          const SizedBox(
            height: 30,
          ),
          Display1(
            hint: "Enter secnod number ",
            controller: displayTwoController,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Value is : $result",
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    result = num.tryParse(displayOneController.text)! +
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    result = num.tryParse(displayOneController.text)! -
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    result = num.tryParse(displayOneController.text)! *
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    result = num.tryParse(displayOneController.text)! /
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.divide),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Display1 extends StatelessWidget {
  const Display1(
      {super.key, this.hint = "Enter a number", required this.controller});
  final String? hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.circular(10)),
          labelText: "Number",
          labelStyle: const TextStyle(color: Colors.white),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.white,
          )),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
