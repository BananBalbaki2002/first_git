






import 'package:tasko/my_models/profile_model.dart';
import 'package:tasko/services/profile_service.dart';

class   ProfileController{
  ProfileModel?  profileobj;


  Future onClickAddProfile(String img_path)async{


    ProfileModel profileModel=ProfileModel(

      img_profile:img_path,
    phone:"095554786",
        education:"businesssmmmmmm",
    experience: "4 years as a team leader in many company",
    contact:"telegrambanan00"
   );

   profileobj =await ProfileService.AddProfile(profileModel);
//print(profileobj!.img_profile);


}


}
