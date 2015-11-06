//
//  ViewController.m
//  HidenNavBarDemo
//
//  Created by Zin_戦 on 15/11/6.
//  Copyright © 2015年 zhan神. All rights reserved.
//

#import "ViewController.h"
#import "ZinCoordinator.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) ZinCoordinator *scrollCoordinator;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIColor *blueColour = [UIColor colorWithRed:91/255.0 green:129/255.0 blue:255/255.0 alpha:1.0];
    
//    self.navigationController.toolbarHidden = NO;
    self.navigationController.navigationBar.barTintColor = blueColour;
    self.navigationController.toolbar.barTintColor = blueColour;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.scrollCoordinator = [[ZinCoordinator alloc] init];
    self.scrollCoordinator.scrollView = self.tableView;
    self.scrollCoordinator.topView = self.navigationController.navigationBar;
    self.scrollCoordinator.topViewMinimisedHeight = 20.0f;
//    self.scrollCoordinator.bottomView = self.navigationController.toolbar;
    
    self.navigationItem.title = @"M了个zin";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.scrollCoordinator disable];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.scrollCoordinator enable];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"发现测试数据----%ld", (long)indexPath.row];
    return cell;
}

@end
