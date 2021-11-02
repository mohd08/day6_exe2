import 'package:flutter/material.dart';
import 'dear_feature/display_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const TextFieldWidget());
}

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({Key? key}) : super(key: key);


  @override
  _TextFieldWidget createState() => _TextFieldWidget();
}

class _TextFieldWidget extends State<TextFieldWidget> {
  final _textCubit = TextEditingController();
  // String currentText = "";

  @override
  void dispose() {
    _textCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => DisplayText(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Example'),
            ),
            body: Container(
                margin: const EdgeInsets.all(30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<DisplayText, String> (
                        builder: (context, state) {
                          return TextField(
                            controller: _textCubit,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter your text to capitalize"),
                          onChanged: (String? _textCubit) {
                          // currentText = text;
                            context.read<DisplayText>().wordCapitalize(_textCubit);
                            },
                          );
                        },
                      ),
                      // Text(currentText.toUpperCase()),
                      BlocConsumer<DisplayText, String>(
                        listener: (context, state) {},
                        builder: (context, state) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            state,
                            style: const TextStyle(fontSize: 30),
                          ),
                        );
                      })
                    ]
                  )
                )
              )
            )
          );
  }
}