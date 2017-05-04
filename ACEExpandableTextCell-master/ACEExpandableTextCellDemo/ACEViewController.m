//
//  ACEViewController.m
//  ACEExpandableTextCellDemo
//
//  Created by Stefano Acerbetti on 6/5/13.
//  Copyright (c) 2013 Stefano Acerbetti. All rights reserved.
//

#import "ACEViewController.h"
#import "ACEExpandableTextCell.h"
#import "ProfileTableViewCell.h"
#import "ACETableViewCell.h"

@interface ACEViewController ()<ACEExpandableTableViewDelegate> {
    CGFloat _cellHeight[2];
}

@property (nonatomic, strong) NSMutableArray *cellData;

@end

@implementation ACEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cellData = [NSMutableArray arrayWithArray:@[ @"Existing text", @""]];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        static  NSString  *CellIdentiferId = @"MomentsViewControllerCellID";
        ACETableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentiferId];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"ACETableViewCell" owner:nil options:nil] firstObject];
        }
        return cell;
    } else {
        
        ACEExpandableTextCell *cell = [tableView expandableTextCellWithId:@"cellId"];
        cell.text = [self.cellData objectAtIndex:indexPath.section];
        cell.textView.placeholder = @"Placeholder";
        return cell;
    }
}


#pragma mark - Table View Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return indexPath.section == 2 ? 80 : MAX(50.0, _cellHeight[indexPath.section]);
}

- (void)tableView:(UITableView *)tableView updatedHeight:(CGFloat)height atIndexPath:(NSIndexPath *)indexPath
{
    _cellHeight[indexPath.section] = height;
}

- (void)tableView:(UITableView *)tableView updatedText:(NSString *)text atIndexPath:(NSIndexPath *)indexPath
{
    [_cellData replaceObjectAtIndex:indexPath.section withObject:text];
}

@end
