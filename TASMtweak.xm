#include <Liberation.h>
#include "ConfigLite.h"

uintptr_t awesomesauce = 0x0;

CNDeclare(spidercoins,0x107e6c);
CNDeclare(skillpoints,0x107988);

hidme void didFinishLaunching(CFNotificationCenterRef center,void *observer,CFStringRef name, const void *object, CFDictionaryRef info) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 15 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                dispatch_async(dispatch_get_main_queue(), ^{
                        if (NSClassFromString(@"UIAlertController"))
                        {
                                UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
                                while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed)
                                {
                                        view = view.presentedViewController;
                                }
                                UIAlertController *alertController =
                                        [UIAlertController alertControllerWithTitle:@"The Amazing Spider-Man Cheats"
                                         message:@"Hacked by Du'Islingr. Powered by Liberation."
                                         preferredStyle:UIAlertControllerStyleAlert];
                                [alertController addAction:[UIAlertAction actionWithTitle:@"Continue"
                                                            style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction *action){
                                                            }]];

                                [view presentViewController:alertController animated:YES completion:nil];
                        }
                        else
                        {
                                UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"The Amazing Spider-Man Cheats" message:@"Hacked by Du'Islingr. Powered by Liberation." delegate:nil cancelButtonTitle:@"Continue" otherButtonTitles:nil];
                                [av show];
                        }

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
                });
        });

}

CNConstructor(Charizard) {
        awesomesauce = (uintptr_t)_dyld_get_image_vmaddr_slide(0);
        CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching,(CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}
