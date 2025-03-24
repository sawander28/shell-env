
:==Syntax==
The syntax is as follows
<pre>trap arg signal
trap command signal
trap 'action' signal1 signal2 signalN
trap 'action' SIGINT 
trap 'action' SIGTERM SIGINT SIGFPE SIGSTP
trap 'action' 15 2 8 20</pre>
===Example===
Create a shell script called testtrap.sh:
<syntaxhighlight lang="bash" >#!/bin/bash
# capture an interrupt # 0
trap 'echo "Exit 0 signal detected..."' 0

# display something
echo "This is a test"

# exit shell script with 0 signal
exit 0</syntaxhighlight>
Save and close the file. Run it as follows:
<syntaxhighlight lang="bash" >chmod +x testtrap.sh
./testtrap.sh</syntaxhighlight>
Sample outputs:
<pre>This is a test
Exit 0 signal detected...
</pre>
* The first line sets a trap when script tries to exit with status 0. 
* Then script exits the shell with 0, which would result in running [[echo command]].
* Try the following example at a shell prompt (make sure /tmp/rap54ibs2sap.txt doesn't exits).
* Define a shell variable called $file:
<syntaxhighlight lang="bash" >file=/tmp/rap54ibs2sap.txt</syntaxhighlight>
Now, try to remove $file, enter:
<syntaxhighlight lang="bash" >rm $file</syntaxhighlight>
Sample output:
<pre>rm: cannot remove `/tmp/rap54ibs2sap.txt': No such file or directory</pre>
Now sets a trap for rm command:
<syntaxhighlight lang="bash" >trap "rm $file; exit" 0 1 2 3 15</syntaxhighlight>
Display list of defined traps, enter:
<syntaxhighlight lang="bash" >trap</syntaxhighlight>
Sample outputs:
<pre>trap -- 'rm /tmp/rap54ibs2sap.txt; exit' EXIT
trap -- 'rm /tmp/rap54ibs2sap.txt; exit' SIGHUP
trap -- 'rm /tmp/rap54ibs2sap.txt; exit' SIGINT
trap -- 'rm /tmp/rap54ibs2sap.txt; exit' SIGQUIT
trap -- 'rm /tmp/rap54ibs2sap.txt; exit' SIGTERM</pre>
Now, try again to remove the $file, enter:
<syntaxhighlight lang="bash" >rm $file</syntaxhighlight>
This time rm command did not displayed an error. The $file doesn't exist yet. The trap command simply exit whenever it get 0, 1, 2, 3, or 15 signal. Try capturing CTRL+C:
<syntaxhighlight lang="bash" >#!/bin/bash
# capture an interrupt # 2 (SIGINT)
trap '' 2
# read CTRL+C from keyboard with 30 second timeout
read -t 30 -p  "I'm sleeping hit CTRL+C to exit..."</syntaxhighlight>
Sample outputs:
<pre>I'm sleeping hit CTRL+C to exit...^C^C^C^C</pre>
{{navigation
|previous=Shell signal values
|next=How to clear trap}}

{{navigation
|previous=trap statement|The trap statement
|next=Include trap statements in a script}}

To clear a trap use the following syntax:
<pre>trap - signal
trap - signal1 signal2</pre>
For example, set a trap for rm command:
<syntaxhighlight lang="bash" >file=/tmp/test4563.txt
trap 'rm $file' 1 2 3 15
trap</syntaxhighlight>
To clear SIGINT (2), enter:
<syntaxhighlight lang="bash" >trap - SIGINT
trap</syntaxhighlight>
To clear all traps, enter:
<syntaxhighlight lang="bash" >trap - 1 2 3 15
trap</syntaxhighlight>
Create a shell script called oddoreven.sh:
<syntaxhighlight lang="bash" >#!/bin/bash
# Shell script to find out odd or even number provided by the user
# ----
# set variables to an integer attribute
declare -i times=0
declare -i n=0

# capture CTRL+C, CTRL+Z and quit singles using the trap
trap 'echo " disabled"' SIGINT SIGQUIT SIGTSTP

# set an infinite while loop
# user need to enter -9999 to exit the loop
while true
do
        # get date
	read -p "Enter number (-9999 to exit) : " n
        # if it is -9999 die 
	[ $n -eq -9999 ] && { echo "Bye!"; break; }
        # find out if $n is odd or even
	ans=$(( n % 2 ))
        # display result 
	[ $ans -eq 0 ] && echo "$n is an even number." || echo "$n is an odd number."
        # increase counter by 1
	times=$(( ++times ))
done


# reset all traps 
trap - SIGINT SIGQUIT SIGTSTP

# display counter
echo "You played $times times."
exit 0</syntaxhighlight>
Save and close the file. Run it as follows:
<syntaxhighlight lang="bash" >chmod +x oddoreven.sh
./oddoreven.sh
</syntaxhighlight>
Sample outputs:
<pre>Enter number (-9999 to exit) : 2
2 is an even number.
Enter number (-9999 to exit) : 999
999 is an odd number.
Enter number (-9999 to exit) : ^C disabled

0 is an even number.
Enter number (-9999 to exit) : -9999
Bye!
You played 3 times.</pre>

[[Category:Catching signals]][[Category:Commands]]
{{navigation
|previous=trap statement|The trap statement
|next=Include trap statements in a script}}

