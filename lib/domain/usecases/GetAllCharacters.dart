import 'package:bloc_flutter/domain/entities/Character.dart';
import 'package:bloc_flutter/domain/repositories/CharacterRepository.dart';
import 'package:dartz/dartz.dart';

class GetAllCharacters {
  final CharacteRepository repository;
  GetAllCharacters(this.repository);

  Future<Either<Exception, List<Character>>> call() async {
    return await repository.getAllCharacters();
  }
}
