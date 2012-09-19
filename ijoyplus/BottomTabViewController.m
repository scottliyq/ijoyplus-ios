//
//  PathViewController.m
//  RaisedCenterTabBar
//
//  Created by Peter Boctor on 12/15/10.
//
// Copyright (c) 2011 Peter Boctor
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE
//

#import "BottomTabViewController.h"
#import "UIImageView+WebCache.h"
#import "FriendTabViewController.h"
#import "HomeViewController.h"
#import "MyselfViewController.h"
#import "PopularSegmentViewController.h"
#import "SearchFilmViewController.h"
#import "SettingsViewController.h"
#import "TestViewController.h"
@interface BottomTabViewController (){
    PopularSegmentViewController *detailController1;
    FriendTabViewController *detailController2;
    TestViewController *detailController3;
    MyselfViewController *detailController4;
}
- (void)initTabControllers;
- (void)search;
- (void)settings;
- (UINavigationController*) addNavigation:(UIViewController*) rootViewController;
@end

@implementation BottomTabViewController
@synthesize bottomToolbar;

- (void)viewDidUnload {
    [super viewDidUnload];
    detailController1 = nil;
    detailController2 = nil;
    detailController3 = nil;
    detailController4 = nil;
}

- (id)init {
    if ((self = [super init])) {
    }
    self.delegate = self;
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if(appDelegate.userLoggedIn){
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"search", nil) style:UIBarButtonSystemItemSearch target:self action:@selector(search)];
        self.navigationItem.rightBarButtonItem = rightButton;
        self.title = NSLocalizedString(@"popular", nil);
    } else {
        self.title = NSLocalizedString(@"app_name", nil);
        [self.tabBar setHidden:YES];
        [self addToolBar];
    }
    self.delegate = self;
    [self initTabControllers];
    self.viewControllers = [NSArray arrayWithObjects: detailController1, detailController2, detailController3,detailController4, nil];
    [self setSelectedIndex:0];
    
}

- (void)initTabControllers
{
    detailController1 = [[PopularSegmentViewController alloc] initWithNibName:@"PopularSegmentViewController" bundle:nil];
    detailController1.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"popular", nil)  image:[UIImage imageNamed:@"pop_tab"] tag:0];
    
    detailController2 = [[FriendTabViewController alloc] init];
    detailController2.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"friend", nil) image:[UIImage imageNamed:@"rec_tab"] tag:0];
    detailController3 = [[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
    detailController3.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"list", nil) image:[UIImage imageNamed:@"list_tab"] tag:0];
    
    detailController4 = [[MyselfViewController alloc]initWithNibName:@"MyselfViewController" bundle:nil];
    detailController4.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"myself", nil) image:[UIImage imageNamed:@"my_tab"] tag:0];
}

-(UINavigationController*) addNavigation:(UIViewController*) rootViewController
{
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    rootViewController.navigationItem.titleView = [UIUtility customizeAppTitle];
    return navController;
}

#pragma mark - Tab bar delegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if([viewController isKindOfClass:[PopularSegmentViewController class]]){
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        if(appDelegate.userLoggedIn){
            UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"search", nil) style:UIBarButtonSystemItemSearch target:self action:@selector(search)];
            self.navigationItem.rightBarButtonItem = rightButton;
            self.title = NSLocalizedString(@"popular", nil);
        }
    } else if ([viewController isKindOfClass: [MyselfViewController class]]){
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"settings", nil) style:UIBarButtonSystemItemAction target:self action:@selector(settings)];
        self.navigationItem.rightBarButtonItem = rightButton;
        self.title = NSLocalizedString(@"myself", nil);
    }
    return YES;
}

- (void)search
{
    SearchFilmViewController *viewController = [[SearchFilmViewController alloc]initWithNibName:@"SearchFilmViewController" bundle:nil];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:viewController];
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate.window.rootViewController presentModalViewController:navController animated:YES];
}

- (void)settings
{
    SettingsViewController *viewController = [[SettingsViewController alloc]initWithNibName:@"SettingsViewController" bundle:nil];
//    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:viewController];
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UINavigationController *navController = (UINavigationController *)appDelegate.window.rootViewController;
//    [appDelegate.window.rootViewController presentModalViewController:navController animated:YES];
    [navController pushViewController:viewController animated:YES];
    
}

- (void)addToolBar
{
    self.bottomToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height - TAB_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT - SEGMENT_HEIGHT, self.view.frame.size.width, TAB_BAR_HEIGHT)];
//    [UIUtility customizeToolbar:self.bottomToolbar];
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [registerBtn setFrame:CGRectMake(MOVIE_LOGO_WIDTH_GAP, 5, self.view.frame.size.width/2-12, TAB_BAR_HEIGHT-10)];
    [registerBtn setTitle:NSLocalizedString(@"register", nil) forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [UIUtility addTextShadow:registerBtn.titleLabel];
    registerBtn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [registerBtn setBackgroundImage:[[UIImage imageNamed:@"reg_btn_normal"]stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [registerBtn setBackgroundImage:[[UIImage imageNamed:@"reg_btn_active"]stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0] forState:UIControlStateHighlighted];
    [registerBtn addTarget:self action:@selector(registerScreen)forControlEvents:UIControlEventTouchUpInside];
    [self.bottomToolbar addSubview:registerBtn];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loginBtn setFrame:CGRectMake(self.view.frame.size.width/2 + MOVIE_LOGO_WIDTH_GAP/2, 5, self.view.frame.size.width/2 - 12, TAB_BAR_HEIGHT-10)];
    [loginBtn setTitle:NSLocalizedString(@"login", nil) forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [UIUtility addTextShadow:loginBtn.titleLabel];
    loginBtn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [loginBtn setBackgroundImage:[[UIImage imageNamed:@"log_btn_normal"]stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[[UIImage imageNamed:@"log_btn_active"]stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0] forState:UIControlStateHighlighted];
    [loginBtn addTarget:self action:@selector(loginScreen)forControlEvents:UIControlEventTouchUpInside];
    [self.bottomToolbar addSubview:loginBtn];
    self.bottomToolbar.layer.zPosition = 1;
    [self.bottomToolbar addSubview:loginBtn];
    
    [self.view addSubview:self.bottomToolbar];
}

@end
