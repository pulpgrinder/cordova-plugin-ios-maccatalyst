var exec = require('cordova/exec');
exports.isMacCatalyst = function(success) {
  exec(success, function(err){console.log(err)}, 'maccatalyst', 'isMacCatalyst', []);
};
exports.pickDocument = function(types,success) {
  exec(success, function(err){console.log(err)}, 'maccatalyst', 'pickDocument', [types,success]);
}
exports.getMacCatalystContainerDocumentsFolder = function(success) {
  exec(success, function(err){console.log(err)}, 'maccatalyst', 'getMacCatalystContainerDocumentsFolder', []);
};
exports.intializeMacCatalystPlugin = function(){
  maccatalyst.isMacCatalyst(function(result){
    maccatalyst.hasMacCatalyst = result;
  })
  maccatalyst.getMacCatalystContainerDocumentsFolder(function(folderURL){
    maccatalyst.containerDocumentsFolder = folderURL;
  })
}