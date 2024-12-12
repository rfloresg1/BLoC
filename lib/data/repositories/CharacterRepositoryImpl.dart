import 'package:bloc_flutter/data/datasources/CharacterRemoteDataSource.dart';
import 'package:bloc_flutter/domain/entities/Character.dart';
import 'package:bloc_flutter/domain/repositories/CharacterRepository.dart';
import 'package:dartz/dartz.dart';

class CharacterRepositoryImpl implements CharacteRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Exception, List<Character>>> getAllCharacters() async {
    try {
      final characterModels = await remoteDataSource.getAllCharacters();
      return Right(characterModels
          .map((model) => Character(
              name: model.name, house: model.house, image: model.image))
          .toList());
    } catch (e) {
      return Left(Exception('Error al cargar personajes'));
    }
  }
}
