/********* Catalyst.m Cordova Plugin Implementation *******/

#import "CDVCatalyst.h"
#import <Cordova/CDVPlugin.h>

@implementation CDVCatalyst

- (void)isCatalyst:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    BOOL isCatalystValue;
    #if TARGET_OS_MACCATALYST
      isCatalystValue = TRUE; 
    #else
      isCatalystValue = FALSE;
    #endif
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isCatalystValue];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
