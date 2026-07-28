#!/usr/bin/env bash

SESSION="master"
SESSION_EXISTS=$(tmux ls | grep $SESSION)
if [ "$SESSION_EXISTS" != "" ]
then 
	tmux kill-session -t $SESSION
fi

# --- Setup window 1 named code ---
# (-d = detached)
# (-s = session)
# (-d = name)
tmux new-session -d -s $SESSION -n "home"  

tmux send-keys -t $SESSION:home.0 "cd ~/" C-m
tmux send-keys -t $SESSION:home.0 'clear' C-m 
tmux send-keys -t $SESSION:home.0 'fastfetch' C-m 
tmux send-keys -t $SESSION:home.0 'ls' C-m 

tmux split-window -h -p 5 -t $SESSION:home.0 

tmux send-keys -t $SESSION:home.1 "htop" C-m

tmux new-window -t $SESSION -n "TODO"

tmux send-keys -t $SESSION:TODO.0 "nvim ~/TODO.md" C-m

tmux select-window -t $SESSION:home # Select the first window 
tmux select-pane -l # Select the shell panel

tmux attach-session -t $SESSION # Attach to the session
