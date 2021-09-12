/********* Catalyst.m Cordova Plugin Implementation *******/

#import "CDVMacCatalyst.h"
#import <Cordova/CDVPlugin.h>

@implementation CDVMacCatalyst
- (void)isMacCatalyst:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    BOOL isMacCatalystValue;
    #if TARGET_OS_MACCATALYST
      isMacCatalystValue = TRUE; 
    #else
      isMacCatalystValue = FALSE;
    #endif
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isMacCatalystValue];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end