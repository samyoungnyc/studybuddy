//
//  SignUpViewController.m
//  StudyBuddy3
//
//  Created by computer on 5/14/14.
//  Copyright (c) 2014 computer. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>

@interface SignUpViewController ()

@end

@implementation SignUpViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}


- (IBAction)signUp:(id)sender {
    NSString *name = [self.nameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];    
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    username = [username lowercaseString]; // converts all usernames to lowercase
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    if ([name length] == 0 || [username length] == 0 || [email length] == 0 || [password length] == 0 ) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter all info!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
    }
    
    else if ([name length] < 6 || [username length] < 6 || [email length] < 6 || [password length] < 6 ) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"All fields must be atleast 6 characters" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
        
    }
    
    else if ([email rangeOfString:@".edu"].location == NSNotFound) {
       UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Study Buddy only works with .edu email accounts" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
    }

    else {
        
        PFUser *newUser = [PFUser user];
        newUser[@"name"] = name;
        newUser.username = username;
        newUser.email = email;
        newUser.password = password;
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error) {
                
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
            else {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
        
    }

}




        
@end
