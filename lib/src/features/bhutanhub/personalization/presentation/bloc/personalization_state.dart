part of 'personalization_bloc.dart';

@immutable
abstract class PersonalizationState extends Equatable {
  const PersonalizationState();

  @override
  List<Object> get props => [];
}

class PersonalizationInitial extends PersonalizationState {
  const PersonalizationInitial();
}

class ProductCreationLoading extends PersonalizationState {}

class ProductCreationSuccess extends PersonalizationState {}

class ProductCreationFailed extends PersonalizationState {
  const ProductCreationFailed(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
