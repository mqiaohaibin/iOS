//
//  PlayingCard.h
//  CardGame
//
//  Created by qiaohaibin on 05/02/2017.
//  Copyright © 2017 qiaohaibin. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
