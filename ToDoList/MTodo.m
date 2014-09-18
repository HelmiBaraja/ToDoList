//
//  MTodo.m
//  ToDoList
//
//  Created by Helmi Hasan on 9/18/14.
//  Copyright (c) 2014 Terato Tech. All rights reserved.
//

#import "MTodo.h"

@implementation MTodo

- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.desc forKey:@"desc"];
    [encoder encodeObject:self.date forKey:@"date"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.name = [decoder decodeObjectForKey:@"name"];
        self.desc = [decoder decodeObjectForKey:@"desc"];
        self.date = [decoder decodeObjectForKey:@"date"];
    }
    return self;
}
@end
