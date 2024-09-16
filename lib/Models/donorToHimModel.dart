class DonorToHimModel{

  String? blood;
  String? city;
  String? name;
  String? phone;
  String? age;
   String? uId;







  DonorToHimModel({
    this.name,
    this.blood,
    this.city,
    this.phone,
    this.age,
     this.uId,




   });


   DonorToHimModel.fromjson(Map<String,dynamic>json){

    blood=json['blood'];
    name=json['name'];
    city=json['city'];
    phone=json['phone'];
    age=json['age'];
    uId=json['uId'];







  }
  Map<String,dynamic>toMap(){
    return{

      'blood':blood,
      'name':name,
      'city':city,
      'phone':phone,
      'age':age,
       'uId':uId,

    };
  }
}