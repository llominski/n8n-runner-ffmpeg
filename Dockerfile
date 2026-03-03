FROM n8nio/runners
USER root
RUN apk add --no-cache ffmpeg
RUN cd /opt/runners/task-runner-python && uv pip install moviepy av imageio-ffmpeg
COPY n8n-task-runners.json /etc/n8n-task-runners.json
USER runner