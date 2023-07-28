import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movies_review/core/service/auth/auth_service.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File image) onImagePick;
  final bool update;

  UserImagePicker({super.key, required this.onImagePick, required this.update});

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _image;
  final user = AuthService().currentUser;
  bool _updateImage = false;

  Future<void> _pickImage() async {
    _updateImage = true;
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
      widget.onImagePick(_image!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        !_updateImage
            ? CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(user!.imageUrl),
              )
            : CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                backgroundImage: _image != null ? FileImage(_image!) : null,
              ),
        TextButton(
          onPressed: _pickImage,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.image,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.update ? 'Trocar Imagem' : 'Adicionar Imagem',
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}
