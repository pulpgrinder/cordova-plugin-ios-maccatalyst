# cordova-ios-catalyst

Provides methods related to running iPad apps under macOS.

Documentation:

Right now, this provides just a single method.

cordova.isCatalyst(callback);

Calls the provided callback with a value of true if the app is running on a Mac under Catalyst, false otherwise.

Example:

cordova.isCatalyst(
  function (iscatalyst){
  alert("Are we running under Mac Catalyst? " + iscatalyst)
  });