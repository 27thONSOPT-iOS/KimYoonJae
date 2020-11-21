//
//  NetworkResult.swift
//  SOPT_SEM_WEEK6
//
//  Created by Yunjae Kim on 2020/11/21.
//

import Foundation


enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
    
    
    
}
