# Use Alpine as the base image
FROM alpine:latest

# Set environment variables to avoid interactive prompts
ENV PYTHONUNBUFFERED=1

# Change Alpine repositories to a reliable mirror and install required dependencies
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
	apk update && \
	apk add --no-cache \
	bash \
	openssl \
	tar \
	python3 \
	py3-yaml \
	yq \
	git && \
	ln -sf /usr/bin/python3 /usr/bin/python

# Set working directory inside the container
WORKDIR /project

# Copy encryption script into the container
COPY encryptor /usr/local/bin/encryptor

# Ensure script is executable
RUN chmod +x /usr/local/bin/encryptor

# Use an explicit shell to avoid PATH issues
ENTRYPOINT ["/bin/bash", "/usr/local/bin/encryptor"]
