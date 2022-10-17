// XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 50);
// if(image !=null){
// // print(image.path);
// setState(() {
// _image = File(image.path);
//
//
// });
// var request = http.MultipartRequest("POST",Uri.parse("http://127.0.0.1:8080/api/test/upload"));
// request.fields['prenom']="youssoupha";
// request.headers['Authorization']="eav4eyt24b6lkrdgegnwzz7finrrfskcaismplzdfn6le8r1klxoyx4o0smu";
// // var file = http.MultipartFile.fromBytes('file',_image!.readAsBytesSync(),filename: image.path);
// var file = await http.MultipartFile.fromPath("file", image.path);
// request.files.add(file);
// var response = await request.send();
// var responseData = await response.stream.toBytes();
// var res = String.fromCharCodes(responseData);
// print(res);