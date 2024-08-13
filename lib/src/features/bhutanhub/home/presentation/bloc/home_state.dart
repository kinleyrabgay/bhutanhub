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
class HomeLoaded extends HomeState {
  const HomeLoaded({
    this.popularProducts = const [],
    this.newProducts = const [],
    this.trendings = const [],
    this.isLoading,
  });

  final List<ProductEntity> popularProducts;
  final List<ProductEntity> newProducts;
  final List<ProductEntity> trendings;
  final bool? isLoading;

  HomeLoaded copyWith({
    List<ProductEntity>? popularProducts,
    List<ProductEntity>? newProducts,
    List<ProductEntity>? trendings,
    bool? isLoading,
  }) {
    return HomeLoaded(
      popularProducts: popularProducts ?? this.popularProducts,
      newProducts: newProducts ?? this.newProducts,
      trendings: trendings ?? this.trendings,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<List<ProductEntity>> get props =>
      [popularProducts, newProducts, trendings];
}

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
