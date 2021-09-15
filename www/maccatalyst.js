var exec = require('cordova/exec');
exports.checkMacCatalyst = function(success) {
  exec(success, function(err){console.log(err)}, 'maccatalyst', 'isMacCatalyst', []);
};
exports.pickDocument = function(types,success) {
  exec(success, function(err){console.log(err)}, 'maccatalyst', 'pickDocument', [types,success]);
}
exports.getMacCatalystContainerDocumentsFolder = function(success) {
  exec(success, function(err){console.log(err)}, 'maccatalyst', 'getMacCatalystContainerDocumentsFolder', []);
};
exports.intializeMacCatalystPlugin = function(){
  maccatalyst.checkMacCatalyst(function(result){
    maccatalyst.isMacCatalyst = result;
  })
  maccatalyst.getMacCatalystContainerDocumentsFolder(function(folderURL){
    maccatalyst.containerDocumentsDirectory = folderURL;
  })
}