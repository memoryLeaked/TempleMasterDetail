//
//  ViewController.m
//  TempleMasterDetail
//
//  Created by prasert on 8/10/13.
//  Copyright (c) 2013 prasert kanawattanachai. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
@interface ViewController ()
@property NSArray *contents;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    self.title = @"ไหว้พระ 9 วัด";
	[self prepareContents];
}

- (void)prepareContents {
	NSString *path = [[NSBundle mainBundle] pathForResource:@"temples" ofType:@"plist"];
	_contents = [[NSArray alloc]initWithContentsOfFile:path];
}

// Step 1. #import "DetailViewController.h"
// Step 2. สร้าง segue เชื่อมไปยัง DetailViewController, ตั้งชื่อ segue Identifier to @"showDetail"
// Step 3. สร้าง property detailItem ใน DetailViewController สำหรับรับค่าจาก Master View
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	// name segue Identifier to @"showDetail"
	if ([segue.identifier isEqualToString:@"showDetail"]) {
		NSIndexPath *indexPath = [_tableView indexPathForSelectedRow]; // index path ของ table cell ที่ถูกเลือก
		NSDictionary *watInfo = _contents[indexPath.row]; // contents ของแถวที่ถูกเลือก
		[segue.destinationViewController setDetailItem:watInfo];
	}
}

#pragma mark - TableView data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// Return the number of rows in the section.
    //section is currently 1. There's no section yet.
    //there are currently 9 rows in this section
	return _contents.count;
}


//this methods pass in tableView itself and indexPath is just the current section and current row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //CellIndentifier is used to distinguish the cell you could have two differetny types of cell like the number cell or string cell
	static NSString *CellIdentifier = @"Cell";
    //making a cell at section 0 and row 0 and this cell is identified as "Cell"
    //declaring this cell object
    //reusuable cell has identifier because if you have two different type of cells maybe one with one line of text and the other with two lines of texts, you could alternate.
    //we are asking the tableView do you already have a cell with the identifer "Cell" that we can use and modify it and give it back to u to draw the next row?
    //first time it will return new because there has never been one cell with this identifier
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
	// Configure the cell...
    //if cell is nil, then create one with default style and
    //create instance, going to create tableView cell with identifier Cell so later on we can reuse it
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	cell.textLabel.text = _contents[indexPath.row][@"WatTh"];
	cell.detailTextLabel.text = _contents[indexPath.row][@"Belief"];
	return cell;
}

@end
