import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'active_product_image_tag_state.dart';

class ActiveProductImageTagCubit extends Cubit<ActiveProductImageTagState> {
  int activeProductImage = 1;

  ActiveProductImageTagCubit() : super(ActiveProductImageTagInitialState());

  void changeTheActiveImage(int theNewIndex) {
    activeProductImage == theNewIndex;
    print("thhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh$theNewIndex");
    emit(ActiveProductImageTagUpdatedState(theNewImageIndex: theNewIndex));
  }
}
