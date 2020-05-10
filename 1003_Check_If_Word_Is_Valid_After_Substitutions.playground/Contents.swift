/*
1003. Check If Word Is Valid After Substitutions

We are given that the string "abc" is valid.
From any valid string V, we may split V into two pieces X and Y such
that X + Y (X concatenated with Y) is equal to V.  (X or Y may be empty.)
Then, X + "abc" + Y is also valid.

If for example S = "abc", then examples of valid
strings are: "abc", "aabcbc", "abcabc", "abcabcababcc".
Examples of invalid strings are: "abccba", "ab", "cababc", "bac".

Return true if and only if the given string S is valid.
*/

import Foundation

let constant = "abc"

func isValid(_ S: String) -> Bool {
    guard S.contains(constant) else { return false }
    if S == constant { return true }
    let next = S.components(separatedBy: constant).reduce("") { $0 + $1 }
    return next.isEmpty ? true : isValid(next)
}
