# TruetimeandroidPlugin
It’s an Android Cordova plugin that provides true time of the device

1. To add this plugin to your project run the following command in the root folder:                                                           
    cordova plugin add https://github.com/navroopsinghsandhu/TruetimeandroidPlugin                                                                        
2. Then add the following code in www/index.js of your project                                                                                                    
    window.plugins.truetimeandroidPlugin.getTrueTime('', 'long', function(event) {                                                                               
          //This the success callback function                                                                                                                      
          //you can access the data using "event['callback']"                                                                                                                   
        }, function(err) {                                                                                                                                      
          console.log('Uh oh.. ' + err);                                                                                                                   
        }); 
