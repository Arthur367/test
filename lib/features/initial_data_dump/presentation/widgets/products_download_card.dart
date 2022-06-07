import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blocs.dart';

class ProductsDownloadCard extends StatelessWidget {
  const ProductsDownloadCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Products'),
          _buildProductsDownloadButton(),
        ],
      ),
    );
  }

  Widget _buildProductsDownloadButton() {
    return BlocBuilder<InitialProductsLoadBloc, InitialProductsLoadState>(
      builder: (context, state) {
        if (state is InitialProductsLoadInitial) {
          return IconButton(
            onPressed: () => context
                .read<InitialProductsLoadBloc>()
                .add(ProductsDownloadButtonPressed()),
            icon: const Icon(Icons.download),
          );
        }
        if (state is InitialProductsLoadLoading) {
          return const CircularProgressIndicator();
        }
        if (state is InitialProductsLoaded) {
          return const Icon(
            Icons.download_done_outlined,
            color: Colors.green,
          );
        }
        return IconButton(
          onPressed: () => context
              .read<InitialProductsLoadBloc>()
              .add(ProductsDownloadButtonPressed()),
          icon: const Icon(Icons.download),
        );
      },
    );
  }
}
