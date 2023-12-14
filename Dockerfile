# Use an official Debian image as the base image
FROM debian:bullseye

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y curl wget parted fdisk udev screen vim jq make flex libasound2  libpulse0 libtinfo5 libx11-6 \
    libpython2.7 socat cpp libpng16-16 device-tree-compiler sudo build-essential libglib2.0-0 libncurses5\
    libsdl2-2.0-0 libusb-1.0-0 libpixman-1-0 libcurl3-gnutls doxygen dosfstools libncurses5 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Fetch download link from the API response
RUN download_link=$(curl -s "https://api-router.kaspersky-labs.com/downloads/search/v3/b2b?sites=https://os.kaspersky.com&productcode=5295222" | \
    jq -r '.kasperskyos_ce.Build.Empty.Empty.Empty["https://os.kaspersky.com"]["1"]["en-US,ru-RU"].Link') && \
    sha256sum=$(curl -s "https://api-router.kaspersky-labs.com/downloads/search/v3/b2b?sites=https://os.kaspersky.com&productcode=5295222" | \
    jq -r '.kasperskyos_ce.Build.Empty.Empty.Empty["https://os.kaspersky.com"]["1"]["en-US,ru-RU"].SHA256') && \
    wget -O /tmp/KasperskyOS.deb "$download_link" && \
    echo "$sha256sum /tmp/KasperskyOS.deb" | sha256sum -c - || (echo "SHA256 checksum failed" && exit 1) && \
    dpkg -i /tmp/KasperskyOS.deb || apt-get install -f -y && \
    rm /tmp/KasperskyOS.deb

# Set up environment variables
ENV PATH="/opt/KasperskyOS-Community-Edition-1.1.1.40:${PATH}"

# Copy KasperskyOS examples to the home directory
RUN mkdir -p /root/kosce
RUN cp -r  /opt/KasperskyOS-Community-Edition-1.1.1.40/examples/hello /root/kosce/hello

# Set working directory
WORKDIR /root/kosce/hello

# Allow execution of the cross-build script
RUN chmod +x cross-build.sh

# Define default command to run when the container starts
CMD ["./cross-build.sh"]
