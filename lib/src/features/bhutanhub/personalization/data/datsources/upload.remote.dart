import 'package:bhutanhub/core/errors/exception.dart';
import 'package:bhutanhub/core/services/api/v1/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

abstract class UploadRemoteDataSource {
  Future<List<String>> uploadProductImages();
}

class UploadRemoteDataSourceImplementation implements UploadRemoteDataSource {
  const UploadRemoteDataSourceImplementation({
    required Dio dio,
    required ImagePicker picker,
  })  : _dio = dio,
        _picker = picker;

  final Dio _dio;
  final ImagePicker _picker;

  @override
  Future<List<String>> uploadProductImages() async {
    List<String> uploadedUrls = [];

    try {
      final images = await _picker.pickMultiImage(
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );

      if (images.isNotEmpty) {
        FormData formData = FormData();

        for (var image in images) {
          String fileName = image.path.split('/').last;
          formData.files.add(MapEntry(
            "files",
            await MultipartFile.fromFile(image.path, filename: fileName),
          ));
        }

        EasyLoading.show(
          indicator: const CircularProgressIndicator(),
          maskType: EasyLoadingMaskType.clear,
          dismissOnTap: true,
        );

        final response = await _dio.post(
          APITestService.uploadProductImage,
          data: formData,
        );

        if (response.statusCode != 200 && response.statusCode != 201) {
          throw APIException(
            message: 'Failed to upload product images, please try again',
            statusCode: response.statusCode ?? 500,
          );
        } else {
          List<dynamic> urls = response.data['urls'];
          uploadedUrls.addAll(urls.map((url) => url.toString()));
        }
      } else {
        throw const APIException(
          message: 'No images selected',
          statusCode: 400,
        );
      }
      return uploadedUrls;
    } catch (e) {
      throw APIException(
        message: 'Failed to upload product images: ${e.toString()}',
        statusCode: 500,
      );
    }
  }
}
