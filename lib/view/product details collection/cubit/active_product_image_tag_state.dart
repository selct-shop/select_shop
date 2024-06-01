part of 'active_product_image_tag_cubit.dart';

sealed class ActiveProductImageTagState extends Equatable {
  const ActiveProductImageTagState();

  @override
  List<Object> get props => [];
}

final class ActiveProductImageTagInitialState extends ActiveProductImageTagState {}

final class ActiveProductImageTagUpdatedState extends ActiveProductImageTagState{
final int theNewImageIndex;
ActiveProductImageTagUpdatedState({ required this.theNewImageIndex});
}