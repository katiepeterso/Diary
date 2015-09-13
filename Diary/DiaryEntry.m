//
//  DiaryEntry.m
//  
//
//  Created by Katherine Peterson on 2015-09-12.
//
//

#import "DiaryEntry.h"

typedef NS_ENUM(NSUInteger, DiaryEntryMood) {
    DiaryEntryMoodGood = 0,
    DiaryEntryMoodAverage = 1,
    DiaryEntryMoodBad = 2,
};


@implementation DiaryEntry

@dynamic date;
@dynamic body;
@dynamic image;
@dynamic mood;
@dynamic location;

-(NSString *)sectionName {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.date];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"MMM yyyy"];
    
    return [dateFormatter stringFromDate:date];
}

@end
