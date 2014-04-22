# Dotfiles

## Usage

#### Install Oh-my-zsh:

[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

#### Clone this repo:

```bash
git clone https://github.com/jpavon/dotfiles.git ~/.dotfiles
```

#### Make sync.sh executable:

```bash
cd ~/.dotfiles && chmod +x bin/dotfiles
```

#### Sync files:

```bash
./bin/dotfiles
```

Once is synced you can use this command to update the dotfiles from ~/.dotfiles to ~/:

```bash
dotfiles
```

## `.extra` file

Add an `.extra` file to `~/` with your git credentials.

```bash
# Git credentials

GIT_AUTHOR_NAME="Your name"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="Your email"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

Credits to:

- [https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [https://github.com/necolas/dotfiles](https://github.com/necolas/dotfiles)
