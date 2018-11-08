/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    
    var rows = $("table#resultsTable tr:not(:first-child)");
    
    $("#selectField").on("change",function(){
        
        var selected = this.value;
        if(selected != "all"){
            console.log(selected);
            rows.filter("[position="+selected+"]").show();
            rows.not("[position="+selected+"]").hide();
        }else{
            rows.show();
        }
    });
    
});