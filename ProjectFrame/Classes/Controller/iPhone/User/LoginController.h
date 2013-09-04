//
//  LoginController.h
//  ProjectFrame
//
//  Created by Sean on 13-9-4.
//
//

#import "BaseViewController.h"
#import "Button.h"

@interface LoginController : BaseViewController

@property (retain, nonatomic) IBOutlet Button *btnCancel;

- (IBAction)onBtnCancelClick:(id)sender;

@end
