FROM continuumio/anaconda3

LABEL maintainer="Anthony Rawlins <anthony.rawlins@unimelb.edu.au>"
COPY ./sources.list /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y nano
RUN conda update -n base conda
RUN conda install -y pandas xarray simplejson numpy rasterio opencv
RUN pip install hug -U
RUN pip install marshmallow python-swiftclient python-keystoneclient
RUN pip install netcdf4
RUN apt-get install -y libgl1-mesa-glx 
RUN apt-get install -y ffmpeg
RUN conda install -y geopandas cartopy aiohttp
RUN pip install regionmask
RUN pip install rx aiohttp_cors
RUN pip install httplib2 geojson
RUN pip install tabulate
RUN pip install celery
RUN pip install redis==2.10.6
# RUN pip install flower
RUN apt-get install -y git
RUN pip install git+https://github.com/mher/flower.git

# RUN COPY ./flower/flower/api/__init__.py /opt/conda/lib/python3.6/site-packages/flower/flower/api/__init__.py
# RUN COPY ./flower/requirements/default.txt /opt/conda/lib/python3.6/site-packages/flower/requirements/default.txt

RUN mkdir -p /data
RUN groupadd -g 1000 dockergroup
RUN useradd -r -u 1000 -g 1000 dockeruser
USER 1000

ENV TZ Australia/Melbourne

EXPOSE 5555