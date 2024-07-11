import 'package:bhutanhub/src/features/bhutanhub/personalization/data/model/product.model.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/domain/entities/product.entity.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/domain/usecases/create.product.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'personalization_event.dart';
part 'personalization_state.dart';

class PersonalizationBloc
    extends Bloc<PersonalizationEvent, PersonalizationState> {
  PersonalizationBloc({
    required CreateProduct createProduct,
  })  : _createProduct = createProduct,
        super(
          PersonalizationInitial(),
        ) {
    on<CreateProductEvent>(_createProductHandler);
  }

  final CreateProduct _createProduct;

  Future<void> _createProductHandler(
    CreateProductEvent event,
    Emitter<PersonalizationState> emit,
  ) async {
    emit(ProductCreationLoading());
    final result = await _createProduct(
      CreateProductParams(
        product: event.product,
      ),
    );
    result.fold(
      (failure) => emit(const ProductCreationFailed(
        'Failed to create product',
      )),
      (_) => emit(ProductCreationSuccess()),
    );
  }
}
