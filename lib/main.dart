import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import '/data/provider/local/local_data_source.dart';
import '/data/provider/remote/get_api.dart';
import '/data/repository/random_number_repository.dart';
import '/logic/prime_number/prime_number_bloc.dart';
import '/logic/timer/timer_bloc.dart';
import '/presentation/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await initializeDateFormatting("de_DE", null);
  runApp(const DeepCareApp());
}

class DeepCareApp extends StatelessWidget {
  const DeepCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GetApi api = GetApi();
    final LocalDataSource local = LocalDataSource();
    final RandomNumberRepository repository = RandomNumberRepository(
      api: api,
      local: local,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<TimerBloc>(create: (context) => TimerBloc()),
        BlocProvider<PrimeNumberBloc>(
          create: (context) => PrimeNumberBloc(repository: repository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
