class OrderModel{

  String? blood;
  String? city;
  String? name;
  String? phone;
  String? age;
  String? state;
  String? amount;
  String? place;

  OrderModel({
    this.name,
    this.blood,
    this.city,
    this.phone,
    this.age,
    this.state,
    this.place,
    this.amount



   });


   OrderModel.fromjson(Map<String,dynamic>json){

    blood=json['blood'];
    name=json['name'];
    city=json['city'];
    phone=json['phone'];
    age=json['age'];
     state=json['state'];
     amount=json['amount'];
    place=json['place'];






  }
  Map<String,dynamic>toMap(){
    return{

      'blood':blood,
      'name':name,
      'city':city,
      'phone':phone,
      'age':age,
      'state':state,
      'amount':amount,
      'place':place,




    };
  }
}