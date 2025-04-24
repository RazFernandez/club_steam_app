import 'package:flutter/material.dart';

class CooldownButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final int cooldownSeconds;

  const CooldownButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.width,
    this.cooldownSeconds = 30,
  }) : super(key: key);

  @override
  State<CooldownButton> createState() => _CooldownButtonState();
}

class _CooldownButtonState extends State<CooldownButton> {
  bool isCooldown = false;
  int remainingSeconds = 0;
  late final int cooldown;

  @override
  void initState() {
    super.initState();
    cooldown = widget.cooldownSeconds;
  }

  void _startCooldown() {
    setState(() {
      isCooldown = true;
      remainingSeconds = cooldown;
    });

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return false;

      setState(() {
        remainingSeconds--;
        if (remainingSeconds <= 0) {
          isCooldown = false;
        }
      });

      return remainingSeconds > 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: isCooldown
              ? null
              : () {
                  widget.onPressed();
                  _startCooldown();
                },
          child: Text(widget.text),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(widget.width, 48),
            backgroundColor:
                isCooldown ? Colors.grey : Theme.of(context).primaryColor,
          ),
        ),
        if (isCooldown)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text("Espera $remainingSeconds segundos para reenviar",
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ),
      ],
    );
  }
}
