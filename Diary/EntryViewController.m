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
@property (assign, nonatomic) enum DiaryEntryMood pickedMood;
@property (weak, nonatomic) IBOutlet UIButton *badButton;
@property (weak, nonatomic) IBOutlet UIButton *averageButton;
@property (weak, nonatomic) IBOutlet UIButton *goodButton;
@property (strong, nonatomic) IBOutlet UIView *accessoryView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation EntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDate *date;
    
    if (self.entry != nil) {
        self.textField.text = self.entry.body;
        self.pickedMood = self.entry.mood;
        date = [NSDate dateWithTimeIntervalSince1970:self.entry.date];
    }
    else {
        self.pickedMood = DiaryEntryMoodGood;
        date = [NSDate date];
    }
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"EEEE MMMM d, yyyy"];
    self.dateLabel.text = [dateFormatter stringFromDate:date];
    
    self.textField.inputAccessoryView = self.accessoryView;
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

-(void)setPickedMood:(enum DiaryEntryMood)pickedMood {
    self.pickedMood = pickedMood;
    
    self.badButton.alpha = 0.5f;
    self.averageButton.alpha = 0.5f;
    self.goodButton.alpha = 0.5f;
    
    switch (pickedMood) {
        case DiaryEntryMoodGood:
            self.goodButton.alpha = 1.0f;
            break;
        case DiaryEntryMoodAverage:
            self.averageButton.alpha = 1.0f;
            break;
        case DiaryEntryMoodBad:
            self.badButton.alpha = 1.0f;
            break;
    }
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

- (IBAction)badWasPressed:(id)sender {
    self.pickedMood = DiaryEntryMoodBad;
}

- (IBAction)averageWasPressed:(id)sender {
    self.pickedMood = DiaryEntryMoodAverage;
}

- (IBAction)goodWasPressed:(id)sender {
    self.pickedMood = DiaryEntryMoodGood;
}

@end
