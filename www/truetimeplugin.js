// Empty constructor
function TruetimePlugin() {}

// The function that passes work along to native shells
// Message is a string, duration may be 'long' or 'short'
TruetimePlugin.prototype.getTrueTime = function(message, duration, successCallback, errorCallback) {
  var options = {};
  options.message = message;
  options.duration = duration;
  cordova.exec(successCallback, errorCallback, 'TruetimePlugin', 'getTime', [options.messages]);
}

// Installation constructor that binds TruetimePlugin to window
TruetimePlugin.install = function() {
  if (!window.plugins) {
    window.plugins = {};
  }
  window.plugins.truetimeplugin = new TruetimePlugin();
  return window.plugins.truetimeplugin;
};
cordova.addConstructor(TruetimePlugin.install);