import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_captioning_event.dart';
part 'image_captioning_state.dart';

class ImageCaptioningBloc extends Bloc<ImageCaptioningEvent, ImageCaptioningState> {
  ImageCaptioningBloc() : super(ImageCaptioningInitial()) {
    on<ImageCaptioningEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
