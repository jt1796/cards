window.onload=function(){
  genRows('cardtable');
  altRows('cardtable');
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
    }
  }
}

function genRows(id){
    var table = document.getElementById(id)
    var row = table.insertRow(1)
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell2 = row.insertCell(2);
    table.insertRow(2).insertCell(0);

    cell1.innerHTML = "HI";
}