//
//  EntryCell.h
//  Diary
//
//  Created by Katherine Peterson on 2015-09-13.
//  Copyright (c) 2015 KatieExpatriated. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DiaryEntry;

@interface EntryCell : UITableViewCell

+(CGFloat) heightForEntry:(DiaryEntry *)entry;

-(void) configureCellForEntry:(DiaryEntry *)entry;

@end
