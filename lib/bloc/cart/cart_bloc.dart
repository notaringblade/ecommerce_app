// import 'package:bloc/bloc.dart';
// import 'package:ecommerce_app/models/cart_model.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

// part 'cart_event.dart';
// part 'cart_state.dart';

// class CartBloc extends Bloc<CartEvent, CartState> {
//   CartBloc() : super( CartLoading()) {
//     on<CartEvent>((event, emit) {
//       on<LoadCart>(_onLoadCart);
//       on<AddProduct>(_onAddProduct);
//       on<RemoveProduct>(_onRemoveProduct);
//     });
//   }

//   void _onLoadCart(event, Emitter<CartState> emit) {
//     emit(CartLoading());
//     try{
//       emit(const CartLoaded());
//     }on Exception{
//       emit(CartError());   
//     }
//   }

//   void _onAddProduct(event, Emitter<CartState> emit) {
//     final state = this.state;
//     if (state is CartLoaded) {
//       try {
//         emit(CartLoaded(
//             cart: Cart(
//           products: List.from(state.cart.products)..add(event.product),
//         )));
//       } on Exception {
//         emit(CartError());
//       }
//     }
//   }
//   void _onRemoveProduct(event, Emitter<CartState> emit) {
//     final state = this.state;
//     if (state is CartLoaded) {
//       try {
//         emit(CartLoaded(
//             cart: Cart(
//           products: List.from(state.cart.products)..remove(event.product),
//         )));
//       } on Exception {
//         emit(CartError());
//       }
//     }
//   }
// }
