#!/usr/bin/env bash

SESSION="code"
SESSION_EXISTS=$(tmux ls | grep $SESSION)
if [ "$SESSION_EXISTS" != "" ]
then 
	tmux kill-session -t $SESSION
fi

# --- Setup window 1 named code ---
# (-d = detached)
# (-s = session)
# (-d = name)
tmux new-session -d -s $SESSION -n "code"  

tmux send-keys -t $SESSION:code.0 "cd ~/dev" C-m
tmux send-keys -t $SESSION:code.0 'clear' C-m 
tmux send-keys -t $SESSION:code.0 "nvim ." C-m 

tmux split-window -v -p 7 -t $SESSION:code.0 

tmux send-keys -t $SESSION:code.1 "cd ~/dev" C-m

tmux select-window -t $SESSION:code:1 # Select shell panel

tmux attach-session -t $SESSION # Attach to the session
