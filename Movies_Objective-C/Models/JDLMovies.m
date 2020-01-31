//
//  JDLMovies.m
//  Movies_Objective-C
//
//  Created by Jacob LeCheminant on 1/31/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

#import "JDLMovies.h"

// API Key: ee93122722e7f6d50cfa91731bfcf3bd

static NSString * const kTitle = @"title";
static NSString * const kRating = @"vote_average";
static NSString * const kOverview = @"overview";

@implementation JDLMovies

- (instancetype)initWithTitle:(NSString *)title rating:(NSString *)rating overview:(NSString *)overview
{
    if (self = [super init])
    {
        _title = title;
        _rating = rating;
        _overview = overview;
    }
    return self;
}

@end

@implementation JDLMovies (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * title = dictionary[kTitle];
    NSString * rating = dictionary[kRating];
    NSString * overview = dictionary[kOverview];
    
    return [self initWithTitle:title rating:rating overview:overview];
}

@end
