import 'package:bloc_flutter/data/datasources/CharacterRemoteDataSource.dart';
import 'package:bloc_flutter/data/repositories/CharacterRepositoryImpl.dart';
import 'package:bloc_flutter/domain/repositories/CharacterRepository.dart';
import 'package:bloc_flutter/domain/usecases/GetAllCharacters.dart';
import 'package:bloc_flutter/presentation/blocs/characters/CharactersBloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
Future<void> init() async {
// BloC
  sl.registerFactory(() => CharacterBloc(sl()));
// Casos de uso
  sl.registerLazySingleton(() => GetAllCharacters(sl()));
// Repositorios
  sl.registerLazySingleton<CharacteRepository>(
    () => CharacterRepositoryImpl(sl()),
  );
// Data sources
  sl.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSourceImpl(sl()),
  );
// Cliente HTTP
  sl.registerLazySingleton(() => http.Client());
}
