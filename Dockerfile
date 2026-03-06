FROM n8nio/runners
USER root

COPY --from=mwader/static-ffmpeg:latest /ffmpeg /usr/local/bin/ffmpeg
COPY --from=mwader/static-ffmpeg:latest /ffprobe /usr/local/bin/ffprobe
RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe

RUN cd /opt/runners/task-runner-python && uv pip install moviepy av imageio-ffmpeg

ENV IMAGEIO_FFMPEG_EXE=/usr/local/bin/ffmpeg

RUN cd /opt/runners/task-runner-javascript && pnpm add moment uuid sharp

RUN mkdir -p /usr/share/fonts/truetype && \
    curl -L -o /usr/share/fonts/truetype/NotoSans-Regular.ttf \
      "https://github.com/google/fonts/raw/main/ofl/notosans/NotoSans-Regular.ttf" && \
    curl -L -o /usr/share/fonts/truetype/NotoSans-Bold.ttf \
      "https://github.com/google/fonts/raw/main/ofl/notosans/NotoSans-Bold.ttf"

COPY n8n-task-runners.json /etc/n8n-task-runners.json
USER runner