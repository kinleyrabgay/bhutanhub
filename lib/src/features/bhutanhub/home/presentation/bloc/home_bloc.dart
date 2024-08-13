import 'package:bhutanhub/core/common/entities/product.entity.dart';
import 'package:bhutanhub/core/constants/tab.keys.dart';
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
    on<FetchProductEvent>(_fetchProductHandler);
  }

  final FetchProduct _fetchProduct;
  String _localKey = '';

  Future<void> _fetchProductHandler(
    FetchProductEvent event,
    Emitter<HomeState> emit,
  ) async {
    // Get the current state
    final currentState = state;

    // Clear the state only if the main key (tab) changes
    if (_localKey != event.key) {
      _localKey = event.key;
      if (currentState is HomeLoaded) {
        emit(const HomeLoaded(
          popularProducts: [],
          newProducts: [],
          trendings: [],
        ));
      }
    }

    // Call the use case
    final result = await _fetchProduct(
      FetchProductParams(
        key: event.key,
        subKey: event.subKey,
      ),
    );

    // Handle the result
    result.fold(
      (failure) => emit(HomeError(message: failure.message)),
      (response) {
        if (currentState is HomeLoaded) {
          // Update the specific category with the new data
          emit(currentState.copyWith(
            popularProducts: event.subKey == TabSubKey.popular
                ? response
                : currentState.popularProducts,
            newProducts: event.subKey == TabSubKey.newArrivals
                ? response
                : currentState.newProducts,
            trendings: event.subKey == TabSubKey.trending
                ? response
                : currentState.trendings,
          ));
        } else {
          // Initialize the state with the fetched data
          emit(HomeLoaded(
            popularProducts: event.subKey == TabSubKey.popular ? response : [],
            newProducts: event.subKey == TabSubKey.newArrivals ? response : [],
            trendings: event.subKey == TabSubKey.trending ? response : [],
          ));
        }
      },
    );
  }
}
