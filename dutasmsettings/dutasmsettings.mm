#include <Preferences/PSListController.h>
#include <Preferences/PSSpecifier.h>
#include <unistd.h>


@interface TASMsettingsListController: PSListController <UIAlertViewDelegate> {
}
@end

@implementation TASMsettingsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"dutasmsettings" target:self];
	}
    return _specifiers;
}

-(void)viewDidLoad {

    [super viewDidLoad];
    PSSpecifier *creditspecifier = [self specifierForID:@"myCreditsSpecifier"];
    [creditspecifier setProperty:[NSString stringWithFormat:@"Credits:\nDu'Islingr'"] forKey:@"footerText"];

 }

-(void)respring {
    system("killall -9 SpringBoard");
}

- (void)link {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com"]];
}

@end
