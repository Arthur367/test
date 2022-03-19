import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/blocs.dart';

class StockDownloadCard extends StatelessWidget {
  const StockDownloadCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Stock'),
          _buildStockDownloadButton(),
        ],
      ),
    );
  }

  Widget _buildStockDownloadButton() {
    return BlocBuilder<InitialStockLoadBloc, InitialStockLoadState>(
      builder: (context, state) {
        if (state is InitialStockLoadInitial) {
          return IconButton(
            onPressed: () => context
                .read<InitialStockLoadBloc>()
                .add(StockDownloadButtonPressed()),
            icon: const Icon(Icons.download),
          );
        }
        if (state is InitialStockLoadLoading) {
          return const CircularProgressIndicator();
        }
        if (state is InitialStockLoadLoaded) {
          return const Icon(
            Icons.download_done_outlined,
            color: Colors.green,
            size: 24,
          );
        }
        return IconButton(
          onPressed: () => context
              .read<InitialStockLoadBloc>()
              .add(StockDownloadButtonPressed()),
          icon: const Icon(Icons.download),
        );
      },
    );
  }
}
