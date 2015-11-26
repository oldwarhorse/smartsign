//
//  ViewController.h
//  Smartib_SignUp
//
//  Created by Leela Electronics on 25/11/15.
//  Copyright (c) 2015 Leela Electronics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController



@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

@property (weak, nonatomic) IBOutlet UIButton *SignupOrLoginBtn;

@property (weak, nonatomic) IBOutlet UIButton *forgetPasswordBtn;


- (IBAction)signUpOrLogin:(id)sender;

- (IBAction)forgetPassword:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *txtUserName;

@property (weak, nonatomic) IBOutlet UITextField *txtPAssword;

@end

