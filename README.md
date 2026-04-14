# ClaudeCode-Dockerfile

This project provides a Docker-based environment for running ClaudeCode with a local Docker setup for VSCode remote development.

## Prerequisites

- **Docker Desktop** (recommended) installed on your system
- Git installed

## Setup Instructions

### 1. Start Docker Desktop

Make sure Docker Desktop is running on your system before proceeding.

### 2. Generate SSH Key for Connection

To establish an SSH connection to the Docker container, generate an SSH key locally:

```bash
ssh-keygen -t ed25519
```

When prompted:
- Enter a file location (default is fine): `C:\Users\YourName\.ssh\id_ed25519.pub`
- You can optionally add a passphrase

The public key will be created at: `C:\Users\YourName\.ssh\id_ed25519.pub`
Copy ssh public key to authorized_keys file (it will be transfered to your container)

### 3. VSCode Connection Setup

Open Visual Studio Code and configure the remote connection:

1. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on macOS)
2. Type "Remote-SSH: Add New SSH Host"
3. Add the following SSH host configuration:

```
ssh dev@localhost -p 2222
```
Then select the new SSH host from the Remote Explorer panel and connect.

### 4. Build and Run

```bash
docker-compose up -d --build
```

The Docker container will start on port 2222, allowing VSCode to connect via SSH.

## Usage

Once connected via VSCode's Remote SSH, you can:
- Edit files in the container
- Run containerized applications
- Use the full Docker environment from your IDE

After connecting remotely you can instantly use claude CLI in the terminal.
If you want VScode interface:
- generate claude setup-token on host machine: cmd 'claude setup-token'
- install extension to claude code on dev container (via vs code)
- open claude extension on vs code and authorize via token

## Dockerfile

This project includes a `Dockerfile` for creating a customized container environment.

## License

[Add your license information here]