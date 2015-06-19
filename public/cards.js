var allCards;

window.onload=function(){
  altRows('cardtable1');
  altRows('cardtable2');
  altRows('cardtable3');
}


function altRows(id){
  if(document.getElementsByTagName){

    var table = document.getElementById(id);
    var rows = table.getElementsByTagName("tr");

    for(i = 0; i < rows.length; i++){
      if(i % 2 == 0){
        rows[i].className = "evenrowcolor";
      }else{
        rows[i].className = "oddrowcolor";
      }
      if(i == 0) {
        rows[i].className = "toprowcolor";
      }
    }
  }
}
