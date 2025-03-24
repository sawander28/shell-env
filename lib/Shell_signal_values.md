{{navigation
|previous=Terminating Processes
|next=trap statement|The trap statement}}

* You must know signal and their values while writing the shell scripts. 
* You cannot use (trap) all available signals.
* Some signals can never be caught. For example, the signals [[SIGKILL]] (9) and [[SIGSTOP]] (19) cannot be caught, blocked, or ignored.
* The following table is a list of the commonly used signal numbers, description and whether they can be trapped or not:
{| style="cellpadding="20" cellspacing="0" border="1"  width="100%"
! style="background:#ffdead;"| Number
! style="background:#ffdead;"| Constant
! style="background:#ffdead;"| Description
! style="background:#ffdead;"| Default action
! style="background:#ffdead;"| Trappable (Yes/No)
|-
|0
|0
|Success
|Terminate the process.
|Yes 
|-
|1
|[[SIGHUP]]
|Hangup detected on controlling terminal or death of controlling process. Also, used to reload configuration files for many [[UNIX]] / [[Linux]] [[daemons]].
|Terminate the process.
|Yes
|-
|2
|[[SIGINT]]
|Interrupt from keyboard (Ctrl+C)
|Terminate the process.
|Yes
|-
|3
|[[SIGQUIT]]
|Quit from keyboard (Ctrl-\. or, Ctrl-4 or, on the virtual console, the SysRq key)
|Terminate the process and dump core.
|Yes
|-
|4
|[[SIGILL]]
|Terminate the process and dump core.
|Illegal instruction.
|Yes
|-
|6
|[[SIGABRT]]
|Abort signal from abort(3) - software generated.
|Terminate the process and dump core.
|Yes
|-
|8
|[[SIGFPE]]
|Floating point exception.
|Terminate the process and dump core. 
|Yes
|-
|9
|[[SIGKILL]]
|Kill signal
|Terminate the process.
|No
|-
|15
|[[SIGTERM]]
|Termination signal
|Terminate the process.
|Yes
|-
|20
|[[SIGSTP]]
|Stop typed at tty (CTRL+z)
|Stop the process.
|Yes
|}
To view list of all signals, enter:
<syntaxhighlight lang="bash" >kill -l</syntaxhighlight>
To view  numeric number for given signal called SIGTSTP, enter:
<syntaxhighlight lang="bash" >kill -l SIGTSTP</syntaxhighlight>
You can also view list of signal by visiting /usr/include/linux/signal.h file:
<syntaxhighlight lang="bash" >more /usr/include/linux/signal.h</syntaxhighlight>

[[Category:Catching signals]][[Category:Commands]]

{{navigation
|previous=Terminating Processes
|next=trap statement|The trap statement}}

