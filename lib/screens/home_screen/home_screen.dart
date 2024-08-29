import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:thichxemphim/screens/home_screen/cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:thichxemphim/widgets/shimmer.dart';
import 'package:thichxemphim/widgets/shimmer_grid_item.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.all(5),
      color: Colors.white,
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNewUpdateMovies(),
            Divider(),
            _buildMovies(),
            Divider(),
            _buildTvSeries(),
            Divider(),
            _buildCartoons(),
            Divider(),
            _buildTvShows(),
          ],
        ),
      ),
    );
  }

  Widget _buildNewUpdateMovies() {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, curr) {
        return curr is GetMoviesNewUpdate || curr is IsLoading;
      },
      builder: (context, state) {
        final items = state.data.moviesNewUpdate;
        final isLoading = state.data.isLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.56,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (isLoading) {
                  return ShimmerGridItem();
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
                            height: 160,
                            imageUrl: items[index].poster_url ?? '',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const ShimmerImage(),
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
              itemCount: isLoading
                  ? 6
                  : (items.length > 6)
                      ? 6
                      : items.length,
            ),
          ],
        );
      },
    );
  }

  //
  Widget _buildMovies() {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, curr) {
        return curr is GetMoviesMovie || curr is IsLoading;
      },
      builder: (context, state) {
        final items = state.data.moviesMovie;
        final isLoading = state.data.isLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  Text(
                    'Phim lẻ',
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
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.56,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (isLoading) {
                  return ShimmerGridItem();
                }
                return GestureDetector(
                  onTap: () {
                    print('https://phimimg.com/${items[index].poster_url}');
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            height: 160,
                            imageUrl:
                                'https://phimimg.com/${items[index].poster_url}',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const ShimmerImage(),
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
              itemCount: isLoading
                  ? 6
                  : (items.length > 6)
                      ? 6
                      : items.length,
            ),
          ],
        );
      },
    );
  }

  //
  Widget _buildTvSeries() {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, curr) {
        return curr is GetMoviesTVSeries || curr is IsLoading;
      },
      builder: (context, state) {
        final items = state.data.moviesTVSerie;
        final isLoading = state.data.isLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  Text(
                    'Phim bộ',
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
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.56,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (isLoading) {
                  return ShimmerGridItem();
                }
                return GestureDetector(
                  onTap: () {
                    print('https://phimimg.com/${items[index].poster_url}');
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            height: 160,
                            imageUrl:
                                'https://phimimg.com/${items[index].poster_url}',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const ShimmerImage(),
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
              itemCount: isLoading
                  ? 6
                  : (items.length > 6)
                      ? 6
                      : items.length,
            ),
          ],
        );
      },
    );
  }

  //
  Widget _buildCartoons() {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, curr) {
        return curr is GetMoviesCartoon || curr is IsLoading;
      },
      builder: (context, state) {
        final items = state.data.moviesCartoon;
        final isLoading = state.data.isLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  Text(
                    'Hoạt hình',
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
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.56,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (isLoading) {
                  return ShimmerGridItem();
                }
                return GestureDetector(
                  onTap: () {
                    print('https://phimimg.com/${items[index].poster_url}');
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            height: 160,
                            imageUrl:
                                'https://phimimg.com/${items[index].poster_url}',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const ShimmerImage(),
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
              itemCount: isLoading
                  ? 6
                  : (items.length > 6)
                      ? 6
                      : items.length,
            ),
          ],
        );
      },
    );
  }

  //
  Widget _buildTvShows() {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, curr) {
        return curr is GetMoviesTVShow || curr is IsLoading;
      },
      builder: (context, state) {
        final items = state.data.moviesTVShow;
        final isLoading = state.data.isLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  Text(
                    'TV - Shows',
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
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.56,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (isLoading) {
                  return ShimmerGridItem();
                }
                return GestureDetector(
                  onTap: () {
                    print('https://phimimg.com/${items[index].poster_url}');
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            height: 160,
                            imageUrl:
                                'https://phimimg.com/${items[index].poster_url}',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const ShimmerImage(),
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
              itemCount: isLoading
                  ? 6
                  : (items.length > 6)
                      ? 6
                      : items.length,
            ),
          ],
        );
      },
    );
  }
}
