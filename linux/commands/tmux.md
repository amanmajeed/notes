## About tmux

### Install
* Install : `sudo yum install tmux`

### Basics
* Create session : `tmux` or `tmux new -s <sessionName>`
* Detach a session : `ctrl+b + d`
* List all sessions outside tmux : `tmux ls`
* List all sessions from inside tmux : `ctrl+b + s`
* Reattach a session : `tmux attach -t <sessionID>`

### Kill
* Kill all session : `tmux kill-server`
* Kill spesific session : `tmux kill-server -t <sessionName>`

### Panes
* Pane Horizontal : `ctrl+b + "`
* Pane Vertical : `ctrl+b + %`
* Close pane : `ctrl+b + x`
* Navimate pane : `ctrl+b + <arrows>`
* Move pane left : `ctrl+b + {`
* Move pane right : `ctrl+b + }`

### References
* [leimao.github.io](https://leimao.github.io/blog/Tmux-Tutorial/)
* [tmuxcheatsheet.com](https://tmuxcheatsheet.com/)