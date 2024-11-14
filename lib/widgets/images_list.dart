import 'package:flutter/material.dart';
import 'package:photo_app/models/image_model.dart';
import 'package:photo_app/widgets/widgets.dart';

class ImagesList extends StatefulWidget {
  final List<ImageModel> imagesData;
  final VoidCallback onEndReached; // Функция для загрузки новых элементов

  const ImagesList({
    super.key,
    required this.imagesData,
    required this.onEndReached,
  });

  @override
  _ImagesListState createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        // Проверка на достижение конца списка
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent) {
          widget.onEndReached();
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 37),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 400,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView.builder(
          controller: _scrollController, // Используем контроллер
          padding: const EdgeInsets.only(left: 16),
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.imagesData.length,
          itemBuilder: (context, index) {
            return ImageCard(
              imageLink: widget.imagesData[index].imageLink,
              avatar: widget.imagesData[index].user.avatar ??
                  'assets/images/default-avatar.webp',
              fullName:
                  '${widget.imagesData[index].user.firstName} ${widget.imagesData[index].user.lastName ?? ''}',
              accountName: widget.imagesData[index].user.accountName,
            );
          },
        ),
      ),
    );
  }
}
