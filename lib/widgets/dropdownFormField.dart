import 'package:flutter/material.dart';

class DropdownFormField<T> extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final List<T> items;
  final T? value;
  final String Function(T value)? itemLabel;
  final TextEditingController controller;
  final String? Function(T?)? validator;

  const DropdownFormField({
    super.key,
    required this.labelText,
    required this.icon,
    required this.items,
    required this.controller,
    this.value,
    this.itemLabel,
    this.validator,
  });

  @override
  DropdownFormFieldState<T> createState() => DropdownFormFieldState<T>();
}

class DropdownFormFieldState<T> extends State<DropdownFormField<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: selectedValue,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: Icon(widget.icon),
      ),
      items: widget.items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(widget.itemLabel != null
              ? widget.itemLabel!(item)
              : item.toString()),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
          widget.controller.text = value.toString(); // Update the controller
        });
      },
      validator: widget.validator,
    );
  }
}
