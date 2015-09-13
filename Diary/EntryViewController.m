//
//  NewEntryVCViewController.m
//  Diary
//
//  Created by Katherine Peterson on 2015-09-13.
//  Copyright (c) 2015 KatieExpatriated. All rights reserved.
//

#import "EntryViewController.h"
#import "DiaryEntry.h"
#import "CoreDataStack.h"

@interface EntryViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textField;

@end

@implementation EntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.entry != nil) {
        self.textField.text = self.entry.body;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelWasPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)updateDiaryEntry {
    self.entry = self.textField.text;
    
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    [coreDataStack saveContext];
}

- (IBAction)doneWasPressed:(id)sender {
    if (self.entry != nil) {
        [self updateDiaryEntry];
    }
    else {
        [self insertDiaryEntry];
    }
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)insertDiaryEntry {
    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
    DiaryEntry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"DiaryEntry" inManagedObjectContext:coreDataStack.managedObjectContext];
    entry.body = self.textField.text;
    entry.date = [[NSDate date] timeIntervalSince1970];
    [coreDataStack saveContext];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
