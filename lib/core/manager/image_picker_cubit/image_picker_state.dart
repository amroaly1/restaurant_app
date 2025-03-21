import 'package:image_picker/image_picker.dart';

abstract class ImagePickerState {}

class ImagePickerInit extends ImagePickerState {}

class ImagePickerGetFromStorage extends ImagePickerState {
  final String imageUrl;

  ImagePickerGetFromStorage({required this.imageUrl});
}

class ImagePickerSelectImage extends ImagePickerState {
  final XFile image;

  ImagePickerSelectImage({required this.image});
}
