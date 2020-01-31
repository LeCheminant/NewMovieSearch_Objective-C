//
//  JDLMovies.h
//  Movies_Objective-C
//
//  Created by Jacob LeCheminant on 1/31/20.
//  Copyright © 2020 Jacob LeCheminant. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JDLMovies : NSObject

@property(nonatomic, copy, readonly)NSString * title;
@property(nonatomic, copy, readonly)NSString * rating;
@property(nonatomic, copy, readonly)NSString * overview;

-(instancetype)initWithTitle:(NSString *)title
                      rating:(NSString *)rating
                    overview:(NSString *)overview;

@end

@interface JDLMovies (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
