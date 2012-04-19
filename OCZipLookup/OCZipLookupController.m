//
//  OCZipLookupController.m
//  OCZipLookup
//
//  Created by Oliver Rickard on 4/18/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "OCZipLookupController.h"

@implementation OCZipLookupController

+(NSDictionary *)lookupZipCode:(int)zip {
    sqlite3 *zipDB;
    
    NSDictionary *retDict = nil;
    
    NSString *pathToDB = [[NSBundle mainBundle] pathForResource:@"zip.sqlite" ofType:nil];
    
    NSLog(@"pathToDB:%@", pathToDB);
    
    if([[NSFileManager defaultManager] fileExistsAtPath:pathToDB]) {
        //DB Exists
        
        const char *dbPath = [pathToDB UTF8String];
        
        sqlite3_stmt *statement;
        
        if(sqlite3_open(dbPath, &zipDB) == SQLITE_OK) {
            NSString *selectQueryString = [NSString stringWithFormat:@"SELECT state_abbreviation, latitude, longitude, city, state FROM zip_codes WHERE zip_code=\"%d\"", zip];
            
            const char *query_stmt = [selectQueryString UTF8String];
            
            if(sqlite3_prepare_v2(zipDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
                
                if(sqlite3_step(statement) == SQLITE_ROW) {
                    NSString *state_abbreviation = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(statement, 0)];
                    
                    NSString *latitude = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                    
                    NSString *longitude = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
                    
                    NSString *city = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(statement, 3)];
                    
                    NSString *state = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(statement, 4)];
                    
                    retDict = [NSDictionary dictionaryWithObjectsAndKeys:state_abbreviation, @"state_abbreviation", latitude, @"latitude", longitude, @"longitude", city, @"city", state, @"state", nil];
                } else {
                    NSLog(@"OCZipLookup Error: No results");
                }
                
            } else {
                NSLog(@"OCZipLookup Error: Error processing zip code");
            }
        } else {
            NSLog(@"OCZipLookupError: Cannot open DB");
        }
    } else {
        NSLog(@"OCZipLookupError: DB does not exist");
    }
    
    return retDict;
}



@end
