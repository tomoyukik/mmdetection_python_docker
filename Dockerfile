FROM python:3.7

# 必要なライブラリのインストール
ADD requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir --default-timeout=1000  -r requirements.txt

# PyTorchのインストール
RUN pip install --no-cache-dir --default-timeout=1000 \
        torch \
        torchvision \
        torchaudio
#
# RUN pip install openmim
#
# RUN git clone https://github.com/open-mmlab/mmdetection.git
#
# WORKDIR mmdetection
#
# RUN pip install -r requirements/build.txt && \
#     pip install "git+https://github.com/open-mmlab/cocoapi.git#subdirectory=pycocotools" && \
#     pip install -v -e .
#
WORKDIR /notebooks

ENTRYPOINT ["jupyter"]
CMD ["notebook", "--allow-root", "--ip=0.0.0.0"]
