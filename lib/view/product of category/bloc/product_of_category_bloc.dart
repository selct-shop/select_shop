import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:select_shop/core/helpers/dio_helper.dart';

part 'product_of_category_event.dart';
part 'product_of_category_state.dart';

class ProductOfCategoryBloc extends Bloc<ProductOfCategoryEvent, ProductOfCategoryState> {
  ProductOfCategoryBloc() : super(ProductOfCategoryInitialState ()) {
    on<ProductOfCategoryEvent>((event, emit) async{
      // TODO: implement event handler

if( event is GetTheMainCategoryChildrenEvent ){

  // await DioHelper.get
}

    });
  }
}
