# KasperskyOS Dockerfile

![Docker](https://byob.yarr.is/adhikara13/KasperskyOS-Dockerfile/docker-badge)
## Introduction

This Dockerfile simplifies the process of running KasperskyOS Community Edition by automating the installation and setup steps. KasperskyOS is a secure, flexible operating system designed for embedded systems, critical infrastructure, and IoT devices.

## Prerequisites

- [Docker](https://www.docker.com/) installed on your system.

## Getting Started

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/adhikara13/KasperskyOS-Dockerfile
    ```

2. Navigate to the project directory:

    ```bash
    cd KasperskyOS-Dockerfile
    ```

3. Build and run the Docker container:

    ```bash
    docker-compose up -d --build
    ```

    This command will fetch the necessary dependencies, download the KasperskyOS image, and start the container in the background.

4. Access the KasperskyOS container interactively:

    ```bash
    docker exec -it kasperskyos-container /bin/bash
    ```

    Now you are inside the KasperskyOS container and can explore or run KasperskyOS commands.

5. When finished, stop and remove the container:

    ```bash
    docker-compose down
    ```

## Notes

- The Dockerfile installs required dependencies and fetches the latest KasperskyOS image automatically.
- This setup allows for a hassle-free way to experience KasperskyOS without dealing with manual installations and configurations.

## Contributing

If you encounter issues or have suggestions for improvements, feel free to open an [issue](https://github.com/adhikara13/KasperskyOS-Dockerfile/issues) or submit a [pull request](https://github.com/adhikara13/KasperskyOS-Dockerfile/pulls).

## License

This project is licensed under the [MIT License](LICENSE).

