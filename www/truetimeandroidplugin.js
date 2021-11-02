// Empty constructor
function TruetimeandroidPlugin() {}

// The function that passes work along to native shells
// Message is a string, duration may be 'long' or 'short'
TruetimeandroidPlugin.prototype.getTrueTime = function(message, duration, successCallback, errorCallback) {
  var options = {};
  options.message = message;
  options.duration = duration;
  cordova.exec(successCallback, errorCallback, 'TruetimeandroidPlugin', 'getTime', [options]);
}

// Installation constructor that binds TruetimeandroidPlugin to window
TruetimeandroidPlugin.install = function() {
  if (!window.plugins) {
    window.plugins = {};
  }
  window.plugins.truetimeandroidPlugin = new TruetimeandroidPlugin();
  return window.plugins.truetimeandroidPlugin;
};
cordova.addConstructor(TruetimeandroidPlugin.install);