#include <Liberation.h>
#include "Config.h"

uintptr_t awesomesauce = (uintptr_t)_dyld_get_image_vmaddr_slide(0);

CNDeclare(spidercoins,0x107e6c);
CNDeclare(skillpoints,0x107988);

hidme void setAlertInfo(const char *alertTitle, const char *alertMessage) {

title = alertTitle;
theMsg = alertMessage;
}

hidme void didFinishLaunching(CFNotificationCenterRef center,void *observer,CFStringRef name, const void *object, CFDictionaryRef info) {

UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"The Amazing Spider-Man Cheats" message:@"Hacked by Du'Islingr." delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
[av show];

        Settings settings = "dutasmsettings.plist"; //your pist name

        Patch spidercoinsPatch = Patch((spidercoins + awesomesauce), "391c");
        Patch skillpointsPatch = Patch((skillpoints + awesomesauce), "391c");

        bool spdrc = settings["coinkey"];
        bool skllp = settings["skillkey"];

        if (spdrc) {
            spidercoinsPatch.Apply();
        } else {
            spidercoinsPatch.Reset();
        }

        if (skllp) {
            skillpointsPatch.Apply();
        } else {
            skillpointsPatch.Reset();
        }


}

CNConstructor(Charizard) {
CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching,(CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}