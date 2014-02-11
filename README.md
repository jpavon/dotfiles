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
git config --global user.name "Your name"
git config --global user.email "Your email"
```

Credits to [https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)