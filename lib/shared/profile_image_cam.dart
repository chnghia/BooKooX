import 'dart:io';

import 'package:flutter/material.dart';

import 'package:bookoox/utils/asset.dart' as Asset;

class ProfileImageCam extends StatelessWidget {
  final Function selectGallery;
  final Function selectCamera;
  final File imgFile;
  final String imgStr;

  ProfileImageCam({
    this.selectGallery,
    this.selectCamera,
    this.imgFile,
    this.imgStr,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0.0),
          child: Stack(
            children: <Widget>[
              Container(
                width: 88.0,
                height: 88.0,
                child: this.imgStr == null && this.imgFile == null
                    ? ClipOval(
                        child: Material(
                            clipBehavior: Clip.hardEdge,
                            color: Colors.transparent,
                            child: Ink.image(
                              image: Asset.Icons.icMask,
                              fit: BoxFit.cover,
                              width: 80.0,
                              height: 80.0,
                              child: InkWell(
                                onTap: this.selectGallery,
                              ),
                            )))
                    : this.imgFile != null
                        ? Container(
                            child: FlatButton(
                              onPressed: this.selectGallery,
                              padding: EdgeInsets.all(0.0),
                              child: CircleAvatar(
                                backgroundImage: FileImage(this.imgFile),
                                radius: 80.0,
                              ),
                            ),
                          )
                        : Material(
                            clipBehavior: Clip.hardEdge,
                            color: Colors.transparent,
                            child: FlatButton(
                              onPressed: this.selectGallery,
                              padding: EdgeInsets.all(0.0),
                              child: ClipOval(
                                child: FadeInImage.assetNetwork(
                                    fit: BoxFit.cover,
                                    placeholder: 'res/icons/icMask.png',
                                    image: this.imgStr),
                              ),
                            ),
                          ),
              ),
              Positioned(
                right: 0.0,
                bottom: 0.0,
                width: 36.0,
                height: 36.0,
                child: ClipOval(
                  child: FlatButton(
                    padding: EdgeInsets.all(0.0),
                    onPressed: this.selectCamera,
                    child: Icon(
                      Icons.camera,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
