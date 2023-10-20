String getNameInitials({required String name}){
  if(name != ""){
    var nameArr = name.split(" ");
    if(nameArr.length > 1){
      return "${nameArr[0][0]}${nameArr[1][0]}";
    }else{
      return "${nameArr[0][0]}";
    }
  }
  return "";
}
