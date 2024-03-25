import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_captioning_event.dart';
part 'image_captioning_state.dart';

class ImageCaptioningBloc
    extends Bloc<ImageCaptioningEvent, ImageCaptioningState> {
  ImageCaptioningBloc() : super(ImageCaptioningInitial()) {
    on<ImageCaptioningInitialEvent>(imageCaptioningInitialEvent);
  }

  FutureOr<void> imageCaptioningInitialEvent(
      ImageCaptioningInitialEvent event, Emitter<ImageCaptioningState> emit) {
    print(
        "this is the initial event of image captioning and  the initial state is being loaded");

    emit(ImageCaptioningLoadedSuccessState());
  }
}
