//
//  DeviceViewController.m
//  DeviceList
//
//  Created by DX182-XL on 2013-11-17.
//  Copyright (c) 2013 DX182-XL. All rights reserved.
//

#import "DeviceViewController.h"
#import "AppDelegate.h"

@interface DeviceViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *operatingSystemTextField;
@property (weak, nonatomic) IBOutlet UITextField *versionTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@property (nonatomic) UIActivityIndicatorView *indicatorView;

@end

@implementation DeviceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.device) {
        [self.nameTextField setText:self.device.name];
        [self.operatingSystemTextField setText:self.device.operatingSystem];
        [self.versionTextField setText:self.device.version];
    }
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = [(AppDelegate *)UIApplication.sharedApplication.delegate managedObjectContext];
    return context;
}


- (IBAction)saveButtonClicked:(id)sender {
    if (!self.device) {
        self.device = [Device insertInManagedObjectContext:self.managedObjectContext];
    }
    [self populateDeviceObject];
    [self.managedObjectContext performBlock:^{
        [self.managedObjectContext save:nil];
    }];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)populateDeviceObject {
    self.device.name = self.nameTextField.text;
    self.device.operatingSystem = self.operatingSystemTextField.text;
    self.device.version = self.versionTextField.text;
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:self.indicatorView];
}

@end
