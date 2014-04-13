# tmux-completion

> Better tab completion for tmux

## Overview

The tmux tab completion provided by [bash-completion]
(http://bash-completion.alioth.debian.org/) suggests only tmux commands. This
is better than nothing, but if you've entered `tmux attach -t `, it should
really only show you the possible session names. This extension does precisely
that.

In fact, it currently ONLY does that. There are smarter ways to do this, as
well as ways to provide better support for things like tmux's `session:window`
syntax, etc, but that isn't included at the moment.

## Usage

Download this script and source it.

If you installed bash-completion using homebrew
(e.g. `brew install bash-completion`), you can look at your current completions
with ``ls `brew --prefix`/etc/bash_completion.d``. You could simply replace the
tmux file listed there with this one, but I wouldn't recommend it. Instead I
keep this one in my dotfiles repository and source it in my `.bash_profile`.
I manually copy the tmux file in this repo and put it in my dotfiles repo in
the `bash_completion.d/` directory, then source it in my `.bash_profile` like
so:

```shell
source ~/dotfiles/bash_completion.d/tmux
```

## Attribution

This is a modification of the tmux file included with bash-completion. All hail
bash-completion for giving me the foundation and enumerating all the tmux
commands.

On the other hand, I could be completely wrong about this. I have a different
set in ``ls `brew --prefix bash-completion`/etc/bash_completion.d`` and
``ls `brew --prefix`/etc/bash_completion.d``. I might be wrong in thinking that
the tmux script I modified came from the bash-completion guys. Either way,
they run a cool project, so check it out.
