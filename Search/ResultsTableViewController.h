//
//  ResultsTableViewController.h
//  Search
//
//  Created by admin on 22.03.2021.
//

#import <UIKit/UIKit.h>

@interface ResultsTableViewController : UITableViewController

@property (nonatomic, copy) NSArray *results;

- (void)update;

@end
