// 方法嵌套

import Foundation

// 案例：网络请求中，将参赛编码到 url 中，输入参数可能包含单个的值、字典或者是数组
/**
func appendQuery(url: String, key: String, value: AnyObject) -> String {
    if let dictionary = value as? [String: AnyObject] {
            return appendQueryDictionary(url, key, dictionary)
        } else if let array = value as? [AnyObject] {
            return appendQueryArray(url, key, array)
        } else {
            return appendQuerySingle(url, key, value)
        }
    }
}

func appendQueryDictionary(url: String,
                           key: String,
                         value: [String: AnyObject]) -> String {
    //...
    return result
}

func appendQueryArray(url: String,
                      key: String,
                    value: [AnyObject]) -> String {
    //...
    return result
}

func appendQuerySingle(url: String,
                       key: String, value: AnyObject) -> String {
    //...
    return result
}
 */

// 将后面三个方法放到 appendQuery
/**
func appendQuery(url: String,
                 key: String,
               value: AnyObject) -> String {

    func appendQueryDictionary(url: String,
                               key: String,
                             value: [String: AnyObject]) -> String {
        //...
        return result
    }
    
    func appendQueryArray(url: String,
                              key: String,
                            value: [AnyObject]) -> String {
        //...
        return result
    }

    func appendQuerySingle(url: String,
                           key: String,
                         value: AnyObject) -> String {
        //...
        return result
    }

    if let dictionary = value as? [String: AnyObject] {
        return appendQueryDictionary(url, key, dictionary)
    } else if let array = value as? [AnyObject] {
        return appendQueryArray(url, key, array)
    } else {
       return appendQuerySingle(url, key, value)
    }
}
*/
