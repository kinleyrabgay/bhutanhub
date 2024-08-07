import 'package:bhutanhub/core/common/entities/product.entity.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/domain/usecases/create.product.dart';
import 'package:bhutanhub/src/features/bhutanhub/personalization/domain/usecases/update.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'personalization_event.dart';
part 'personalization_state.dart';

class PersonalizationBloc
    extends Bloc<PersonalizationEvent, PersonalizationState> {
  PersonalizationBloc({
    required CreateProduct createProduct,
    required Upload upload,
  })  : _createProduct = createProduct,
        _upload = upload,
        super(
          const PersonalizationInitial(),
        ) {
    on<CreateProductEvent>(_createProductHandler);
    on<UploadImageEvent>(_uploadImageHandler);
  }

  final CreateProduct _createProduct;
  final Upload _upload;

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
      (failure) => emit(ProductCreationFailed(failure.message)),
      (_) => emit(ProductCreationSuccess()),
    );
  }

  Future<void> _updateProductHandler(
    UpdateProductEvent event,
    Emitter<PersonalizationState> emit,
  ) async {}

  // Image
  Future<void> _uploadImageHandler(
    UploadImageEvent event,
    Emitter<PersonalizationState> emit,
  ) async {
    final result = await _upload();
    result.fold(
      (failure) => emit(const ImageUploadFailure(
        'Failed to upload image, please try again',
      )),
      (response) => emit(ImageUploadSuccess(response)),
    );
  }
}
