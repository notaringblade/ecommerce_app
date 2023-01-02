import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/cart_model.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
  }

  void _onLoadCart(LoadCart event, Emitter<CartState> emit)async{
    emit(CartLoading());

    await Future<void>.delayed(const Duration(seconds: 1));
    emit(const CartLoaded());
  }

  void _onAddProduct(AddProduct event, Emitter<CartState> emit){
    final state = this.state;
    if( state is CartLoaded){
      emit(CartLoaded(cart: Cart(products: List.from(state.cart.products)..add(event.product))));
    }
  }

  void _onRemoveProduct(RemoveProduct event, Emitter<CartState> emit){
    final state = this.state;
    if( state is CartLoaded){
      emit(CartLoaded(cart: Cart(products: List.from(state.cart.products)..remove(event.product))));
    }
  }

}
