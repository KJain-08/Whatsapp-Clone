// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';

// List <CameraDescription> cameras = [];


// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});

//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {

//   // late CameraController _cameraController;
//   // late Future<void> cameraValue;

//   // @override
//   // void initState(){
//   //   super.initState();
//   //   // _cameraController =CameraController(cameras[0], ResolutionPreset.high);
//   //   // cameraValue=_cameraController.initialize();
//   // }
//   // void dispose(){
//   //   super.dispose();
//   //   _cameraController.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           FutureBuilder( 
//           future:cameraValue,
//           builder: (context,snapshot){
//             if (snapshot.connectionState==ConnectionState.done){
//               return CameraPreview(_cameraController);
//             }
//             else{
//               return Center(child:CircularProgressIndicator() ,);
//             }
//           },
//         ),
//         Positioned(
//           bottom : 0.0,
//           child: Container(
//             color: Colors.black,
//             width: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.only(top:5,bottom: 5),
//             child:Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     IconButton(icon:Icon(Icons.flash_off,color: Colors.white,size :28),onPressed: (){},),
//                     InkWell(
//                       onTap:(){},
//                       child: IconButton(icon:Icon(Icons.circle_outlined,color: Colors.white,size :70),onPressed: (){

//                       },)),
//                     IconButton(icon:Icon(Icons.flip_camera_ios,color: Colors.white,size :28),onPressed: (){},),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 Text("Hold for video,tap for photo",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)
//               ],
//             ) ,
//           ),
//         )
//         ],
//       ),
//     );
//   }
//   // void takePhoto()async{
//   //   // final path  = join((await getTemporaryDirectory()).path,"${DateTime.now()}.png");
//   //   // await _cameraController.takePicture();
//   // }

// }


