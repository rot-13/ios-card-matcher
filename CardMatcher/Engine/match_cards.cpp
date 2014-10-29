//
//  match_cards.cpp
//  CardMatcher
//
//  Created by Itay Adler on 29/10/2014.
//  Copyright (c) 2014 IIC. All rights reserved.
//

#include "match_cards.h"

#include <opencv2/opencv.hpp>
#include <vector>

struct CardDescriptor {
  CvString& name;
  cv::Mat descriptor;
};

void load_clusters_template_descriptors(cv::vector<CardDescriptor> &descriptors) {

}