abstract class TopRateState {}

class TopRateLoading extends TopRateState {}

class TopRateSuccess extends TopRateState {}

class TopRateFailing extends TopRateState {
  final String errMessage;

  TopRateFailing({required this.errMessage});
}

class TopRateAddtoFavoirite extends TopRateState {}

class TopRateaddToFavoiriteFailing extends TopRateState {
  final String errMessage;

  TopRateaddToFavoiriteFailing({required this.errMessage});
}
