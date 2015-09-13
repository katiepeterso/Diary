//
//  DiaryEntry.h
//  
//
//  Created by Katherine Peterson on 2015-09-12.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DiaryEntry : NSManagedObject

@property (nonatomic) NSTimeInterval date;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSData * image;
@property (nonatomic) int16_t mood;
@property (nonatomic, retain) NSString * location;


typedef NS_ENUM(NSUInteger, DiaryEntryMood) {
    DiaryEntryMoodGood = 0,
    DiaryEntryMoodAverage = 1,
    DiaryEntryMoodBad = 2,
};


@property (nonatomic, readonly) NSString *sectionName;

@end
