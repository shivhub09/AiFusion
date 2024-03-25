part of 'image_captioning_bloc.dart';

@immutable
sealed class ImageCaptioningEvent {}

class ImageCaptioningInitialEvent extends ImageCaptioningEvent{}

class ImageCaptioningSelectImageButtonClickedEvent extends ImageCaptioningEvent{}

class ImageCaptioningClickImageButtonClickedEvent extends ImageCaptioningEvent{}

class ImageCaptioningSubmitButtonClickedEvent extends ImageCaptioningEvent{}

