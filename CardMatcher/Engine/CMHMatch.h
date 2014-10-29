//
//  CMHMatch.h
//  CardMatcher
//
//  Created by Gilad Goldberg on 10/1/14.
//  Copyright (c) 2014 IIC. All rights reserved.
//

#ifndef __CardMatcher__CMHMatch__
#define __CardMatcher__CMHMatch__

class CMHMatch
{
private:
  cv::SIFT mSift;
  
public:
  CMHMatch();
  static void loadImagesDescriptors();
};

#endif /* defined(__CardMatcher__CMHMatch__) */
