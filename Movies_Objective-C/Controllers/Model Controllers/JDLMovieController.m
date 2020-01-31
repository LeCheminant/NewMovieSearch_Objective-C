//
//  JDLMovieController.m
//  Movies_Objective-C
//
//  Created by Jacob LeCheminant on 1/31/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

#import "JDLMovieController.h"

static NSString * const kBaseURLString = @"https://api.themoviedb.org/3/search/";
static NSString * const kMovieString = @"movie";
static NSString * const kAPIKeyKey = @"api_key";
static NSString * const KAPIKeyValue = @"ee93122722e7f6d50cfa91731bfcf3bd";

@implementation JDLMovieController

+(void)fetchMovies:(void (^)(NSArray<JDLMovies *> * _Nonnull))completion
{
    NSURL * baseURL = [NSURL URLWithString:kBaseURLString];
    NSURL * movieURL = [baseURL URLByAppendingPathComponent:kMovieString];
    NSURLQueryItem * APIKey = [[NSURLQueryItem alloc] initWithName:kAPIKeyKey value:KAPIKeyValue];
    
    NSURLComponents * components = [[NSURLComponents alloc] initWithURL:movieURL resolvingAgainstBaseURL:true];
    
    components.queryItems = @[APIKey];
    
    NSURL * finalURL = components.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSDictionary * TopLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            if(!TopLevelDictionary)
            {
                NSLog(@"Error parsing JSON %@", error);
                completion(nil);
                return;
            }
            
            NSMutableArray * movieArray = [[NSMutableArray alloc] init];
            for (NSDictionary * movieDictionary in TopLevelDictionary)
            {
                JDLMovies * movie = [[JDLMovies alloc] initWithDictionary:movieDictionary];
                [movieArray addObject:movie];
            }
            completion(movieArray);
        }
    }] resume];
    
}

@end
