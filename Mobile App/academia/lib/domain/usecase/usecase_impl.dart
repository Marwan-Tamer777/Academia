import '../repository/repository.dart';
import 'base_usecase.dart';

class UseCaseImpl implements BaseUseCase<dynamic, dynamic> {
  final Repository _repository;
  UseCaseImpl(this._repository);
}
