//
//  SettingsController.h
//  ProjectFrame
//
//  Created by Sean on 13-9-3.
//
//

#import "BaseViewController.h"
#import "Button.h"

@interface SettingsController : BaseViewController

@property (retain, nonatomic) IBOutlet Button *btnDetail;
@property (retain, nonatomic) IBOutlet Button *btnLogin;

- (IBAction)onBtnDetailClick:(id)sender;
- (IBAction)onBtnLoginClick:(id)sender;

@end
