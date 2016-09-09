//
//  base64.h
//  爱阅读
//
//  Created by liuk on 16/3/11.
//  Copyright © 2016年 conpgy. All rights reserved.
//

#import <Foundation/Foundation.h>

//base64.h

extern size_t EstimateBas64EncodedDataSize(size_t inDataSize);
extern size_t EstimateBas64DecodedDataSize(size_t inDataSize);

extern bool Base64EncodeData(const void *inInputData, size_t inInputDataSize, char *outOutputData, size_t *ioOutputDataSize, BOOL wrapped);
extern bool Base64DecodeData(const void *inInputData, size_t inInputDataSize, void *ioOutputData, size_t *ioOutputDataSize);
