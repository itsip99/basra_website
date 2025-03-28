import 'dart:async';
import 'package:flutter/material.dart';

class ErrorView extends StatefulWidget {
  const ErrorView(this.textError, this.onRefresh, {super.key});
  final String textError;
  final Function onRefresh;

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  late Timer _timer;
  late bool reload;
  int countSecond = 30;

  @override
  void initState() {
    reload = false;
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countSecond == 1) {
        timer.cancel();
        setState(() {
          reload = true;
        });
      } else {
        setState(() {
          countSecond--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Image.asset('assets/images/error.png', fit: BoxFit.contain),
          ),
          const SizedBox(height: 15),
          Text(widget.textError,
              style: const TextStyle(fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center),
          const SizedBox(height: 10),
          reload
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[300],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => widget.onRefresh(),
                  child: const Text('Refresh', style: TextStyle(fontSize: 12)),
                )
              : Text(
                  'Coba kembali dalam ${countSecond.toString()} detik',
                  style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic, color: Colors.grey),
                ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
