1. How does the script handle arguments and options?
The script first checks if the user passes --help, and if so, displays the usage instructions and exits.
After that, it reads any options like -n or -v using a simple while loop and sets internal flags depending on what options were provided.
Once the options are processed, it checks if both the search string and file name are given.
Finally, it builds a dynamic grep command based on the selected options and runs it on the file to display matching lines.



2. If you had to add regex support or options like -i, -c, or -l, how would you change the structure?
If I needed to add regex support, I would update the script to use grep -E to handle extended patterns.
Adding support for -i (ignore case) is already handled using grep -i, so it would just be about adjusting the option parsing if needed.
For -c (count matches) and -l (list files with matches), I would modify the grep command construction to include -c or -l flags dynamically depending on the user's input, and adjust the output accordingly without looping line-by-line




3. What was the hardest part of the script to implement and why?
The hardest part for me was dealing with the -v (invert match) option combined with -n (show line numbers).
When I tested -vn, I noticed that the output was the same as a regular search without inversion, which made it tricky to debug.
It took some time to realize that because of how the grep command was built, the behavior didn't fully invert in a custom manual way, and that grep handled it internally.
Understanding how option combinations affect the search output was a bit confusing at first, but eventually it made sense after more testing.

