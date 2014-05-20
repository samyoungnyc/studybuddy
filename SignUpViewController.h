//
//  SignUpViewController.h
//  StudyBuddy3
//
//  Created by computer on 5/14/14.
//  Copyright (c) 2014 computer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)signUp:(id)sender;

@end
