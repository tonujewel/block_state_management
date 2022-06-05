import 'package:bloc_state_management/AppStyle/app_style.dart';
import 'package:bloc_state_management/resources/api_provider.dart';
import 'package:bloc_state_management/widget/custom_progress.dart';
import 'package:bloc_state_management/widget/no_internet_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../services/image_gallery_service.dart';
import 'bloc/gallery_bloc.dart';

class ImageGalleryScreen extends StatelessWidget {
  const ImageGalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      appBar: AppBar(title: const Text("Image Gallery")),
      body: BlocProvider(
        create: (context) => GalleryBloc(
          RepositoryProvider.of<ApiProvider>(context),
          //  RepositoryProvider.of<ImageService>(context),
        )..add(LoadGalleryDataApiEvent()),
        child: BlocConsumer<GalleryBloc, GalleryState>(
          listener: (context, state) {
            if (state is ImageSavedState) {
              const snackBar = SnackBar(
                content: Text('Image saved!'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }

            if (state is ImageSavedNoInternetState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Row(
                  children: const [
                    Icon(
                      Icons.warning_rounded,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Check your internet connection!'),
                  ],
                ),
              ));
            }
          },
          builder: (context, state) {
            if (state is GalleryNoInternetState) {
              return const NoInternetWidget();
            }
            if (state is GalleryLoadingState) {
              return const CustomProgress();
            }

            if (state is GalleryLoadedState) {
              print("dataa length ${state.imageGalleryList.length}");
              return GridView.builder(
                  padding: const EdgeInsets.all(20),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 3.5,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: state.imageGalleryList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration:
                              BoxDecoration(boxShadow: AppStyle.boxShadow),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: state.imageGalleryList[index].small,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Row(
                            children: [
                              CircleButton(
                                imagePath: 'assets/icon/send.png',
                                onTap: () {
                                  BlocProvider.of<GalleryBloc>(context).add(
                                      ShareImageEvent(
                                          state.imageGalleryList[index].small));
                                },
                              ),
                              !state.imageGalleryList[index].isSaved
                                  ? CircleButton(
                                      imagePath: 'assets/icon/download.png',
                                      onTap: () {
                                        BlocProvider.of<GalleryBloc>(context)
                                            .add(DownloadToGalleryEvent(
                                                state.imageGalleryList[index]));
                                      },
                                    )
                                  : CircleButton(
                                      imagePath: 'assets/icon/tick.png',
                                      onTap: () {},
                                    ),
                            ],
                          ),
                        )
                      ],
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

class CircleButton extends StatelessWidget {
  final Function() onTap;
  final String imagePath;
  const CircleButton({
    Key? key,
    required this.onTap,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Image.asset(
          imagePath,
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}
