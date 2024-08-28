import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:thichxemphim/screens/home_screen/cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:thichxemphim/widgets/shimmer.dart';

class HomeScreen extends StatefulWidget {
  /// MARK: - Initials;
  static BlocProvider<HomeCubit> provider() {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeScreen(),
    );
  }

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    context.read<HomeCubit>().getMoviesNewUpdate();
  }

  /// MARK: - Initials;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  bool isExpandedNewUpdate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(5),
        color: Colors.white,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNewUpdateMovies(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewUpdateMovies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Text(
                'Phim mới cập nhật',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                ),
              )
            ],
          ),
        ),
        //SizedBox(height: 10),
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (prev, curr) {
            return curr is GetMoviesNewUpdate || curr is IsLoading;
          },
          builder: (context, state) {
            final items = state.data.moviesNewUpdate;
            final isLoading = state.data.isLoading;

            return Column(
              children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.56,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (isLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        print('Hello');
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                //width: 200,
                                height: 160,
                                imageUrl: items[index].poster_url ?? '',
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const ShimmerImage(),
                                errorWidget: (context, url, error) => Icon(
                                  Icons.error,
                                ),
                              ),
                            ),
                            Text(
                              items[index].name ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: isExpandedNewUpdate
                      ? items.length
                      : (items.length > 6 ? 6 : items.length),
                ),
                if (items.length > 6)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isExpandedNewUpdate = !isExpandedNewUpdate;
                      });
                    },
                    child: Text(isExpandedNewUpdate ? "Thu gọn" : "Xem thêm"),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
