FROM python

# Install development packages for lxml
# RUN apk add --no-cache libxml2-dev libxslt-dev

# Update the package list
RUN apt-get update

# Install ffmpeg
RUN apt-get install -y ffmpeg

ENV N_m3u8DL-RE="/app/linux/N_m3u8DL-RE_Beta_linux-x64/N_m3u8DL-RE"

# export PATH=$PATH:app/linux/ffmpeg-6.1.1

# ENV PATH="/app/Bento4-SDK-1-6-0-641.x86_64-microsoft-win32\Bento4-SDK-1-6-0-641.x86_64-microsoft-win32/bin:/app/ffmpeg-2024-09-05-git-3d0d0f68d5-essentials_build\bin:/app/mkvtoolnix-64-bit-87.0\mkvtoolnix:$N_m3u8DL_RE_PATH:$PATH"
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD [ "python", "./ozivine.py" ]


