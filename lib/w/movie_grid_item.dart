// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/movie.dart';
// import '../providers/movie_list.dart';
// import '../utils/app_routes.dart';
//
// class MovieGridItem extends StatelessWidget {
//
//   const MovieGridItem({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     final movie = Provider.of<Results>(context, listen: false);
//
//     return InkWell(
//       onTap: () {
//         Navigator.of(context).pushNamed(
//             AppRoutes.MOVIES_DETAILS,
//             arguments: movie,
//         );
//       },
//       child: SizedBox(
//         width: 150,
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                     // ignore: prefer_interpolation_to_compose_strings
//                       'https://image.tmdb.org/t/p/w500' +
//                           movie.posterPath!),
//                 ),
//               ),
//               height: 300,
//             ),
//             const SizedBox(height: 5),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 movie.title!,
//                 style: const TextStyle(
//                     fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
