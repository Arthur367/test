import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blocs.dart';

class VatTaxDownloadCard extends StatelessWidget {
  const VatTaxDownloadCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('VAT & Tax'),
          _buildVatTaxDownloadButton(),
        ],
      ),
    );
  }

  Widget _buildVatTaxDownloadButton() {
    return BlocBuilder<InitialVatTaxLoadBloc, InitialVatTaxLoadState>(
      builder: (context, state) {
        if (state is InitialVatTaxLoadInitial) {
          return IconButton(
            onPressed: () => context
                .read<InitialVatTaxLoadBloc>()
                .add(VatTaxDownloadButtonPressed()),
            icon: const Icon(Icons.download),
          );
        }
        if (state is InitialVatTaxLoadLoading) {
          return const CircularProgressIndicator();
        }
        if (state is InitialVatTaxLoaded) {
          return const Icon(
            Icons.download_done_outlined,
            color: Colors.green,
          );
        }
        return IconButton(
          onPressed: () => context
              .read<InitialVatTaxLoadBloc>()
              .add(VatTaxDownloadButtonPressed()),
          icon: const Icon(Icons.download),
        );
      },
    );
  }
}
