import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:select_shop/models/collection/the_collection_modle.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  int activeProductImage = 1;
  ProductDetailsBloc() : super(ProductDetailsInitialState()) {
    on<ProductDetailsEvent>((event, emit) {
      // TODO: implement event handler


      if(event is ProductDetailsInitalEvent){
        // inital product event
      }
    });
  }
}
