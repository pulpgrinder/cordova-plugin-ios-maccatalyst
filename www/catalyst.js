cordova.isCatalyst = function(callback) {
    cordova.exec(callback, function(err) {
        callback('error in isCatalyst');
    }, "Catalyst", "isCatalyst", []);
};