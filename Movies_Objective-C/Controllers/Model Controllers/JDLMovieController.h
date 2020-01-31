//
//  JDLMovieController.h
//  Movies_Objective-C
//
//  Created by Jacob LeCheminant on 1/31/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDLMovies.h"

NS_ASSUME_NONNULL_BEGIN

@interface JDLMovieController : NSObject

+(instancetype)sharedInstance;

+(void)fetchMovies: (void(^)(NSArray<JDLMovies * > * movie))completion;

@end

NS_ASSUME_NONNULL_END
