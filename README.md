# cordova-plugin-ios-maccatalyst

Provides methods related to running iPad apps under macOS.

#Installation

As this plugin is written in Swift, you must first install the Swift bridging header plugin:

`cordova plugin add cordova-plugin-add-swift-support --save`

Then install this plugin with:

`cordova plugin add ../gits/cordova-plugin-ios-maccatalyst/ --save`

(for production: cordova plugin add https://github.com/pulpgrinder/cordova-plugin-ios-maccatalyst.git)

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

Right now, this method:

1. calls `maccatalyst.getMacCatalystContainerDocumentsFolder(callback)` and sets maccatalyst.containerDocumentsFolder to the result.
1. calls maccatalyst.isMacCatalyst and sets maccatalyst.hasMacCatalyst to the result.

## `maccatalyst.isMacCatalyst(callback)`

Calls the provided callback with a value of true if the app is running on a Mac under Catalyst, false if running on an iOS device. If you've called `maccatalyst.intializeMacCatalystPlugin()`, you can just look at the value of `maccatalyst.hasMacCatalyst` without calling this method.

##Examples:
```javascript
if(maccatalyst !== undefined){ 
  maccatalyst.isMacCatalyst(
    function (iscatalyst){
      alert("Are we running under Mac Catalyst? " + iscatalyst)
  });
}
```
Or, if you've called `maccatalyst.intializeMacCatalystPlugin()`, you can just do:

```javascript
if(maccatalyst !== undefined){ 
      alert("Are we running under Mac Catalyst? " + maccatalyst.macCatalystEnvironment)
  };
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

## `maccatalyst.getMacCatalystContainerDocumentsFolder(callback)`

Returns the file:// URL for the app's sandboxed container. On an iOS device, this is the same as `cordova.file.documentsDirectory`, but in an iPad app running on macOS under Mac Catalyst, it is  an app's sandboxed Documents folder is found at `/Library/Containers/{appname}/Data/Documents/`, rather than the standard `~/Documents/`. This is important if you are (e.g.) using iCloud to sync your documents between desktop and mobile. For that to work properly, the desktop files need to be stored in the container's Documents folder, not the top-level `~/Documents/` folder.

As a convenience, `maccatalyst.intializeMacCatalystPlugin()` calls this code and sets maccatalyst.containerDocumentsFolder to this value, so you don't need to be calling it each time.

##Examples:
```javascript
if(maccatalyst !== undefined){ 
    maccatalyst.getMacCatalystContainerDocumentsFolder(function(folderURL){
      console.log("Container documents folder is " + folderURL);
    })
}
```

Or, if you've called `maccatalyst.intializeMacCatalystPlugin()`, you can just do:

```javascript
if(maccatalyst !== undefined){ 
  console.log("Container documents folder is " + maccatalyst.containerDocumentsFolder);
}
```




