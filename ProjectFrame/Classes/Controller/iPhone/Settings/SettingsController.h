//
//  SettingsController.h
//  ProjectFrame
//
//  Created by Sean on 13-9-3.
//
//

#import "BaseViewController.h"

@interface SettingsController : BaseViewController

@property (retain, nonatomic) IBOutlet UIButton *btnDetail;
@property (retain, nonatomic) IBOutlet UIButton *btnLogin;

- (IBAction)onBtnDetailClick:(id)sender;
- (IBAction)onBtnLoginClick:(id)sender;

@end
