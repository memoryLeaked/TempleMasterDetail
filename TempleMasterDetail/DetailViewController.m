//
//  DetailViewController.m
//  TempleMasterDetail
//
//  Created by prasert on 8/10/13.
//  Copyright (c) 2013 prasert kanawattanachai. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self configureView];
}

- (void)setDetailItem:(id)newDetailItem {
	if (_detailItem != newDetailItem) {
		_detailItem = newDetailItem;
		// Update the view.
		[self configureView];
	}
}

- (void)configureView {
	// Update the user interface for the detail item.
	if (self.detailItem) {
		self.title = [NSString stringWithFormat:@"%@", _detailItem[@"WatTh"]];
		self.detailDescriptionLabel.text = _detailItem[@"WatEn"];
	}
    
    // https://maps.google.com/?q=13.75117,100.492577
    NSString *urlString = [NSString stringWithFormat:@"https://maps.google.com/?q=%@,%@", _detailItem[@"Lat"], _detailItem[@"Long"]];
	NSURL *url = [[NSURL alloc] initWithString:urlString];
	NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
	[_webView loadRequest:urlRequest];
}
@end
