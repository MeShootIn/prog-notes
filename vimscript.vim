" BASICS

" https://learnxinyminutes.com/docs/vimscript/

echo 'Hello, ' | echo 'World!'
echo "Hello
    \ world"
echo [1,
      \ 2]

" `v:true` evaluates to 1 or the string 'v:true'
" `v:false` evaluates to 0 or the string 'v:false'
echo v:true != v:false | " '1'
echo v:false | " 'v:false'

if !v:false
  echo "It's true!"
endif

" echo x is y             | " Instance identity (lists and dictionaries)
" echo x isnot y          | " Instance non-identity (lists and dictionaries)



" STRINGS

" Strings are compared based on their alphanumerical ordering.

" Case sensitivity depends on the setting of 'ignorecase'.
echo 'a' < 'b'
" Explicit case-sensitivity is specified by appending '#' (match case) or '?'
" (ignore case) to the operator. Prefer explicity case sensitivity when
" writing portable scripts.

" Regular expression matching:
echo  "hi" =~  "hello"    | " Regular expression match, uses 'ignorecase'
echo  "hi" =~# "hello"    | " Regular expression match, case sensitive
echo  "hi" =~? "hello"    | " Regular expression match, case insensitive
echo  "hi" !~  "hello"    | " Regular expression unmatch, use 'ignorecase'
echo  "hi" !~# "hello"    | " Regular expression unmatch, case sensitive
echo  "hi" !~? "hello"    | " Regular expression unmatch, case insensitive

echo 'Hello'[1:-2]



" LISTS

echo [1, 2] + [2, 4]
" Substrings (second index is inclusive)
" Shallow copy of entire list
echo [1, 2, 3, 4][:]
" All slicing operations create new lists. To modify a list in-place use list
" functions (|list-functions|) or assign directly to an item.



" DICTIONARIES

" An UNORDERED sequence of key-value pairs, keys are always STRINGS (numbers
" are implicitly converted to strings).

echo  {'a': 1, 'b': 2}.a
" Syntactic sugar for simple keys
echo  {'a': 1, 'b': 2}['a']

" VARIABLES

" `let`, `const`
" let g:my_var = 1        | " Global variable"
" let l:my_var = 1        | " Local to current function (see functions below)"
" let s:my_var = 1        | " Local to current script file
" let a:my_arg = 1        | " Function argument (see functions below)"

" The Vim scope is read-only
" echo  v:true            | " Special built-in Vim variables (|v:var|)"
" echo  g:                | " All `g` (or `b`, `w`, `t`, `l`, `s`, `a`) vars"

" Access special Vim memory like variables:
" let @a = 'Hello'        | " Register
" let $PATH=''            | " Environment variable
" let &textwidth = 79     | " Option
" let &l:textwidth = 79   | " Local option
" let &g:textwidth = 79   | " Global option

" Function reference variables have the same restrictions as function names
let IsString = {x -> type(x) == type('')}    | " Global: capital letter
let s:isNumber = {x -> type(x) == type(0)}   | " Local: any name allowed

" Assign values of list to multiple variables (number of items must match)
let [x, y] = [1, 2]
" Assign the remainer to a rest variable
let [mother, father; children] = ['Alice', 'Bob', 'Carol', 'Dennis', 'Emily']



" LOOPS

" Iterate over a nested list by unpacking it
for [x, y] in [[1, 0], [0, 1], [-1, 0], [0, -1]]
  " echo 'Position: x ='  .. x .. ', y = ' .. y
endfor

" Iterate over a range of numbers
" NOTE [start, end]
for i in range(10, 0, -1)
endfor

for symbol in keys({'π': 3.14, 'e': 2.71})
endfor

for value in values({'π': 3.14, 'e': 2.71})
endfor

for [symbol, value] in items({'π': 3.14, 'e': 2.71})
endfor



" EXCEPTION HANDLING

" throw "Wrong arguments"

" Guard against an exception (the second catch matches any exception)

try
  source path/to/file
catch /Cannot open/
  echo 'Looks like that file does not exist'
catch /.*/
  echo 'Something went wrong, but I do not know what'
finally
  echo 'I am done trying'
endtry



" FUNCTIONS
echo function('type')                   | " Reference to function `type()`"
" `funcref('type')` will throw an error because the argument must be a
" user-defined function.
" echo funcref('type')                    | " Reference by identity, not name"
echo  {x -> x * x}                       | " Anonymous function"
echo  function('substitute', ['hello'])  | " Partial function"
