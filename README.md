# TruetimeandroidPlugin
It’s an Android Cordova plugin that provides true time of the device

1. To add this plugin to your project run the following command in the root folder:                                                           
    cordova plugin add https://github.com/navroopsinghsandhu/TruetimePlugin                                                                        
2. Then add the following code in www/index.js of your project                                                                                                    
    window.plugins.truetimePlugin.getTrueTime('', 'long', function(event) {                                                                               
          //This the success callback function                                                                                                                      
          //you can access the timestamp for now() using "event['callback']"   
          // please note that this timestamp comproses of t[3] + offset
          //t0 using "event['t0']"                                                                                                                                                                
          //t1 using "event['t1']"                                                                                                                                          
          //t2 using "event['t2']"                                                                                                                                              
          //t3 using "event['t3']"                                                                                                                                                      
          //delay using "event['delay']"                                                                                                            
        }, function(err) {                                                                                                                                      
          console.log('Uh oh.. ' + err);                                                                                                                   
        }); 

To update the plugin run following two commands in your root and you're good to go for the build without any further changes:                                                                                                                                           
1. cordova plugin remove truetimeplugin                                                                                                                  
2. cordova plugin add https://github.com/navroopsinghsandhu/TruetimePlugin 
