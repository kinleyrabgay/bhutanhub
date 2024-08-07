part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

// --- Loading
final class HomeLoading extends HomeState {}

// --- Error
final class HomeError extends HomeState {
  const HomeError({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

// --- Loaded
final class NewProductsLoaded extends HomeState {
  const NewProductsLoaded({
    required this.products,
    required this.subKey,
  });
  final List<ProductEntity> products;
  final String subKey;

  @override
  List<Object> get props => [products];
}

final class PopularProductLoaded extends HomeState {
  const PopularProductLoaded({
    required this.products,
    required this.subKey,
  });
  final List<ProductEntity> products;
  final String subKey;

  @override
  List<Object> get props => [products];
}
