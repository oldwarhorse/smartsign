//
//  createAccountViewController.m
//  Smartib_SignUp
//
//  Created by Leela Electronics on 25/11/15.
//  Copyright (c) 2015 Leela Electronics. All rights reserved.
//

#import "createAccountViewController.h"

@interface createAccountViewController ()

@end

@implementation createAccountViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:(0/255.0) green:(201/255.0) blue:(231/255.0) alpha:1];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(0/255.0) green:(201/255.0) blue:(231/255.0) alpha:1];

    
    UILabel *headLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,60,250,250)];
    [headLabel setFont:[UIFont boldSystemFontOfSize:16]];
    headLabel.text=@" create your accoount  ";
    [headLabel setTextColor:[UIColor whiteColor]];
    UIBarButtonItem *settingsButton5 = [[UIBarButtonItem alloc] initWithCustomView:headLabel];
    self.navigationItem.rightBarButtonItem=settingsButton5;
    
  
   [_userNameText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
   UIImage *image = [UIImage imageNamed:@"callout-2.png"];
  [_messageChekingBtn setBackgroundImage:image forState:UIControlStateNormal];

    [self viewDesigns];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (IBAction)Done:(id)sender
{
    
    
    
    
}

-(void)singleTapping:(UIGestureRecognizer *)recognizer
{
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Select method:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Take a photo  ",
                            @"Choose from library",
                            nil];
    popup.tag = 1;
    [popup showInView:self.view];
    
}


- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag)
    {
        case 1:
        {
            UIImagePickerController *imagePickerController =[[UIImagePickerController alloc] init];
            
            switch (buttonIndex) {
                case 0:
                    
                    
                    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
                    {
                        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                        picker.delegate = self;
                        [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
                        picker.allowsEditing = false;
                        [self presentViewController:picker animated:true completion:nil];
                    }
                    else
                    {
                        NSLog(@"please connec camera");
                    }
                    
                    NSLog(@"take photo");
                    
                    break;
                case 1:
                    imagePickerController.delegate = self;
                    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
                   [self presentModalViewController:imagePickerController animated:YES];
                    
                    break;
            }
            break;
        }
        default:
            break;
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
  [picker dismissModalViewControllerAnimated:YES];
    _profilePicture.clipsToBounds = YES;
    _profilePicture.layer.borderColor=[[UIColor clearColor] CGColor];
    _profilePicture.image=image;
    
}

-(void)textFieldDidChange :(UITextField *)theTextField
{
    
    // checking is the user name is available or not
    
    if([_userNameText.text isEqualToString:@"Available"])
    {
        UIImage *image = [UIImage imageNamed:@"checkMark@2x.png"];
        [_messageChekingBtn setBackgroundImage:image forState:UIControlStateNormal];
        
    }
    else if ([_userNameText.text isEqualToString:@"False"])
    {
        UIImage *image = [UIImage imageNamed:@"RedX-Medium.gif"];
        [_messageChekingBtn setBackgroundImage:image forState:UIControlStateNormal];
    }
    else
    {
        UIImage *image = [UIImage imageNamed:@"callout-2.png"];
        [_messageChekingBtn setBackgroundImage:image forState:UIControlStateNormal];
        
    }
    
    
    NSLog( @"text changed: %@", theTextField.text);
}


-(void)viewDesigns
{
    
    [_profilePicture setUserInteractionEnabled:YES];
    UITapGestureRecognizer *singleTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapping:)];
    [singleTap setNumberOfTapsRequired:1];
    [_profilePicture addGestureRecognizer:singleTap];
    
    _profilePicture.layer.cornerRadius = _profilePicture.frame.size.width / 2;
    _profilePicture.clipsToBounds = YES;
   // _profilePicture.layer.borderWidth=2.0;
   // _profilePicture.layer.borderColor=[[UIColor whiteColor] CGColor];
    
    


    // setting place holder text for the textfields
    
    NSAttributedString *usernameString = [[NSAttributedString alloc] initWithString:@"username " attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:0 green:201 blue:231 alpha:1.0]}];
        _userNameText.attributedPlaceholder =usernameString;
    
    NSAttributedString *nameString = [[NSAttributedString alloc] initWithString:@"name (optional) " attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:0 green:201 blue:231 alpha:1.0]}];
        _nameText.attributedPlaceholder =nameString;
    
    NSAttributedString *schoolString = [[NSAttributedString alloc] initWithString:@"name (optional) " attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:0 green:201 blue:231 alpha:1.0]}];
    _schoolText.attributedPlaceholder =schoolString;
    
    NSAttributedString *subjectString = [[NSAttributedString alloc] initWithString:@"name (optional) " attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:0 green:201 blue:231 alpha:1.0]}];
    _subjectText.attributedPlaceholder =subjectString;


}

@end
