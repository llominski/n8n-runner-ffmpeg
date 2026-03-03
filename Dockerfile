FROM n8nio/runners
USER root
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*
RUN cd /opt/runners/task-runner-python && uv pip install moviepy av imageio-ffmpeg
COPY n8n-task-runners.json /etc/n8n-task-runners.json
USER runner