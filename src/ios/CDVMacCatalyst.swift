import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

@objc(MacCatalyst) class MacCatalyst : CDVPlugin,UIDocumentPickerDelegate{
  var pluginCommand:String;
  override init(){
    pluginCommand = "";
    super.init();
  }
  @objc(checkMacCatalyst:)
  func checkMacCatalyst(command: CDVInvokedUrlCommand) {
    var pluginResult = CDVPluginResult(
      status: CDVCommandStatus_ERROR
    )
    #if targetEnvironment(macCatalyst)
      pluginResult = CDVPluginResult(
           status: CDVCommandStatus_OK,
           messageAs: true
         )
    #else
      pluginResult = CDVPluginResult(
           status: CDVCommandStatus_OK,
           messageAs: false
         )
    #endif
     self.commandDelegate!.send(
      pluginResult,
      callbackId: command.callbackId
    )
  }
  @objc(pickDocument:)
  func pickDocument(command: CDVInvokedUrlCommand) {
    let stringTypes:[String] = command.arguments[0] as! [String];
    let types: [UTType] = stringTypes.map{UTType(filenameExtension: $0)!};
    let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: types)
    documentPicker.delegate = self
    documentPicker.modalPresentationStyle = .formSheet
    self.pluginCommand = command.callbackId
    self.viewController.present(documentPicker, animated: true, completion: nil)
  }
  func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
    var urlStrings:[String];
    urlStrings = urls.map{$0.absoluteString as String};
    let pluginResult = CDVPluginResult(
        status: CDVCommandStatus_OK,
        messageAs: urlStrings
    )
    self.commandDelegate!.send(pluginResult,callbackId:pluginCommand)
       
    }
    @objc(getMacCatalystContainerDocumentsFolder:)
    func getMacCatalystContainerDocumentsFolder(command: CDVInvokedUrlCommand){
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = urls[0].absoluteString as String;
        let pluginResult = CDVPluginResult(
             status: CDVCommandStatus_OK,
             messageAs: documentsDirectory
           )
       self.commandDelegate!.send(
        pluginResult,
        callbackId: command.callbackId
       )

    }
}
