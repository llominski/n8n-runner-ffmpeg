FROM n8nio/runners
USER root

COPY --from=mwader/static-ffmpeg:latest /ffmpeg /usr/local/bin/ffmpeg
COPY --from=mwader/static-ffmpeg:latest /ffprobe /usr/local/bin/ffprobe
RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe

RUN cd /opt/runners/task-runner-python && uv pip install --system moviepy av imageio-ffmpeg

COPY n8n-task-runners.json /etc/n8n-task-runners.json
USER runner