# Dotfiles

## Usage

#### Clone this repo:

```bash
git clone https://github.com/jpavon/dotfiles.git ~/.dotfiles
```

#### Make sync.sh executable:

```bash
cd ~/.dotfiles && chmod +x sync.sh
```

#### Sync files:

```bash
./sync.sh
```

Once is synced you can use this commands:

```bash
dot # sync dotfiles
godot # go to ~/.dotfiles folder
```

## `.extra` file

Add an `.extra` file to `~/` with your git credentials.

```bash
# Git credentials

GIT_AUTHOR_NAME="Julio Pavón"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="julio@thisisbeyond.co.uk"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

Credits to [https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
