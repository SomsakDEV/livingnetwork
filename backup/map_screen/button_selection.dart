// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// /// Box that can be tapped.
// /// When selected a check Icon appears
// class ButtonSelection extends StatelessWidget {
//   /// Background color for the space between the child and the
//   /// Defaul value: scaffoldBackgroundColor
//   final Color? marginColor;

//   /// Background color when container is selected.
//   /// Default value : dialogBackgroundColor
//   final Color? selectedBackgroundColor;

//   /// Background color when container is not selected.
//   /// Default value : dialogBackgroundColor
//   final Color? unselectedBackgroundColor;

//   /// Border color when container is selected.
//   /// Default value : primaryColor
//   final Color? selectedBorderColor;

//   /// Border color when container is not selected.
//   /// Default value :primaryColorDark
//   final Color? unselectedBorderColor;

//   /// The child to render inside the container
//   final Widget? child;

//   /// Border size
//   /// Default value : 2 pixels
//   final int borderSize;

//   /// Callback when container get tapped
//   final Function? onPressed;

//   /// Callback of type ValueChanged
//   final ValueChanged<bool> onValueChanged;

//   /// Opacity when container is not selected.
//   /// When not 1 it will be animated when tapped.
//   /// Default value : 0.5
//   final double unselectedOpacity;

//   /// Opacity when container is selected.
//   /// When not 1 it will be animated when tapped.
//   /// Default value : 1
//   final double selectedOpacity;

//   /// Opacity animation duration in milliseconds.
//   /// Default value : 600
//   final int opacityAnimationDuration;

//   /// Icon to be shown when selected.
//   /// Default value : Icons.check

//   /// Elevation
//   /// Default value : 0.0
//   final double elevation;

//   ///Default value : 10.0
//   final double borderRadius;

//   ///Default not selected
//   final bool selected;

//   ButtonSelection(
//       {required this.selected,
//       this.marginColor,
//       this.unselectedBackgroundColor,
//       this.selectedBackgroundColor,
//       this.selectedBorderColor,
//       this.unselectedBorderColor,
//       @Deprecated('Use onValueChanged') this.onPressed,
//       required this.onValueChanged,
//       this.borderSize = 1,
//       this.selectedOpacity = 1.0,
//       this.unselectedOpacity = 0.5,
//       this.opacityAnimationDuration = 600,
//       this.elevation = 0.0,
//       this.borderRadius = 10.0,
//       required this.child});

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     return GestureDetector(
//       onTap: () {
//         onValueChanged(!selected);
//       },
//       child: AnimatedOpacity(
//         opacity: selected ? selectedOpacity : unselectedOpacity,
//         duration: Duration(milliseconds: opacityAnimationDuration),
//         child: Material(
//           // elevation: elevation,
//           color: marginColor ?? theme.scaffoldBackgroundColor,
//           child: Container(
//             clipBehavior: Clip.antiAliasWithSaveLayer,
//             decoration: BoxDecoration(
//                 border: borderSize > 0
//                     ? Border.all(
//                         color: selected
//                             ? selectedBorderColor ?? theme.primaryColor
//                             : unselectedBorderColor ?? theme.primaryColorDark,
//                         width: borderSize.toDouble(),
//                       )
//                     : Border.symmetric(),
//                 borderRadius: BorderRadius.circular(borderRadius),
//                 color: selected
//                     ? selectedBackgroundColor ?? theme.dialogBackgroundColor
//                     : unselectedBackgroundColor ?? theme.dialogBackgroundColor),
//             child: child,
//           ),
//         ),
//       ),
//     );
//   }
// }
