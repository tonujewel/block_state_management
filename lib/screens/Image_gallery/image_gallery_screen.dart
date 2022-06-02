import 'package:bloc_state_management/resources/api_provider.dart';
import 'package:bloc_state_management/widget/custom_progress.dart';
import 'package:bloc_state_management/widget/no_internet_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/gallery_bloc.dart';

class ImageGalleryScreen extends StatelessWidget {
  const ImageGalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Gallery")),
      body: BlocProvider(
        create: (context) => GalleryBloc(
          RepositoryProvider.of<ApiProvider>(context),
        )..add(LoadGalleryDataApiEvent()),
        child: BlocBuilder<GalleryBloc, GalleryState>(
          builder: (context, state) {
            if (state is GalleryNoInternetState) {
              return const NoInternetWidget();
            }

            if (state is GalleryLoadingState) {
              return const CustomProgress();
            }

            if (state is GalleryLoadedState) {
              return ListView.builder(
                  itemCount: state.imageGalleryList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 300,
                      width: 300,
                      child: CachedNetworkImage(
                        height: 300,
                        width: 300,
                        imageUrl:
                            "${state.imageGalleryList[index].urls!.small}",
                      ),
                    );
                  });
            }

            return Container();
          },
        ),
      ),
    );
  }
}
