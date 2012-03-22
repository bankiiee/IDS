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
        
        
function showNewsDialog(newsid){
        
    //        $.ajax({
    //            url: "/ajax_pages/my_page.ext",
    //            data: {....},
    //            success: function(data) {
    //              $(dialogName).append(data);

    //alert(newsid);
    $( "#show-news" ).load('showNewsPage.jsp?newsid='+newsid).dialog({
        height: 400,
        width:450,
        modal: true
    });
}

$(window).bind("load", function() { 

       var footerHeight = 0,
           footerTop = 0,
           $footer = $("#footer");

       positionFooter();

       function positionFooter() {

                footerHeight = $footer.height();
                footerTop = ($(window).scrollTop()+$(window).height()-footerHeight)+"px";

               if ( ($(document.body).height()+footerHeight) < $(window).height()) {
                   $footer.css({
                        position: "absolute"
                   }).animate({
                        top: footerTop
                   })
               } else {
                   $footer.css({
                        position: "absolute"
                   })
               }

       }

       $(window)
               .scroll(positionFooter)
               .resize(positionFooter)

});