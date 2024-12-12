import 'package:bloc_flutter/presentation/blocs/characters/CharactersBloc.dart';
import 'package:bloc_flutter/presentation/screens/CharactersScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'InjectionContainer.dart' as injection_container;

void main() async {
  await injection_container.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => injection_container.sl<CharacterBloc>(),
        child: const CharactersScreen(),
      ),
    );
  }
}
