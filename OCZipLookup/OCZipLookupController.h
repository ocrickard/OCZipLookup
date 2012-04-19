//
//  OCZipLookupController.h
//  OCZipLookup
//
//  Created by Oliver Rickard on 4/18/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "/usr/include/sqlite3.h"

@interface OCZipLookupController : NSObject {
    
}

+(NSDictionary *)lookupZipCode:(int)zip;

@end
