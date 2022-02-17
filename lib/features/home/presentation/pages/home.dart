import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/features/home/domain/entities/data.dart';
import 'package:flutter_challenge/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_challenge/features/home/presentation/widgets/home_widget.dart';
import 'package:flutter_challenge/shared/shared.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).loadData();
    scrollController.addListener(_onScroll);
  }

  Data data = const Data();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          padding: const EdgeInsets.only(
            top: 70,
            bottom: 16,
          ),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Styles.bold(
                'Home',
                fontSize: 32,
                textAlign: TextAlign.center,
              ),
              const YMargin(31),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading && state.initial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is HomeLoading) {
                    data = state.data;
                    isLoading = true;
                  } else if (state is HomeLoaded) {
                    data = state.data;
                  }

                  return Expanded(
                    child: GridView.builder(
                      controller: scrollController,
                      itemCount: data.photos!.length + (isLoading ? 1 : 0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 13,
                        childAspectRatio: 1 / 1.1,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        if (index < data.photos!.length) {
                          return HomeWidget(
                            image: data.photos![index].src!.original,
                            title: data.photos![index].alt,
                          );
                        } else {
                          Timer(const Duration(milliseconds: 30), () {
                            scrollController.jumpTo(
                                scrollController.position.maxScrollExtent);
                          });

                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) context.read<HomeCubit>().loadData();
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
