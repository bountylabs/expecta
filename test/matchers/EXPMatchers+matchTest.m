#import "TestHelper.h"

@interface EXPMatchers_matchTest : TEST_SUPERCLASS
@end

@implementation EXPMatchers_matchTest

- (void)test_match {
  assertPass(test_expect(@"Test string123").match(@"[a-zA-Z]{4}.string[1-3]{3}"));
  assertPass(test_expect(@"Test string123 Test string123").match(@"Test"));
  assertFail(test_expect(@"Test string123").match(@"test"), @"expected: Test string123 to match to test");
  assertFail(test_expect(@"Test string123").match(@""), @"unable to create regular expression from given parameter: The value “” is invalid.");
  assertFail(test_expect(nil).match(@"Test"), @"the object is nil/null");
  assertFail(test_expect(@"Test string123").match(nil), @"the expression is nil/null");
}

- (void)test_toNot_match {
  assertFail(test_expect(@"Test string123").toNot.match(@"[a-zA-Z]{4}.string[1-3]{3}"), @"expected: Test string123 not to match to [a-zA-Z]{4}.string[1-3]{3}");
  assertFail(test_expect(@"Test string123 Test string123").toNot.match(@"Test"), @"expected: Test string123 Test string123 not to match to Test");
  assertPass(test_expect(@"Test string123").toNot.match(@"test"));
  assertFail(test_expect(@"Test string123").toNot.match(@""), @"unable to create regular expression from given parameter: The value “” is invalid.");
  assertFail(test_expect(nil).toNot.match(@"Test"), @"the object is nil/null");
  assertFail(test_expect(@"Test string123").toNot.match(nil), @"the expression is nil/null");
}

@end