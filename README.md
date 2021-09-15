# cordova-plugin-ios-maccatalyst

Provides methods related to running iPad apps under macOS.

Note that in order to make your app compile and run under Mac Catalyst, you will need to alter the copy-www-build-step.sh file as detailed in https://github.com/apache/cordova-ios/issues/699

# Installation

As this plugin is written in Swift, you should first install the Swift support plugin with:

`cordova plugin add cordova-plugin-add-swift-support --save`

Then install the MacCatalyst plugin with:

`cordova plugin add https://github.com/pulpgrinder/cordova-plugin-ios-maccatalyst.git`

You can remove it with:

`cordova plugin remove com-pulpgrinder-plugins-maccatalyst`


# Usage

## `maccatalyst.intializeMacCatalystPlugin()`

This takes care of any initialization. You should call this once after everything has been loaded and the device is ready (e.g., call it from your `deviceready` event handler). Takes no parameters, returns no result.

```javascript
  maccatalyst.intializeMacCatalystPlugin();
```

After calling this, the `maccatalyst` object will have a couple of additional keys:

`maccatalyst.isMacCatalyst`

This will be set to `true` if the app is running on a desktop Mac under Mac Catalyst, `false` if it is running on a physical iOS device.

`maccatalyst.containerDocumentsDirectory`

This is the file URL for the app's Documents directory in the sandboxed container folder. On a physical iOS device, this is identical to `cordova.file.documentsDirectory`. On a desktop macOS device, this will be set to `/Library/Containers/{app name}/Data/Documents`, regardless of the app's sandbox status. On an unsandboxed macOS app, cordova.file.documentsDirectory is set to `~/Documents`. You may need to use the container folder if you're using iCloud to sync files between desktop and mobile. 

## `maccatalyst.checkMacCatalyst(callback)`

Used by `maccatalyst.intializeMacCatalystPlugin` to determine whether the app is running on desktop or mobile. It is not necessary to call this yourself. Just look at the value of `maccatalyst.isMacCatalyst' after initializing the plugin.

## Example:
```javascript
if(maccatalyst !== undefined){ 
      alert("Are we running under Mac Catalyst? " + maccatalyst.isMacCatalyst)
  };
}
```

## `maccatalyst.getMacCatalystContainerDocumentsFolder(callback)`

Used by `maccatalyst.intializeMacCatalystPlugin` to determine the documents folder inside the app's container. It is not necessary to call this yourself. Just look at the value of `maccatalyst.containerDocumentsFolder` after initializing the plugin.

##Example
```javascript
if(maccatalyst !== undefined){ 
  console.log("Container documents folder is " + maccatalyst.containerDocumentsFolder);
}
```

## `maccatalyst.pickDocument(file types, callback)`

Called with an array of file extensions. Displays the native document picker. If the array is empty, any file can be selected.
If the user selects a file, the provided callback with an array of string URLs. Multiple selection is planned, but not implemented yet. 

If the user cancels the document picker, no callback is called.

##Example:
```javascript
if(maccatalyst !== undefined){ 
  maccatalyst.pickDocument(
    ["html"],
    function(urls){
      console.log(urls)
  })
}
```
