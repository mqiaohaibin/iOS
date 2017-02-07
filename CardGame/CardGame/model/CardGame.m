//
//  CardGame.m
//  CardGame
//
//  Created by qiaohaibin on 06/02/2017.
//  Copyright © 2017 qiaohaibin. All rights reserved.
//

#import "CardGame.h"

#define kMisMatchPenalty    2
#define kMatchBonus         4
#define kCostToChoose       1

@interface CardGame ()
@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation CardGame

- (NSMutableArray *)cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck{
    self = [super init];
    
    if(self){
        for (int i = 0; i < cardCount; i++) {
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return index < self.cards.count ? self.cards[index] : nil;
}

- (void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = false;
        } else {
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    NSInteger score = [card match:@[otherCard]];
                    if(score){
                        self.score += score * kMatchBonus;
                        card.matched = true;
                        otherCard.matched = true;
                    } else {
                        self.score -= kMisMatchPenalty;
                        otherCard.chosen = false;
                    }
                    break;
                }
            }
            self.score -= kCostToChoose;
            card.chosen = true;
        }
    }
}

@end
