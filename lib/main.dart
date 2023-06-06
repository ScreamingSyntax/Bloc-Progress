Stream<int> boatStream() async*{
  for(int i =0;i<=10;i++){
    print("Sending boat no. $i");
    await Future.delayed(const Duration(seconds: 2));
    yield i;
  }
}

void main(){
  Stream<int> boat = boatStream();
  boat.listen((recievedData) async{
    print("Recieved boat no. $recievedData");
    // await Future.delayed(Duration(seconds: 2));
   });
}

