//
//  DetailViewController.h
//  TempleMasterDetail
//
//  Created by prasert on 8/10/13.
//  Copyright (c) 2013 prasert kanawattanachai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property NSDictionary *detailItem;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
