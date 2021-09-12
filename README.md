# cordova-plugin-ios-maccatalyst

Provides methods related to running iPad apps under macOS.

Documentation:

Right now, this provides just a single method.

cordova.maccatalyst.isCatalyst(callback);

Calls the provided callback with a value of true if the app is running on a Mac under Catalyst, false otherwise.

Example:

if(cordova.maccatalyst !== null){ // Won't exist on Android, etc.
  cordova.maccatalyst.isCatalyst(
    function (iscatalyst){
      alert("Are we running under Mac Catalyst? " + iscatalyst)
  });
}
