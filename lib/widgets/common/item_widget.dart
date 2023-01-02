import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/config/capitalize.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/history/history_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HistoryBloc, HistoryState>(
      listener: (context, state) {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          //set border radius more than 50% of height and width to make circle
        ),
        elevation: 4,
        color: Colors.white,
        // borderOnForeground: false,
        child: InkWell(
          onTap: () {
            context.read<HistoryBloc>().add(AddHistory(product: product));
            Navigator.pushNamed(context, '/productScreen', arguments: product);
            // if(globals.index != 2){
            // History.products.insert(0,product);
            // }
          },
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                width: 170,
                height: 245,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      // color: Colors.white70,
                      padding:const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      height: 140,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              child: Text(
                            product.name.toCapitalized(),
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                          )),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          SizedBox(
                            child: Text(
                              product.category,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey[600]),
                            ),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            child: Text(
                              "${product.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
