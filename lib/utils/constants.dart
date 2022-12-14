import 'package:flutter/material.dart';

double topMargin(BuildContext context) =>
    MediaQuery.of(context).size.height > 700 ? 128 : 64;

double mainSquareSize(BuildContext context) =>
    MediaQuery.of(context).size.height / 2;

double dotsTopMargin(BuildContext context) =>
    topMargin(context) + mainSquareSize(context) + 32 + 16 + 4 + 8;

double bottom(BuildContext context) =>
    MediaQuery.of(context).size.height - dotsTopMargin(context) - 8 - 8;

double endTop(context) => topMargin(context) + 32 + 16 + 8;

double oneThird(context) => (startTop(context) - endTop(context)) / 3;

double startTop(context) =>
    topMargin(context) + mainSquareSize(context) + 32 + 16 + 32 + 4;
