//
//  DevicesViewController.m
//  DeviceList
//
//  Created by DX182-XL on 2013-11-17.
//  Copyright (c) 2013 DX182-XL. All rights reserved.
//

#import "DevicesViewController.h"
#import "DeviceViewController.h"
#import "DeviceListClient.h"
#import "AppDelegate.h"
#import "Device.h"

@interface DevicesViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation DevicesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSManagedObjectContext *context = [(AppDelegate *)UIApplication.sharedApplication.delegate managedObjectContext];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:self.fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    self.fetchedResultsController.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [self.fetchedResultsController performFetch:nil];
    [self.tableView reloadData];
}

- (NSFetchRequest *)fetchRequest {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:Device.entityName];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:DeviceAttributes.deviceID ascending:NO]];
    return fetchRequest;
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = [(AppDelegate *)UIApplication.sharedApplication.delegate managedObjectContext];
    return context;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fetchedResultsController.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeviceCell"];
    Device *device = [self.fetchedResultsController objectAtIndexPath:indexPath];
    UILabel *nameLabel = [cell viewWithTag:1];
    [nameLabel setText:device.name];
    
    UILabel *osLabel = [cell viewWithTag:2];
    [osLabel setText:device.operatingSystem];
    
    UILabel *versionLabel = [cell viewWithTag:3];
    [versionLabel setText:device.version];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObject *managedObject = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [self.managedObjectContext performBlock:^{
            [self.managedObjectContext delete:managedObject];
            [self.managedObjectContext save:nil];
        }];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue destinationViewController] isKindOfClass:[DeviceViewController class]] &&
        [sender isKindOfClass:[UITableViewCell class]])
    {
        DeviceViewController *vc = [segue destinationViewController];
        UITableViewCell *cell = sender;
        vc.device = self.fetchedResultsController.fetchedObjects[[self.tableView indexPathForCell:cell].row];
    }
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView reloadData];
}

@end
