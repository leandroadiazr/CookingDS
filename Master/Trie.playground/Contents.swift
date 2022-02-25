

//
//func addBoldTag(_ s: String, _ dict: [String]) -> String {
//    //loop trough s
//    //find longest bold word end index for each index
//    //connect them
//    //get the result
//
//    var newS = Array(s)
//
//var result = [String]()
//
//    for var char in 0..<newS.count {
//       var bolded = getLongestBold(char)
////        if it is bolded check if connected bold exists in the dictionary
//        while bolded != -1 {
//            let next = getLongestBold(bolded + 1)
//            if next == -1 {
//                break
//            }
//            bolded = next
//        }
//
//        //
//        if bolded != -1 {
//            result.append("<b>" + String(newS[char]) + "</b>")
//            char = bolded
//        } else {
//            result.append(String(newS[char]))
//        }
//    }
//
//    func getLongestBold(_ index: Int) -> Int {
//        var end = index
//        var start = index
//        var isBolded = false
//
//        while start <= end {
//            for (idx, word) in dict.enumerated() {
//                if dict.contains(word) {
//                    isBolded = true
//                    end = max(end, start + dict.count - 1)
//                }
//
//            }
//            start += 1
//        }
//
//        if isBolded {
//            return end
//        } else {
//
//            return -1
//        }
//
//
//    }
//
//    return result.joined()
//}




//if no bold should return -1
//return last bold index




////ADD BOLD TAG TO STRING
//var sufix = "<b>"
//var prefix = "</b>"
//
////func addBoldTag(s: String, dict: [String]) -> String {
////    guard s.count > 0 else { return "" }
//////    var s = Array(s.lowercased())
////    var end = -1
////    var newString = [String]()
////
////    let trie = Trie()
////    for word in dict {
////        trie.insert(word: word)
////    }
////
////    for i in 0..<s.count {
////        if end >= i {
////            end = max(end, trie.search(s, i))
////        } else {
////            end = trie.search(s, i)
////            if end > i {
////                newString.append(prefix)
////            }
////        }
////        if end == i {
////            newString.append(sufix)
////            newString.append(s)
////        }
////    }
////    if end == s.count {
////        newString.append(sufix)
////    }
////    return newString.joined(separator: "")
////}
//
//
//
//
//
//
//class TrieNode<T: Hashable> {
//  var value: T?
//  weak var parent: TrieNode?
//  var children: [T: TrieNode] = [:]
//  var isTerminating = false
//
//  init(value: T? = nil, parent: TrieNode? = nil) {
//    self.value = value
//    self.parent = parent
//  }
//
//  func add(child: T) {
//    guard children[child] == nil else { return }
//    children[child] = TrieNode(value: child, parent: self)
//  }
//}
//
//class Trie {
//  typealias Node = TrieNode<Character>
//  fileprivate let root: Node
//
//  init() {
//    root = Node()
//  }
//}
//
//extension Trie {
//  func insert(word: String) {
//    guard !word.isEmpty else { return }
//
//    var currentNode = root
//
//    let characters = Array(word.lowercased())
//    var currentIndex = 0
//
//    while currentIndex < characters.count {
//      let character = characters[currentIndex]
//
//      if let child = currentNode.children[character] {
//        currentNode = child
//      } else {
//        currentNode.add(child: character)
//        currentNode = currentNode.children[character]!
//      }
//
//      currentIndex += 1
//
//
//      if currentIndex == characters.count {
//        currentNode.isTerminating = true
//      }
//    }
//  }
//
//  func contains(word: String) -> Bool {
//    guard !word.isEmpty else { return false }
//
//    var currentNode = root
//
//    let characters = Array(word.lowercased())
//    var currentIndex = 0
//
//    while currentIndex < characters.count, let child = currentNode.children[characters[currentIndex]] {
//      currentIndex += 1
//      currentNode = child
//    }
//
//    if currentIndex == characters.count && currentNode.isTerminating {
//      return true
//    } else {
//      return false
//    }
//  }
//
//   func search(_ string: String, _ index: Int) -> Int {
//       var node = root
//       var result = -1
//       var st = Array(string)
//
//       while node != nil && index < string.count {
//           node = node.parent.ad
//
//       }
//
//       return 0
//   }
//}
//
//let trie = Trie()
//
//trie.insert(word: "cute")
//trie.contains(word: "cute") // true
//
//trie.contains(word: "cut") // false
//trie.insert(word: "cut")
//trie.contains(word: "cut") // true
//
//
//
//
/// Adds bold tag in a string.
///
/// - Parameters:
///   - s: The string.
///   - dict: A list of strings.
/// - Returns: The string with a bold tags.
///
/// - Complexity:
///   - time: O(n * w), where n is the length of the `s`, and w is the sum of
///     all characters in the `dict`.
///   - space: O(n), where n is the length of the `s`.
func addBoldTag(_ s: String, _ dict: [String]) -> String {
    //MAKE SURE THE GIVEN STRING IS NOT EMPTY OR RETURN
//    CREATE AN Array FROM GIVEN STRING
//    CREATE A COUNTER FROM EVERY LETTER ON THAT NEW ARRAY AND ASIGN IT TO A NEW VAR
//    CREATE AN ARRAY OF BOOLS USING THE REPEATING FUNCTION WITH FALSE AND THE NEW VAR COUNT FROM ARRAY
    //FOR EVERY NUMBER IN THE COUNTER VAR  FROM 0 UP TO COUNTER
    //FOR EVERY WORD IN THE DICT
    //FOR EVERY ITEM IN NUMBERS UP TO THE COUNT OF NUMBERS PLUS THE WORD.COUNT
    //ISBOLDED AT INDEX ITEM = TRUE
    //    OUTSIDE OF THE LOOP----
    //    //CREATE AN RESULTS ARRAY OF EMPTY STRINGS
    //    FOR NEWITEM IN 0 UP TO COUNTER VAR
    //    IF ISBOLDED AT INDEX NEWITEM
    //    IF NEWITEM = 0 OR IS NOT BOLDED AT INDEX NEWITEM - 1
    //    APPEND THE OPENING TAG TO RESULTS ARRAY
    //
    //    ELSE
    //
    //    APPEND TO THE RESULTS THE STRING VERSION OF THE ARRAY AT INDEX NEW ITEM
    //    CHECK IF IS BOLDED AT INDEX NEWITEM
    //    CHECK IF NEWITEM = COUNTER VAR - 1 OR IF IS NOT BOLDED AT INDEX NEWITEM + 1
    //    THEN APPEND TO THE RESULTS VAR THE CLOSING TAG
    //    */
    guard !s.isEmpty else { return "" }
    let s = Array(s) // creating an array of chars from string s
    let n = s.count // asign to N the numbers of letters in s
    var isBold = [Bool](repeating: false, count: n) //creating an array repating false to the number of leters in n

    for letter in 0..<n {
        search: for word in dict { //creating a private typealeas for the inner loop checking every word in dict
            for (index, single) in word.enumerated() { //creating an index and pointer to every word in dict
                guard index + letter >= n || s[index + letter] != single else { continue } //check that k + or = to numbers of i
                continue search
            }
            for j in letter..<letter + word.count {
                isBold[j] = true
            }
        }
    }
    
    var ans = [String]()
    for i in 0..<n {
        if isBold[i], (i == 0 || !isBold[i-1]) {
            ans.append("<b>")
        }
        ans.append(String(s[i]))
        if isBold[i], (i == n-1 || !isBold[i + 1]) {
            ans.append("</b>")
        }
    }
    return ans.joined()
}


//addBoldTag("aaabbcc", ["aaa","aab","bc"])
//
//
////print(addBoldTag("abcxyz123", ["abc", "123"]))
//
////another solution
//
//func addExtraBoldTag(string: String, dict: [String]) {
//    /*
//     LOOP TROUGH STRING
//     FIND LONGET BOLD WORD END INDEX FOR EACH INDEX
//     CONNECTEM IF NEEDED
//     COLLECT RESULT
//
//     RETURN -1 IF NO BOLD
//     RETURN THE LAST BOLD INDEX IF FOUND
//
//     */
//    var st = Array(string.lowercased())
//    var result = [String]()
//
//    for (letter, word) in dict.enumerated() {
//        if word.contains(st[letter]) {
////            print(st[letter])
//            result.append(String("<b>\(st[letter])"))
//            for char in dict {
//                if !result.contains(dict[letter]) && dict[letter] == char {
//                    print(dict[letter])
//                    result.append(dict[letter] + "/<b>")
//                }
//            }
//        }
//        result.append(word)
//    }
//
//
//
//
//    print(result.joined())
//}
//
//addExtraBoldTag(string: "aaabbc", dict: ["abc", "yxz", "123"])

//instructions
//MAKE SURE THE GIVEN STRING IS NOT EMPTY OR RETURN
//    CREATE AN Array FROM GIVEN STRING
//    CREATE A COUNTER FROM EVERY LETTER ON THAT NEW ARRAY AND ASIGN IT TO A NEW VAR
//    CREATE AN ARRAY OF BOOLS USING THE REPEATING FUNCTION WITH FALSE AND THE NEW VAR COUNT FROM ARRAY
//>>>>
//FOR EVERY NUMBER IN THE COUNTER VAR FROM 0 UP TO COUNTER

//SEARCH: FOR POINTER, SINGLE IN WORD ENUMERATED
//MAKE SURE PONTER PLUS NUMBER >= COUNTER OR
//NEWARRAY AT INDEX POINTER PLUS NUMBER != TO SINGLE ELSE CONTINUE
// IF IT IS CONTINUE THE SEARCH:

//FOR EVERY ITEM IN NUMBERS..<NUMBERS PLUS THE WORD.COUNT
//ISBOLDED AT INDEX ITEM = TRUE

//>>>>

/*
 OUTSIDE OF THE LOOP----
 //CREATE AN RESULTS ARRAY OF EMPTY STRINGS
 FOR NEWITEM IN 0 UP TO COUNTER VAR
 IF ISBOLDED AT INDEX NEWITEM
 IF NEWITEM = 0 OR IS NOT BOLDED AT INDEX NEWITEM - 1
 APPEND THE OPENING TAG TO RESULTS ARRAY
 ELSE
 APPEND TO THE RESULTS THE STRING VERSION OF THE ARRAY AT INDEX NEW ITEM
 >>>>
 
 CHECK IF IS BOLDED AT INDEX NEWITEM
 CHECK IF NEWITEM = COUNTER VAR - 1 OR IF IS NOT BOLDED AT INDEX NEWITEM + 1
 THEN APPEND TO THE RESULTS VAR THE CLOSING TAG
 
 >>>>
 return the reulst array joined
 */
/// - Complexity:
///   - time: O(n * w), where n is the length of the `s`, and w is the sum of
///     all characters in the `dict`.
///   - space: O(n), where n is the length of the `s`.
func addBoldTag2(_ s: String, _ dict: [String]) -> String {
    guard !s.isEmpty else { return ""}
    let newArray = Array(s)
    let counter = newArray.count
    var isBolded = [Bool](repeating: false, count: counter)
    
    for number in 0..<counter {
    search: for word in dict {
        
            for (idx, single) in word.enumerated() { //creating an index and pointer to every word in dict
                guard idx + number >= counter || newArray[idx + number] != single else { continue } //check that k + or = to numbers of i
                continue search
            }
            
            for item in number..<number + word.count {
                isBolded[item] = true
            }
        }
    }
    
    var results = [String]()
    for newItem in 0..<counter {
        if isBolded[newItem] {
            if newItem == 0 || !isBolded[newItem-1] {
                results.append("<b>")
            }
        }
            results.append(String(newArray[newItem]))

        if isBolded[newItem] {
            if newItem == counter-1 || !isBolded[newItem + 1] {
                results.append("</b>")
            }
        }
        
        
    }

    return results.joined()
}

addBoldTag2("abcxyz123", ["abc","123"])

