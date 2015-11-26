//
//  createAccountViewController.h
//  Smartib_SignUp
//
//  Created by Leela Electronics on 25/11/15.
//  Copyright (c) 2015 Leela Electronics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface createAccountViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *uimageBackground;

@property (weak, nonatomic) IBOutlet UIView *viewColor;

@property (weak, nonatomic) IBOutlet UITextField *userNameText;

@property (weak, nonatomic) IBOutlet UITextField *nameText;

@property (weak, nonatomic) IBOutlet UITextField *schoolText;

@property (weak, nonatomic) IBOutlet UITextField *subjectText;

- (IBAction)Done:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;



@property (weak, nonatomic) IBOutlet UIButton *messageChekingBtn;

@end
