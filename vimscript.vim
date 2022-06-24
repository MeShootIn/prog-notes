" BASICS
" https://learnxinyminutes.com/docs/vimscript/

" echo "Hello
"     \ world"
" echo [1,
"       \ 2]

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
" echo  "hi" =~  "hello"    | " Regular expression match, uses 'ignorecase'
" echo  "hi" =~# "hello"    | " Regular expression match, case sensitive
" echo  "hi" =~? "hello"    | " Regular expression match, case insensitive
" echo  "hi" !~  "hello"    | " Regular expression unmatch, use 'ignorecase'
" echo  "hi" !~# "hello"    | " Regular expression unmatch, case sensitive
" echo  "hi" !~? "hello"    | " Regular expression unmatch, case insensitive

echo 'Hello'[1:-2]



" LISTS
echo [1, 2] + [2, 4]
" Shallow copy of entire list
echo [1, 2, 3, 4][:]
" All slicing operations create new lists. To modify a list in-place use list
" functions (|list-functions|) or assign directly to an item (see below about
" variables).



" DICTIONARIES
" An UNORDERED sequence of key-value pairs, keys are always STRINGS (numbers
" are implicitly converted to strings).

echo  {'a': 1, 'b': 2}.a
" Syntactic sugar for simple keys
echo  {'a': 1, 'b': 2}['a']



" FUNCTIONS
" TODO https://learnxinyminutes.com/docs/vimscript/#:~:text=manipulation%20functions.%0A%0A%0A%22-,Funcref%20(%7CFuncref%7C),-%22%20%23%23%23%23%23%23%23%0A%22%0A%22%20Reference
