cordova.maccatalyst = {
  isMacCatalyst:function(callback) {
      cordova.exec(callback, function(err) {
          callback('error in isMacCatalyst');
      }, "MacCatalyst", "isMacCatalyst", []);
  }
};