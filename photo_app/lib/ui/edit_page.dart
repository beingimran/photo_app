import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:photo_app/bloc/photo_bloc.dart';
import 'package:photo_app/route/route_names.dart';

class EditPhotoPage extends StatefulWidget {
  final File image;

  const EditPhotoPage({required this.image});

  @override
  _EditPhotoPageState createState() => _EditPhotoPageState();
}

class _EditPhotoPageState extends State<EditPhotoPage> {
  late File imageFile;

  @override
  void initState() {
    super.initState();
    imageFile = widget.image;

    if (imageFile != null) _compressFile(imageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<Null> _compressFile(File file) async {
    final filePath = file.absolute.path;
    // Create output file path
    // eg:- "Volume/VM/abcd_out.jpeg"
    final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: 5,
    );
    if (result != null) {
      imageFile = result;
      context.bloc<PhotoBloc>().add(GetPhoto(imageFile));
      Navigator.pop(context, routeHome);
    }
    print(file.lengthSync()); //before compression
    print(result!.lengthSync()); //after compression
  }
}

// Upload(File imageFile) async {
//   var stream =
//       new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//   var length = await imageFile.length();

//   var uri = Uri.parse(uploadURL);

//   var request = new http.MultipartRequest("POST", uri);
//   var multipartFile = new http.MultipartFile('file', stream, length,
//       filename: basename(imageFile.path));
//   //contentType: new MediaType('image', 'png'));

//   request.files.add(multipartFile);
//   var response = await request.send();
//   print(response.statusCode);
//   response.stream.transform(utf8.decoder).listen((value) {
//     print(value);
//   });
// }
