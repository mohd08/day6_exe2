import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayText extends Cubit <String>{

  DisplayText() : super ('');

  void wordCapitalize(word) => emit((state.replaceAll(state, word)).toUpperCase());
}

void dispose() {}