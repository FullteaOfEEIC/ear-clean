FROM tensorflow/tensorflow:2.1.0-gpu-py3-jupyter

LABEL maintainer="frt frt@hongo.wide.ad.jp"
RUN apt update && apt install -y\
 sudo\
 git\
 wget\
 curl\
 build-essential\
 ffmpeg

RUN pip install --upgrade setuptools pip
RUN pip install\
 seaborn\
 matplotlib\
 tqdm\
 pandas\
 sklearn\
 timeout_decorator\
 pydot\
 pydub

RUN touch /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo c.NotebookApp.open_browser = False >> /root/.jupyter/jupyter_notebook_config.py
WORKDIR /mnt
CMD jupyter notebook --allow-root  --NotebookApp.token=''


