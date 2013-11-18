//
//  DevicesViewController.m
//  DeviceList
//
//  Created by DX182-XL on 2013-11-17.
//  Copyright (c) 2013 DX182-XL. All rights reserved.
//

#import "DevicesViewController.h"
#import "DeviceListClient.h"
#import "AppDelegate.h"
#import "Device.h"

@interface DevicesViewController ()

@property (nonatomic) NSArray *devices;

@end

@implementation DevicesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.devices = [NSArray new];
    
    [self fetchDevices];
    if (self.devices.count > 0) {
        [self.tableView reloadData];
        
    } else {
        [Device deviceListWithBlock:^(NSError *error) {
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Request Failed"
                          message:@"Request Failed"
                         delegate:nil
                cancelButtonTitle:@"OK"
                otherButtonTitles:nil];
                [alertView show];
            } else {
                [self fetchDevices];
                [self.tableView reloadData];
            }
        }];
    }
}

- (void)fetchDevices {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:Device.entityName];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:DeviceAttributes.deviceID ascending:NO]];
    NSManagedObjectContext *context = [(AppDelegate *)UIApplication.sharedApplication.delegate managedObjectContext];
    [context performBlockAndWait:^{
        self.devices = [context executeFetchRequest:fetchRequest error:nil];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.devices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeviceCell"];
    Device *device = self.devices[indexPath.row];
    UILabel *nameLabel = [cell viewWithTag:1];
    [nameLabel setText:device.name];
    
    UILabel *osLabel = [cell viewWithTag:2];
    [osLabel setText:device.operatingSystem];
    
    UILabel *versionLabel = [cell viewWithTag:3];
    [versionLabel setText:device.version];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [Device deleteDevice:self.devices[indexPath.row]
                   withBlock:^(NSError *error) {
            if (!error) {
                [self fetchDevices];
                [tableView deleteRowsAtIndexPaths:@[indexPath]
                                 withRowAnimation:UITableViewRowAnimationFade];
            }
        }];
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
