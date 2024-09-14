import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: colors.primary,
        width: 2,
      ),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Escribe un mensaje',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      /* border: outlineInputBorder,
        focusedBorder: outlineInputBorder, */
      suffixIcon: IconButton(
        onPressed: () {
          print(textController.value.text);
        },
        icon: const Icon(Icons.send),
      ),
    );

    return TextFormField(
      controller: textController,
      decoration: inputDecoration,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onChanged: (value) {
        print(value);
      },
      onFieldSubmitted: (value) {
        print(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
