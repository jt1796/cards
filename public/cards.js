var allCards;

window.onload=function(){
  allCards = getCards();
  ready = allCards["ready"];
  verified = allCards["verified"];
    
  genRows('cardtable1', allCards["ready"]);
  altRows('cardtable1');
  
  genRows('cardtable2', allCards["progress"]);
  altRows('cardtable2');
  
  genRows('cardtable3', allCards["verified"]);
  altRows('cardtable3');
}

function getCards(){
    var xmlHTTP = new XMLHttpRequest();
    xmlHTTP.open("GET", "api?username=john&password=jjj", true);
    xmlHTTP.send(null);
    alert(xmlHTTP.responseText);
    return JSON.parse(xmlHTTP.responseText);
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

function genRows(id, cards){
    var table = document.getElementById(id)
    
    var row = 1, i;
    for (i in cards) {
      newRow = table.insertRow(row++);
      var cell1 = newRow.insertCell(0);
      var cell2 = newRow.insertCell(1);
      var cell3 = newRow.insertCell(2);
      cell1.innerHTML = i
      cell2.innerHTML = cards[i]["body"]
      cell3.innerHTML = cards[i]["acceptance"]
    }
}