import 'package:avshop/bloc/avScreen/movie/actress_bloc.dart';
import 'package:avshop/bloc/avScreen/movie/actress_event.dart';
import 'package:avshop/bloc/avScreen/movie/actress_state.dart';
import 'package:avshop/screens/avScreen/components/actress_list_loading_widget.dart';
import 'package:avshop/screens/avScreen/components/actress_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

import '../../bloc/scroll_controller/scroll_controller_bloc.dart';
import '../../bloc/scroll_controller/scroll_controller_event.dart';
import '../../bloc/scroll_controller/scroll_controller_state.dart';
import '../../generated/assets.dart';

import '../../../generated/app_utils.dart';

class AvScreenBody extends StatefulWidget {
  const AvScreenBody({Key? key}) : super(key: key);

  @override
  State<AvScreenBody> createState() => _AvScreenBodyState();
}

class _AvScreenBodyState extends State<AvScreenBody> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset > 250) {
        context.read<ScrollControllerBloc>().add(OutTopEvent());
      } else {
        context.read<ScrollControllerBloc>().add(OnTopEvent());
      }
    });

    context.read<ActressBloc>().add(LoadActressEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: 300 * responsiveSize.height,
          backgroundColor: Colors.black.withOpacity(0.75),
          leading: ScaleTap(
            onPressed: () {},
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: 30 * responsiveSize.width,
            ),
          ),
          leadingWidth: 70,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          pinned: true,
          snap: false,
          floating: false,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: BlocBuilder<ScrollControllerBloc, ScrollControllerState>(
            builder: (context, scrollState) {
              return Text(
                scrollState.isOnTop ? "" : "AVShop",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                  fontFamily: Assets.fontsSVNGilroyRegular,
                ),
              ); // update UI <=== new
            },
          ),
          centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage(Assets.pngAVShopBg),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.75),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 75 * responsiveSize.width,
                  left: 10 * responsiveSize.width,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 10 * responsiveSize.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enjoy your fucking journey",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: Assets.fontsSVNGilroyRegular,
                            fontSize: 20 * responsiveSize.width,
                          ),
                        ),
                        SizedBox(
                          height: 10 * responsiveSize.height,
                        ),
                        Text.rich(
                          TextSpan(
                            text: "Explore new amazing AV world!",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: Assets.fontsSVNGilroyBold,
                              fontSize: 25 * responsiveSize.width,
                            ),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10 * responsiveSize.width,
                  right: 10 * responsiveSize.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Explore our AV Actress!",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: Assets.fontsSVNGilroySemiBold,
                          fontSize: 20 * responsiveSize.width,
                        ),
                      ),
                      SizedBox(
                        width: 10 * responsiveSize.width,
                      ),
                      ScaleTap(
                        onPressed: () {
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8 * responsiveSize.width),
                            child: const Icon(
                              Icons.play_arrow_sharp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 50 * responsiveSize.height,
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<ActressBloc, ActressState>(
            builder: (context, actressState) {
              if (actressState is ActressLoadingState) {
                return _actressLoadingWidget();
              } else if (actressState is ActressLoadedState) {
                return _actressLoadedWidget(actressState);
              }
              return _actressLoadingWidget();
            },
          ),
        )
      ],
    );
  }

  Widget _actressLoadingWidget() {
    return Column(
      children: const [
        ActressListLoadingWidget(
          title: "Trending actresses",
        ),
        ActressListLoadingWidget(
          title: "Top view actresses",
        ),
      ],
    );
  }

  Widget _actressLoadedWidget(ActressLoadedState actressState) {
    return Column(
      children: [
        ActressListWidget(
          actressList: actressState.trendingActressList,
          title: "Trending actresses",
        ),
        ActressListWidget(
          actressList: actressState.topViewActressList,
          title: "Top view actresses",
        ),
      ],
    );
  }
}
