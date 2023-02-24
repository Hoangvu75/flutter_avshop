import 'package:avshop/bloc/avScreen/movie/actress_bloc.dart';
import 'package:avshop/repository/avScreen/actress_repository.dart';
import 'package:avshop/screens/avScreen/av_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/scroll_controller/scroll_controller_bloc.dart';

class AvScreen extends StatelessWidget {
  const AvScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ActressRepository>(
          create: (context) => ActressRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ScrollControllerBloc>(
            create: (context) => ScrollControllerBloc(),
          ),
          BlocProvider<ActressBloc>(
            create: (context) => ActressBloc(
              RepositoryProvider.of<ActressRepository>(context),
            ),
          ),
        ],
        child: const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: AvScreenBody(),
        ),
      ),
    );
  }
}
