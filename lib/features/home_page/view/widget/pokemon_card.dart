import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class PokemonCardView extends StatelessWidget {
//   const PokemonCardView({
//     super.key,
//     required this.imageUrl,
//     required this.pokemonName,
//     required this.pokemonID,
//   });
//
//   final String pokemonName;
//   final int pokemonID;
//   final String imageUrl;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // todo you can navigate this to detail page
//       },
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12.r),
//             child: CachedNetworkImage(
//               imageUrl: imageUrl,
//               height: 150.h,
//               width: double.infinity,
//               fit: BoxFit.cover,
//               errorWidget: (context, url, error) {
//                 return Image.asset(
//                   "assets/image.png",
//                   height: 150.h,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 );
//               },
//               placeholder: (_, __) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               },
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12.r),
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.black.withOpacity(0),
//                   Colors.black.withOpacity(.2),
//                   Colors.black.withOpacity(1)
//                 ], // Define your desired colors here
//               ),
//             ),
//             height: 150.h,
//             margin: EdgeInsets.only(right: 8.w),
//             child: Stack(
//               children: [
//                 Positioned(
//                   bottom: 8.w,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 8.0,
//                         ),
//                         child: SizedBox(
//                           width: 140.w,
//                           child: Text(
//                             pokemonName,
//                             maxLines: 2,
//                             style: TextStyle(
//                               color: Colors.white,
//                               letterSpacing: 0.2.sp,
//                               fontSize: 14.sp,
//                               height: 23.sp / 14.sp,
//                               fontWeight: FontWeight.w400,
//                               fontFamily: 'Poppins',
//                             ),
//                           ),
//                         ),
//                       ),
//                       ListView.builder(
//                         itemCount: state.,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Container(
//                             decoration: BoxDecoration(
//                               color: ColorAssets.info,
//                               borderRadius: BorderRadius.circular(8.r),
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 6.h,
//                                 vertical: 4.w,
//                               ),
//                               child: Text("PICk"),
//                             ),
//                           );
//                         },
//
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class PokemonCardView extends StatefulWidget {
  const PokemonCardView({
    super.key,
    required this.imageUrl,
    required this.pokemonName,
    required this.pokemonID,
  });

  final String pokemonName;
  final int pokemonID;
  final String imageUrl;

  @override
  State<PokemonCardView> createState() => _PokemonCardViewState();
}

class _PokemonCardViewState extends State<PokemonCardView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // todo you can navigate this to detail page
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl,
              height: 150.h,
              width: double.infinity,
              fit: BoxFit.contain,
              errorWidget: (context, url, error) {
                return Image.asset(
                  "assets/image.png",
                  height: 150.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
              placeholder: (_, __) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(.2),
                  Colors.black.withOpacity(1)
                ], // Define your desired colors here
              ),
            ),
            height: 150.h,
            margin: EdgeInsets.only(right: 8.w),
            child: Stack(
              children: [
                Positioned(
                  bottom: 8.w,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: SizedBox(
                          width: 140.w,
                          child: Text(
                            widget.pokemonName,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 0.2.sp,
                              fontSize: 14.h,
                              height: 23.h / 14.h,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
