//
//  ViewController.m
//  Smartib_SignUp
//
//  Created by Leela Electronics on 25/11/15.
//  Copyright (c) 2015 Leela Electronics. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()
{
    UIBarButtonItem *barButtonSignUp;
    UIBarButtonItem *barButtonLogin;
    NSDictionary*submitDictionary;
    int Yvalue;
    UIStoryboard *storyboard;
    
}
@end
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:(4/255.0) green:(28/255.0) blue:(38/255.0) alpha:1];
  self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(4/255.0) green:(28/255.0) blue:(38/255.0) alpha:1];
    
    /*
     setting the login and signup bar buttons
    */
    barButtonSignUp=[[UIBarButtonItem alloc]initWithTitle:@"signup" style:UIBarButtonItemStylePlain  target:self  action:@selector(signUP)];
    [barButtonSignUp setTintColor:[UIColor cyanColor]];
    self.navigationItem.leftBarButtonItem=barButtonSignUp;
    barButtonLogin = [[UIBarButtonItem alloc] initWithTitle:@"login" style:UIBarButtonItemStylePlain  target:self action:@selector(logIn)];
    self.navigationItem.rightBarButtonItem=barButtonLogin;
    [barButtonLogin setTintColor:[UIColor whiteColor]];

    [_SignupOrLoginBtn setTitle: @"create account" forState: UIControlStateNormal];
    _forgetPasswordBtn.hidden=YES;

    [self textFieldDesign];
    
    
}
-(void)signUP
{
    NSLog(@"SignUpClicked");
    [_SignupOrLoginBtn setTitle:@"create account" forState: UIControlStateNormal];
    [barButtonSignUp setTintColor:[UIColor colorWithRed:0 green:201 blue:231 alpha:1.0]];
    [barButtonLogin setTintColor:[UIColor whiteColor]];
    _forgetPasswordBtn.hidden=YES;
}

-(void)logIn
{
    NSLog(@"loginClicked");
    [_SignupOrLoginBtn setTitle:@"login " forState: UIControlStateNormal];
    [barButtonLogin setTintColor:[UIColor colorWithRed:0 green:201 blue:231 alpha:1.0]];
    [barButtonSignUp setTintColor:[UIColor whiteColor]];
    _forgetPasswordBtn.hidden=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)signUpOrLogin:(id)sender
{
    
    if([_SignupOrLoginBtn.titleLabel.text isEqualToString:@"create account"] )
    {
        NSLog(@"Create your account ");
        
        
        if ([_txtUserName.text isEqualToString:@""] && [_txtPAssword.text isEqualToString:@""])
        {
            [[[UIAlertView alloc]initWithTitle:@"All fields is required" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil]show];
        }
        else
        {
            
                if ([_txtUserName.text isEqualToString:@""])
                {
                    [[[UIAlertView alloc]initWithTitle:@"Email" message:@"This fields is required" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil]show];
                }
                else
                {
                    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
                    
                    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
                    
                    if (![emailTest evaluateWithObject:_txtUserName.text] == YES)
                    {
                        [[[UIAlertView alloc]initWithTitle:@"Email" message:@"Please enter a valid email address" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil]show];
                    }else
                    {
                        if([_txtPAssword.text isEqualToString:@""] )
                        {
                            [[[UIAlertView alloc]initWithTitle:@"Password" message:@"This fields is required" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil]show];
                        }
                        
                        else
                        {
                            /*
                            NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
                            NSDictionary *registrationDict=[NSDictionary dictionaryWithObjectsAndKeys:_txtUserName.text,@"email",_txtPAssword,@"password",nil];
                            
                            NSString *urlString = [NSString stringWithFormat:@"http://urll "];
                            urlRequest.URL = [NSURL URLWithString:urlString];
                            [urlRequest setHTTPMethod:@"POST"];
                            [urlRequest addValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-type"];
                            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:registrationDict options:0 error:NULL];
                            [urlRequest setHTTPBody:jsonData];
                            NSHTTPURLResponse *response = nil;
                            NSError *error ;
                            NSData *returnData =[NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
                            NSString* newStr = [NSString stringWithUTF8String:[returnData bytes]];
                            NSLog(@"return data %@",newStr);
                            NSLog(@"urlString: %@\npayloadDict: %@", urlString, registrationDict);
                             */
                            NSData *returnData=nil;
                            
                            if (returnData==nil)
                            {
                               // NSLog(@"user  exists ..... ");
                                
                                //  submitDictionary = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&error];
                                
                                // if ([[submitDictionary objectForKey:@"msg"]isEqualToString:@"Registered Successfully"])
                                
                                NSString *status=@"succesfuly regisred";
                                if([status isEqualToString:@"succesfuly regisred"])
                                    
                                {
                                    [[[UIAlertView alloc]initWithTitle:@"succesfuly regisred"message:@"registerd" delegate:self cancelButtonTitle:@"Cancel"otherButtonTitles: nil,nil]show];
                                    NSString*log=@"1";
                                    
                                    if ([log isEqualToString:@"1"])
                                    {
                                        
                                        NSLog(@"logged in ");
                                        // calling create your account profile using segue
                                        [self performSegueWithIdentifier:@"createAccountSegue" sender:self];
                                        
                                    }
                                    else{
                                        [[[UIAlertView alloc]initWithTitle:@"not succesfuly regisred"message:[submitDictionary objectForKey:@"msg"] delegate:self cancelButtonTitle:@"Cancel"otherButtonTitles: nil,nil]show];
                                        NSLog(@"nil");
                                    }
                                }
                                
                            }else
                            {
                                NSLog(@"user  exists ..... ");

                            }
      
                            
                        }
                    }
                }
            }
        
       
        
    }
    else
    {
        NSLog(@"login ");
        
        
        NSLog(@"login ");
        // cheking for login
        
        if ([_emailText.text isEqualToString:@""]&&[_passwordText.text isEqualToString:@""])
        {
            [[[UIAlertView alloc]initWithTitle:nil message:@"Please enter email and password" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil]show];
        }
        else{
            
            if ([_emailText.text isEqualToString:@""])
            {
                [[[UIAlertView alloc]initWithTitle:@"Email is missing!" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil]show];
            }
            else
            {
                NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
                NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
                if (![emailTest evaluateWithObject:_emailText.text] == YES)
                {
                    [[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter a valid email address" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil]show];
                }
                else
                {
                    if([_passwordText.text isEqualToString:@""] )
                    {
                        [[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Missing password" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil]show];
                    }
                    else
                    {
                        //Login
                        //call webservice
                        
                        /*
                        NSDictionary *payloadDict =[NSDictionary dictionaryWithObjectsAndKeys:_emailText.text,@"email",_passwordText.text,@"password", nil];
                        NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] init];
                        NSString *urlString = [NSString stringWithFormat:@"http:/// url "];
                        urlRequest.URL = [NSURL URLWithString:urlString];
                        [urlRequest setHTTPMethod:@"POST"];
                        [urlRequest addValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-type"];
                        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:payloadDict options:0 error:NULL];
                        [urlRequest setHTTPBody:jsonData];
                        NSHTTPURLResponse *response = nil;
                        NSError *error ;
                        NSData *returnData =[NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
                        NSLog(@"urlString: %@\npayloadDict: %@", urlString, payloadDict);
                        
                         */
                        NSData *returnData =nil;
                        if (returnData == nil)
                        {
                          //  submitDictionary = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&error];
                            
                         //   if ([[submitDictionary objectForKey:@"msg"]isEqualToString:@"Login Successfully"])
                            
                            NSString *status=@"successfully logged in";
                            if([status isEqualToString:@"successfully logged in"])
                            {
                                [[[UIAlertView alloc]initWithTitle:@"successfully logged in"message:nil delegate:self cancelButtonTitle:@"Ok"otherButtonTitles: nil,nil]show];
                                
                                //      segue of the  main viewcontroller load here
                            }
                            else
                            {
                                [[[UIAlertView alloc]initWithTitle:@"not succesfuly logged in"message:[submitDictionary objectForKey:@"msg"] delegate:self cancelButtonTitle:@"Cancel"otherButtonTitles: nil,nil]show];
                            }
                            
                        }else
                        {
                           NSLog(@"no dataaaa.... ");                        }
                    }
                }
                
            }
        }
    
    }

}
//alert message will shown here

- (void)alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}





- (IBAction)forgetPassword:(id)sender
{
    
   UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Enter your email address in order to retrieve a reset link " message:@"" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"Send link",nil];
    
    alert.alertViewStyle= UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        
        UITextField *textField = [alertView textFieldAtIndex:0];
        [textField setPlaceholder:@"Email.."];
        NSString *title = textField.text;
        
        /*
         *regex checking of the email id   !
         */
        NSString *emailReg = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailReg];
        
        if (([emailTest evaluateWithObject:textField.text] != YES) || [textField.text isEqualToString:@""])
        {
            
            
            
            UIAlertView *loginalert = [[UIAlertView alloc] initWithTitle:@" Enter Email in" message:@"abc@example.com format" delegate:self
                                                       cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [loginalert show];
        }
        
        else
        {
            /*
             * code for store the email address  into the json admin tb
             */
            
            NSLog(@"email id is %@",title);
            UIAlertView *myAlertView =[[UIAlertView alloc]initWithTitle:@"rest link will sent to your email" message:@"" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil,nil];
            [myAlertView show];
        }
    }
    else
    {
        
    }
}


-(void)textFieldDesign
{
    NSAttributedString *emailString = [[NSAttributedString alloc] initWithString:@"email address" attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:0 green:201 blue:231 alpha:1.0]}];
    
    _emailText.attributedPlaceholder =emailString;
    
    NSAttributedString *passwordString = [[NSAttributedString alloc] initWithString:@"password" attributes:@{ NSForegroundColorAttributeName : [UIColor colorWithRed:0 green:201 blue:231 alpha:1.0] }];
    
    _passwordText.attributedPlaceholder=passwordString;
    
    _emailText.layer.borderColor=[[UIColor cyanColor]CGColor];
    _emailText.layer.borderWidth=1.0;
    _emailText.layer.cornerRadius = 6;
    _emailText.clipsToBounds = YES;
    _passwordText.layer.borderColor=[[UIColor cyanColor]CGColor];
    _passwordText.layer.borderWidth=1.0;
    _passwordText.layer.cornerRadius = 6;
    _passwordText.clipsToBounds = YES;
    [_SignupOrLoginBtn.layer setBorderColor:[[UIColor cyanColor] CGColor]];
    _SignupOrLoginBtn.layer.cornerRadius = 6;
    [[_SignupOrLoginBtn layer]setBorderWidth:2.0f];
    
}




@end
