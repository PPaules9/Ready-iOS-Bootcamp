# Swift Advanced Concepts - Assessment Quiz
## Session 3: From Objects to Protocols & Robust Error Handling

**Instructions:**
- 20 questions total
- Mix of multiple choice and code analysis
- No time limit for self-study
- Check answers at the end
- Score 80%+ to pass

---

## 📝 Part 1: Classes vs Structs (Questions 1-5)

### Question 1
Which statement is TRUE about structs in Swift?

A) Structs are always slower than classes  
B) Structs are allocated on the heap  
C) Structs use value semantics  ✅
D) Structs support inheritance

<details>
<summary>Answer</summary>
**C) Structs use value semantics**

Explanation: Structs are value types with copy-on-write semantics, typically stack-allocated, and do NOT support inheritance.
</details>

---

### Question 2
What will this code print?

```swift
struct Point {
    var x: Int
}

var p1 = Point(x: 10)
var p2 = p1
p2.x = 20

print(p1.x)
```

A) 20  
B) 10  ✅
C) Compiler error  
D) Runtime crash


<details>
<summary>Answer</summary>
**B) 10**

Explanation: Structs use value semantics. `p2` is a COPY of `p1`, so modifying `p2` doesn't affect `p1`.
</details>

---

### Question 3
Identify the problem in this code:

```swift
class Person {
    var apartment: Apartment?
    deinit { print("Person deallocated") }
}

class Apartment {
    var tenant: Person?
    deinit { print("Apartment deallocated") }
}

var john: Person? = Person()
var unit: Apartment? = Apartment()
john?.apartment = unit
unit?.tenant = john

john = nil
unit = nil
```

A) Syntax error  
B) Retain cycle (memory leak)  ✅
C) Wrong use of optionals  
D) No problem, works fine

<details>
<summary>Answer</summary>
**B) Retain cycle (memory leak)**

Explanation: Person strongly references Apartment, and Apartment strongly references Person. Neither gets deallocated. Fix: use `weak var tenant: Person?`
</details>

---

### Question 4
When should you prefer using a class over a struct?

A) For simple data containers  
B) When identity matters  ✅
C) For better performance  
D) When you want value semantics

<details>
<summary>Answer</summary>
**B) When identity matters**

Explanation: Use classes when you need reference semantics and identity. For example, a BankAccount with ID "123" is a specific account, not just data.
</details>

---

### Question 5
What's the purpose of Copy-on-Write (COW)?

A) To make structs act like classes  
B) To optimize struct copying  ✅
C) To enable inheritance for structs  
D) To prevent memory leaks 

<details>
<summary>Answer</summary>
**B) To optimize struct copying**

Explanation: COW delays copying until modification, combining the benefits of value semantics with performance.
</details>

---

## 🎨 Part 2: Properties (Questions 6-9)

### Question 6
What will this code print?

```swift
class Example {
    lazy var value: String = {
        print("Computing")
        return "Done"
    }()
}

let ex = Example()
print("Created")
print(ex.value)
```

A) Computing, Created, Done  
B) Created, Computing, Done  ✅
C) Computing, Done, Created  
D) Compiler error

<details>
<summary>Answer</summary>
**B) Created, Computing, Done**

Explanation: Lazy properties are only computed when first accessed, not during initialization.
</details>

---

### Question 7
What's the difference between `didSet` and `willSet`?

A) No difference  
B) `didSet` runs before change, `willSet` runs after  ✅
C) `willSet` runs before change, `didSet` runs after  
D) `didSet` only works with classes

<details>
<summary>Answer</summary>
**C) `willSet` runs before change, `didSet` runs after**

Explanation: 
- `willSet`: Called before the new value is stored  
- `didSet`: Called after the new value is stored
</details>

---

### Question 8
What does this property wrapper do?

```swift
@propertyWrapper
struct Capitalized {
    private var value: String = ""
    var wrappedValue: String {
        get { value }
        set { value = newValue.capitalized }
    }
}

struct User {
    @Capitalized var name: String = ""
}
```

A) Makes the name uppercase  
B) Makes the name lowercase  
C) Capitalizes first letter of each word  ✅
D) Does nothing

<details>
<summary>Answer</summary>
**C) Capitalizes first letter of each word**

Explanation: The `.capitalized` property capitalizes the first letter of each word.
</details>

---

### Question 9
Which property type should you use for an expensive one-time computation?

A) Stored property  
B) Computed property  
C) Lazy property  ✅
D) Property wrapper

<details>
<summary>Answer</summary>
**C) Lazy property**

Explanation: Lazy properties compute once when first accessed and store the result.
</details>

---

## 🔧 Part 3: Methods & Initialization (Questions 10-12)

### Question 10
Why does this code fail to compile?

```swift
struct Point {
    var x: Int
    
    func moveRight() {
        x += 1  // Error!
    }
}
```

A) Syntax error in function  
B) Missing `mutating` keyword  ✅
C) Can't modify structs  
D) Should use `self.x`

<details>
<summary>Answer</summary>
**B) Missing `mutating` keyword**

Explanation: Methods that modify struct properties must be marked `mutating`.
</details>

---

### Question 11
What's the benefit of a failable initializer?

A) Better performance  
B) Validation at construction time  ✅
C) Automatic error handling  
D) Required for protocols

<details>
<summary>Answer</summary>
**B) Validation at construction time**

Explanation: Failable initializers (`init?`) allow rejecting invalid data during object creation.
</details>

---

### Question 12
What's the difference between designated and convenience initializers?

A) No difference  
B) Designated does the work, convenience delegates  ✅
C) Convenience is faster  
D) Designated is only for structs

<details>
<summary>Answer</summary>
**B) Designated does the work, convenience delegates**

Explanation: Designated initializers set all properties. Convenience initializers call designated initializers with default values.
</details>

---

## 🧬 Part 4: Generics (Questions 13-15)

### Question 13
What's the purpose of generic constraints?

A) To make code slower  
B) To limit what types can be used  ✅
C) To enable inheritance  
D) To prevent compilation 

<details>
<summary>Answer</summary>
**B) To limit what types can be used**

Explanation: Constraints like `<T: Comparable>` ensure T has specific capabilities.
</details>

---

### Question 14
What will this code do?

```swift
func swap<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var x = 5, y = 10
swap(&x, &y)
```

A) Compiler error  
B) Swaps x and y  ✅
C) Does nothing  
D) Runtime crash

<details>
<summary>Answer</summary>
**B) Swaps x and y**

Explanation: Generic swap function works for any type. After: x=10, y=5.
</details>

---

### Question 15
Why use generics instead of `Any`?

A) Better performance  
B) Type safety  
C) Both A and B  ✅
D) No difference

<details>
<summary>Answer</summary>
**C) Both A and B**

Explanation: Generics provide type safety AND better performance (no type casting needed).
</details>

---

## 📋 Part 5: Protocols (Questions 16-18)

### Question 16
What's the benefit of protocol extensions?

A) Multiple inheritance  
B) Default implementations  ✅
C) Better performance  
D) Required by Swift

<details>
<summary>Answer</summary>
**B) Default implementations**

Explanation: Protocol extensions provide default method implementations that all conforming types get for free.
</details>

---

### Question 17
What does `typealias DataSource = Loadable & Cacheable` mean?

A) DataSource inherits from both  
B) DataSource must conform to both protocols  ✅
C) Syntax error  
D) DataSource is optional

<details>
<summary>Answer</summary>
**B) DataSource must conform to both protocols**

Explanation: Protocol composition (`&`) requires conformance to ALL protocols.
</details>

---

### Question 18
Why prefer protocols over inheritance?

A) Better performance  
B) Multiple capabilities without hierarchy  ✅
C) Required by Swift  
D) Easier syntax

<details>
<summary>Answer</summary>
**B) Multiple capabilities without hierarchy**

Explanation: Protocols allow composition of capabilities. A type can conform to many protocols but only inherit from one class.
</details>

---

## 🎭 Part 6: Delegation & Error Handling (Questions 19-20)

### Question 19
Why should delegates always be `weak`?

A) Better performance  
B) To avoid retain cycles  ✅
C) Required by Swift  
D) To enable nil values

<details>
<summary>Answer</summary>
**B) To avoid retain cycles**

Explanation: Without `weak`, the delegate and delegator create a retain cycle, causing memory leaks.
</details>

---

### Question 20
What's the advantage of typed errors over `Error`?

A) Better performance  
B) Clear, specific error handling  ✅
C) Required for async/await  
D) No advantage

<details>
<summary>Answer</summary>
**B) Clear, specific error handling**

Explanation: Typed errors (enums) make error cases explicit and enable specific handling.
</details>

---

## 📊 Scoring

Count your correct answers:

- **18-20 correct (90-100%)**: Excellent! 🌟  
  You have a strong grasp of advanced Swift concepts.

- **16-17 correct (80-85%)**: Good! ✅  
  You understand most concepts. Review areas you missed.

- **14-15 correct (70-75%)**: Passing ⚠️  
  You grasp basics but need more practice with advanced topics.

- **Below 14 (<70%)**: Review needed 📚  
  Revisit the materials and do the exercises again.

---

## 🎯 Areas to Focus On

Based on which questions you missed:

**Questions 1-5 (Classes vs Structs):**
- Review memory management
- Practice identifying when to use each
- Study retain cycles

**Questions 6-9 (Properties):**
- Experiment with property observers
- Create your own property wrappers
- Understand lazy vs computed

**Questions 10-12 (Methods & Init):**
- Practice mutating methods
- Implement failable initializers
- Study initialization rules

**Questions 13-15 (Generics):**
- Write generic functions
- Use generic constraints
- Understand type safety benefits

**Questions 16-18 (Protocols):**
- Create protocol hierarchies
- Write protocol extensions
- Practice protocol composition

**Questions 19-20 (Delegation & Errors):**
- Implement delegation patterns
- Define typed error enums
- Practice error handling

---

## 📚 Next Steps

After completing this quiz:

1. **Review mistakes:**
   - Go back to materials for topics you missed
   - Redo exercises related to those topics

2. **Practice:**
   - Complete the interactive exercises
   - Build a small project using these concepts
   - Refactor old code with new knowledge

3. **Share:**
   - Discuss solutions with peers
   - Ask questions in SwiftCairo community
   - Help others understand

4. **Apply:**
   - Use these patterns in real projects
   - Identify antipatterns in existing code
   - Teach others what you learned

---

## 🏆 Bonus Challenge

If you scored 90%+, try this:

**Build a complete type-safe networking layer that:**
- Uses generics for type safety
- Uses protocols for abstraction
- Has proper error handling
- Includes caching with repository pattern
- Uses async/await
- Has no retain cycles

Share your solution with the community on Slack! 🚀

---

**Remember:** The goal isn't just to pass the quiz.  
The goal is to **understand WHY** each concept matters.

Keep coding! 💪

---

**Mohammed Elnaggar**  
SwiftCairo Community  
Session 3 Assessment
