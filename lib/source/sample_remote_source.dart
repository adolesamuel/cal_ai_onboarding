import 'package:flutter_riverpod/flutter_riverpod.dart';

final sampleRemoteProvider = Provider((ref) => SampleRemoteSource());

class SampleRemoteSource {}
