//Global variables:
var xhr;			//Used for AJAX
var ws_url = "http://mywebservice.com/";	//Hypothetical Web Service URL


/**
 * This method sends latitude longitude to a Web service using HTTP GET.
 */
function shareGPSInfo() {
    try {
	
        var coords = JSON.parse(window.localStorage.getItem("KeyNameGPS"));
        if (coords) {
		
            xhr = new XMLHttpRequest();
            xhr.open('GET', ws_url + "?l=" + coords.latitude + "&" + coords.longitude, true);
            xhr.onreadystatechange = function(e) {
                if (xhr.readyState == 4) {
                    if ((xhr.status == 200 || xhr.status == 0)) {
                        //Successful XHR Call
                        alert("GPS info successfully submitted.");
                    }
                }	
            };
            xhr.send(null);
        }
    }
    catch (e) {
        console.log("shareGPSInfo Exception : " + e);
    }
}


function displayGPS(coords)
{
    try
    {
        var lat = coords.latitude;
        var lon = coords.longitude;
        var acc = coords.accuracy;
		
        var ele = document.getElementById("currentGPS");
        if (ele)
        {
            ele.innerHTML = "Your location is " + lat + ", " + lon + " (accuracy " + acc + ")";
        }
    } 
    catch (e) {
        console.log("displayGPS Exception : " + e);
    }
}

/**
 * Call back function used to process the Position object returned by the Geolocation service
 *
 * @params position (Position) - contains geographic information acquired by the geolocation service.
 *     http://dev.w3.org/geo/api/spec-source.html#position_interface
 */
function onGeoSuccess(position) 
{
    try
    {
        //Cache the GPS coordinates
        if (window.localStorage)
        {
            window.localStorage.setItem("KeyNameGPS", JSON.stringify(position.coords))
        }
		
        displayGPS(position.coords);
		
    } 
    catch (e) {
        console.log("onGeoSuccess Exception : " + e);
    }
}

/**
 * Call back function raised by the Geolocation service when an error occurs
 *
 * @param posError (PositionError) - contains the code and message of the error that occurred while retrieving geolocation info.
 *     http://dev.w3.org/geo/api/spec-source.html#position-error
 */
function onGeoError(posError)
{
    try
    {
        if (!posError)
        {
            return false;
        }
		
        switch(posError.code)
        {
            case posError.TIMEOUT:
                console.log("onGeoError TIMEOUT: " + posError.message);
                break;
            case posError.PERMISSION_DENIED:
                console.log("onGeoError PERMISSION DENIED: " + posError.message);
                break;
            case posError.POSITION_UNAVAILABLE:
                console.log("onGeoError POSITION UNAVAILABLE: " + posError.message);
                break;
            default:
                console.log("onGeoError UNHANDLED MESSAGE CODE (" + posError.code + "): " + posError.message);
                break;
        }
    } 
    catch (e) {
        console.log("onGeoError Exception: " + e);
    }
}



/**
 * Use the geolocation service to retrieve geographic information about the user's current location.
 */
function refreshGPS()
{
    try
    {

        //First test to see that the browser supports the Geolocation API
        if (navigator.geolocation !== null)
        {
            //Configure optional parameters:
            var geoOptions = {
                enableHighAccuracy : true, 
                timeout : 60000, 
                maximumAge : 0
            };
            navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError, geoOptions);
        } 
        else {
            alert("Sorry, HTML5 geolocation is not supported by this application.");
        }
    } 
    catch (e) {
        console.log("getPosition Exception: " + e);
    }
}

function openMaps()
{
    if (window.localStorage)
    {
        var coords = JSON.parse(window.localStorage.getItem("KeyNameGPS"));
        if (coords)
        {
            var mapArgs;
			
            //Check to see if the MapsArguments API is supported, if so use it.
            if (blackberry.invoke.MapsArguments !== undefined)
            {
                mapArgs = new blackberry.invoke.MapsArguments(coords.latitude, coords.longitude);
            }
			
            blackberry.invoke.invoke(blackberry.invoke.APP_MAPS, mapArgs);
        }
    }
}


function helloWorld()
{
    alert("Hello World");
}


function showMenuBar()
{
    document.getElementById("tabletOSmenuBar").className = "showMenuBar";
}
function hideMenuBar()
{
    document.getElementById("tabletOSmenuBar").className = "hideMenuBar";
}

/**
 * Menus are supported in different ways across BlackBerry WebWorks:
 *    On Smartphones, items are integrated into the system menu. 
 *    On Tablet OS, custom menu bars are created and can be invoked using swipe down gestures from the bezel.
 * This method attempts to provide a way of supporting both with the same code base.
 */

function addMenus() 
{
    try 
    {

        if (typeof blackberry.app.event.onSwipeDown === "function")
        {
            //BlackBerry Tablet OS - Tablet OS uses a different menu system (swipe down from the bezel)
            blackberry.app.event.onSwipeDown(showMenuBar);
        } else {
            // BlackBerry Smartphone OS - menu items integrated with system menu:
            blackberry.ui.menu.clearMenuItems();
			
            var mi_top       = new blackberry.ui.menu.MenuItem(true,  0);
            var mi_maps      = new blackberry.ui.menu.MenuItem(false, 1, "Open in Maps", openMaps);
            var mi_bottom    = new blackberry.ui.menu.MenuItem(true,  3);

            blackberry.ui.menu.addMenuItem(mi_top);
            blackberry.ui.menu.addMenuItem(mi_maps);
            blackberry.ui.menu.addMenuItem(mi_bottom);
        }
		
    } 
    catch (e) {
        console.log("addMenus Exception: " + e.name + "; " + e.message);
    }
}

function doPageLoad()
{
    // Retrieve and display last known GPS coordinates saved in local storage
    if (window.localStorage)
    {
	
        var lastKnownGPS = JSON.parse(window.localStorage.getItem("KeyNameGPS"));
        if (lastKnownGPS)
        {
            displayGPS(lastKnownGPS);
        }
    }
    else {
        console.log("doPageLoad: HTML5 storage not supported");
    }
	
    //Immediately update the GPS coordinates
    refreshGPS();
	
    //Add menu items
    addMenus();
}
function validateUser(){
    alert('ssss');
     $("form-data").submit(function() {  
    // we want to store the values from the form input box, then send via ajax below  
    $data = this.serialize();
    alert("hashsdf"+$data);
        $.ajax({  
            type: "POST",  
            url: "../LoginServlet",  
            data: $data,  
            success: function(){  
               window.location.href = 'home.jsp';
  
            }  
        });  
    return false;  
    });  
}
function doLogout(){
    window.location.href = "../logout.jsp";
}

window.addEventListener("load", doPageLoad, false);
