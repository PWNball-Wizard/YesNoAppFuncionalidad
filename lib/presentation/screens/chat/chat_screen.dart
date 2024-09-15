import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

/// This function takes a parameter and performs an operation.
///
/// Detailed description of what the function does, including:
/// - The purpose of the function.
/// - The parameters it accepts.
/// - The return type and what it represents.
/// - Any side effects or exceptions that might be thrown.
///
/// Example usage:
/// ```dart
/// final result = functionName(parameter);
/// ```
///
/// Note: Additional notes or warnings about the function.
/// This function takes
class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 4.0),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.lollapaloozamania.com/wp-content/uploads/2017/09/Dua-Lipa.jpg')),
          ),
          title: const Text('Mi vieja'),
          centerTitle: false,
        ),
        body: const _ChatView()
        //$ Para acceder a un widget mediante el key debemos usar la función find.byKey(key)
        //$ Ejemplo: find.byKey(const Key('myKey'))
        //Container(color: Colors.red),
        );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    //$ este es el constructor de la clase _ChatView que recibe un parámetro llamado key
    Key? key,
    //$ El key es un identificador único para un widget
    //$ Se utiliza para identificar un widget de forma única
    //$ Se puede utilizar para encontrar un widget en un árbol de widgets
    //$ Se puede utilizar para mantener el estado de un widget
    //$podemos asignarle un valor único a la key de la siguiente manera: key: UniqueKey()
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
            controller: chatProvider.scrollController,
            itemCount: chatProvider.messageList.length,
            itemBuilder: (context, index) {
              final message = chatProvider.messageList[index];
              return message.fromWho == FromWho.mine
                  ? MyMessageBubble(message)
                  : HerMessageBubble(message);
              /* return (index % 2 == 0)
                  ? const MyMessageBubble()
                  : const HerMessageBubble(); */
              /* ListTile(
                title: Text("Hola"),
              ); */
            },
          )),
          /* Container(color: Colors.red) */
          MessageFieldBox(
            onValueSend: (value) {
              chatProvider.addMessage(value.toString());
            },
          ),
        ],
      ),
    );
  }
}
