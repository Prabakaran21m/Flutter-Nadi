// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:intl/intl.dart';
// import 'package:month_year_picker/month_year_picker.dart';
//
// class ExampleApp extends StatelessWidget {
//   const ExampleApp({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyHomePage(),
//       localizationsDelegates: [
//         GlobalWidgetsLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         MonthYearPickerLocalizations.delegate,
//       ],
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   DateTime? _selected;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_selected == null)
//               const Text('')
//             else
//               Text(DateFormat().add_yM().format(_selected!)),
//             TextButton(
//               child: const Text('ENGLISH INDIAN'),
//               onPressed: () => _onPressed(context: context, locale: 'en'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _onPressed({
//     required BuildContext context,
//     String? locale,
//   }) async {
//     final localeObj = locale != null ? Locale(locale) : null;
//     final selected = await showMonthYearPicker(
//       context: context,
//       initialDate: _selected ?? DateTime.now(),
//       firstDate: DateTime(2019),
//       lastDate: DateTime(2030),
//       locale: localeObj,
//     );
//     if (selected != null) {
//       setState(() {
//         _selected = selected;
//       });
//     }
//   }
// }
