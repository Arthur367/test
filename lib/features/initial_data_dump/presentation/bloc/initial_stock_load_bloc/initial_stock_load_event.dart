part of 'initial_stock_load_bloc.dart';

abstract class InitialStockLoadEvent extends Equatable {
  const InitialStockLoadEvent();

  @override
  List<Object> get props => [];
}

class StockDownloadButtonPressed extends InitialStockLoadEvent {}
