 import 'package:fpdart/fpdart.dart';

import '../import_path/import_path.dart';

typedef FutureEither<T> = Future<Either<Faiture, T>>;
typedef FutureVoid = FutureEither<void>;
