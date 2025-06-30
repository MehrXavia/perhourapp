// import 'package:carousel_slider/carousel_slider.dart';

 import 'package:onservice24/core/utils/helper_methods.dart';
import 'package:onservice24/src/main_index.dart';

import '../../data/models/Slider_dto.dart';

class SliderWidget extends BaseStatelessWidget {
  final List<SliderDto> slider;

  SliderWidget({super.key, required this.slider});

  @override
  Widget build(BuildContext context) {
    return slider.isEmpty
        ?   Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      decoration:Decorations.kDecorationBorderRadius(
          color: Colors.white, radius: 20, borderColor: kBlueColorE4,
      ) ,
      child:   Center(child: Text(strings.ads,style: kTextSemiBold.copyWith(color: kGrayColor2),)),
    )
        : Container(
            decoration: Decorations.kDecorationBorderRadius(
                color: Colors.white, radius: 20, borderColor: Colors.white),
            // child: AbsorbPointer(
            //   absorbing: slider.length==1?true:false,
            //   child: CarouselSlider(
            //     options: CarouselOptions(
            //       height: 200,
            //       enlargeFactor: .5,
            //       viewportFraction: 1,
            //       enableInfiniteScroll: true,
            //       reverse: false,
            //       autoPlay:slider.length==1?false: true,
            //       autoPlayInterval: const Duration(seconds: 6),
            //       autoPlayAnimationDuration: const Duration(milliseconds: 800),
            //       enlargeCenterPage: true,
            //       scrollDirection: Axis.horizontal,
            //     ),
            //
            //     items: slider.map((item) {
            //         return InkWell(
            //         onTap: () async {
            //           print(item.url);
            //           print("jkjkjkjk");
            //           if(item.url==""|| item.url==null){
            //
            //           }else{
            //             await HelperMethods.launchURL(item.url ?? '');
            //           }
            //
            //
            //         },
            //         child: Container(
            //           width: double.infinity,
            //           height: 200,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(15),
            //             image: DecorationImage(image:NetworkImage(item.image ?? '') ,fit: BoxFit.fill)
            //           ),
            //
            //         ),
            //       );
            //     }).toList(),
            //   ),
            // ),
          );
  }
}
