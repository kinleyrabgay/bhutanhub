import 'package:bhutanhub/core/common/entities/product.entity.dart';
import 'package:bhutanhub/core/constants/enums.dart';
import 'package:bhutanhub/src/features/bhutanhub/home/domain/usecases/fetch.products.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required FetchProduct fetchProduct,
  })  : _fetchProduct = fetchProduct,
        super(
          const HomeInitial(),
        ) {
    // --- Fetch Products ---
    on<FetchProductEvent>(_fetchProductHandler);
  }

  final FetchProduct _fetchProduct;

  Future<void> _fetchProductHandler(
    FetchProductEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final result = await _fetchProduct(
      FetchProductParams(
        key: event.key,
        subKey: event.subKey,
      ),
    );

    result.fold(
      (failure) => emit(HomeError(message: failure.message)),
      (response) => emit(
        TabSubKey.popular.toString() == event.subKey
            ? PopularProductLoaded(products: response, subKey: event.subKey)
            : NewProductsLoaded(products: response, subKey: event.subKey),
      ),
    );
  }
}
