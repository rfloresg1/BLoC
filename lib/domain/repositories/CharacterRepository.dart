import 'package:bloc_flutter/domain/entities/Character.dart';
import 'package:dartz/dartz.dart';

abstract class CharacteRepository {
  Future<Either<Exception, List<Character>>> getAllCharacters();
}
