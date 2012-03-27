/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    // a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
    var view = getUrlVars()["v"];

               
    if(view == 999){
        $( "#dialog:ui-dialog" ).dialog( "destroy" );
        $( "#dialog" ).dialog({
            height: 210,
            width:450,
            modal: true
        });
    }
               
});
        
$(document).ready(function(){
    // a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
		
    $("#accordion").accordion({
        collapsible: true,
        autoHeight: false,
        navigation: true
    });
    
                
                
});

        
function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
}
        
        
        

