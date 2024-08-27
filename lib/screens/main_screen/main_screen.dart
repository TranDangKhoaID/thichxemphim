import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thichxemphim/common/event_bus.dart';
import 'package:thichxemphim/common/share_color.dart';
import 'package:thichxemphim/common/share_style.dart';
import 'package:thichxemphim/screens/main_screen/cubit/main_cubit.dart';

class MainScreen extends StatefulWidget {
  /// MARK: - Initials;
  static MultiBlocProvider provider() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit(),
        ),
      ],
      child: const MainScreen(),
    );
  }

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with AfterLayoutMixin {
  /// MARK: - Initials;
  final screens = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    )
  ];

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  StreamSubscription<ChangeTabEvent>? streamChangeTab;
  //StreamSubscription<GetUserInfoEvent>? streamGetUserInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: _buildBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  /// Build Body
  Widget _buildBody() {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (prev, curr) {
        return curr is ChangeTabIndex;
      },
      builder: (context, state) {
        final tabIndex = state.data.tabIndex;
        return IndexedStack(
          index: tabIndex,
          children: screens,
        );
      },
    );
  }

  /// Build bottom bar
  Widget _buildBottomBar() {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (prev, curr) {
        return curr is ChangeTabIndex;
      },
      builder: (context, state) {
        final tabIndex = state.data.tabIndex;
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_4,
                size: 20,
              ),
              label: 'Nhân vật',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 20,
              ),
              label: 'Anime/Manga',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 20,
              ),
              label: 'Cài đặt',
            ),
          ],
          currentIndex: tabIndex,
          selectedItemColor: ShareColors.kPrimaryColor,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: ShareStyles.normalStyle.copyWith(fontSize: 12),
          unselectedLabelStyle: ShareStyles.normalStyle.copyWith(fontSize: 12),
          onTap: (int index) {
            _globalKey.currentContext
                ?.read<MainCubit>()
                .changeTabIndex(index: index);
          },
        );
      },
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    /// Observer change tab
    streamChangeTab = eventBus.on<ChangeTabEvent>().listen((event) {
      _globalKey.currentContext
          ?.read<MainCubit>()
          .changeTabIndex(index: event.index);
    });
  }

  @override
  void dispose() {
    streamChangeTab?.cancel();
    super.dispose();
  }
}
