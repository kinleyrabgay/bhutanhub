import 'package:bhutan_hub/core/services/internet/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) {
          if (state is InternetLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is InternetConnected) {
            return Center(
                child: Text(
                    'Connected to the internet via ${state.connectionType}'));
          } else if (state is InternetDisconnected) {
            return Center(child: Text('No internet connection'));
          } else {
            return Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
