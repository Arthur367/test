import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blocs.dart';

class CustomerDownloadCard extends StatelessWidget {
  const CustomerDownloadCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Customer'),
          _buildCustomerDownloadButton(),
        ],
      ),
    );
  }

  Widget _buildCustomerDownloadButton() {
    return BlocBuilder<InitialCustomerLoadBloc, InitialCustomerLoadState>(
      builder: (context, state) {
        if (state is InitialCustomerLoadInitial) {
          return IconButton(
            onPressed: () => context
                .read<InitialCustomerLoadBloc>()
                .add(CustomerDownloadButtonPressed()),
            icon: const Icon(Icons.download),
          );
        }
        if (state is InitialCustomerLoadLoading) {
          return const CircularProgressIndicator();
        }
        if (state is InitialCustomerLoaded) {
          return const Icon(
            Icons.download_done_outlined,
            color: Colors.green,
          );
        }
        return IconButton(
          onPressed: () => context
              .read<InitialCustomerLoadBloc>()
              .add(CustomerDownloadButtonPressed()),
          icon: const Icon(Icons.download),
        );
      },
    );
  }
}
