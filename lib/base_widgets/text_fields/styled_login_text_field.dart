import 'package:flutter/material.dart';

class StyledLoginTextField extends StatefulWidget {
  const StyledLoginTextField({
    Key? key,
    required this.hintText,
    required this.onInput,
    this.controller,
    this.focusNode,
  }) : super(key: key);

  final String hintText;
  final Function(String) onInput;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  State<StyledLoginTextField> createState() => _StyledLoginTextFieldState();
}

class _StyledLoginTextFieldState extends State<StyledLoginTextField> {
  late final TextEditingController controller;
  late final FocusNode focusNode;
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(changedFocusAction);
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void changedFocusAction() {
    setState(() {
      if (hasFocus != focusNode.hasFocus) hasFocus = focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onInput,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hasFocus == false ? widget.hintText : null,
        labelText: widget.hintText,
      ),
    );
  }
}
