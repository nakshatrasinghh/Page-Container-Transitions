import 'package:animations/animations.dart';
import 'package:container_transform/main.dart';
import 'package:container_transform/pages/details.dart';
import 'package:container_transform/widgets/card.dart';
import 'package:container_transform/widgets/custom_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ContainerTransformPage extends StatelessWidget {
  const ContainerTransformPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const transitionType = ContainerTransitionType.fade;

    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: 10,
        staggeredTileBuilder: (index) {
          const crossAxisCount = 2;
          final double mainAxisCount = index.isEven ? 3 : 2;

          return StaggeredTile.count(crossAxisCount, mainAxisCount);
        },
        itemBuilder: (context, index) => OpenContainer(
          transitionType: transitionType,
          transitionDuration: const Duration(seconds: 3),
          openBuilder: (context, _) => DetailsPage(index: index),
          closedBuilder: (context, VoidCallback openContainer) => CardWidget(
            index: index,
            onClicked: openContainer,
          ),
        ),
      ),
      floatingActionButton: const CustomFABWidget(transitionType: transitionType),
    );
  }
}
