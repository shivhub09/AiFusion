part of 'image_captioning_bloc.dart';

@immutable
sealed class ImageCaptioningState {}

final class ImageCaptioningInitial extends ImageCaptioningState {}

abstract class ImageCaptioningActionState extends ImageCaptioningState{}


class ImageCaptioningLoadingState extends ImageCaptioningState{}

class ImageCaptioningLoadedSuccessState extends ImageCaptioningState{}

class ImageCaptioningErrorState extends ImageCaptioningState{}


class ImageCaptioningCaptureImageState extends ImageCaptioningActionState{}

class ImageCaptioningSelectImageState extends ImageCaptioningActionState{}

class ImageCaptioningSuccesfullyCaptioningState extends ImageCaptioningState{}