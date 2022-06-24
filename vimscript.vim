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



" FUNCTIONS
echo function('type')                   | " Reference to function `type()`"
" `funcref('type')` will throw an error because the argument must be a
" user-defined function
" echo funcref('type')                    | " Reference by identity, not name"
echo  {x -> x * x}                       | " Anonymous function"
echo  function('substitute', ['hello'])  | " Partial function"



" VARIABLES
let g:my_var = 1        | " Global variable"
let l:my_var = 1        | " Local to current function (see functions below)
let s:my_var = 1        | " Local to current script file
let a:my_arg = 1        | " Function argument (see functions below)"
