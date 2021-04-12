FROM ubuntu:latest AS prebuild
ARG repository_url=https://github.com/Panchos39/Machine-Learning-Introduction.git
RUN apt-get update > /dev/null \ 
    && apt-get install -y curl unrar git
WORKDIR /downloads
COPY download_data.sh .
RUN ./download_data.sh
RUN git clone $repository_url ML/ \
    && unrar e data.rar ML/data/

FROM jupyter/minimal-notebook:latest
USER $NB_UID
RUN conda install --quiet --yes numpy pandas
WORKDIR /home/$NB_USER
COPY --from=prebuild /downloads/ML ./ML
