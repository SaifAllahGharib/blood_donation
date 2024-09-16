class DonorModel{

  String? blood;
  String? city;
  String? name;
  String? phone;
  String? age;
  String? disease;
  String? uId;








  DonorModel({
    this.name,
    this.blood,
    this.city,
    this.phone,
    this.age,
    this.uId,
    this.disease



  });


  DonorModel.fromjson(Map<String,dynamic>json){

    blood=json['blood'];
    name=json['name'];
    city=json['city'];
    phone=json['phone'];
    age=json['age'];
    uId=json['uId'];
    disease=json['disease'];






  }
  Map<String,dynamic>toMap(){
    return{

      'blood':blood,
      'name':name,
      'city':city,
      'phone':phone,
      'age':age,
      'disease':disease,
      'uId':uId,




    };
  }
}