FROM python:3.12-rc-buster

# create directory for the app user
RUN mkdir -p /code

# create the user group app and add user to group
RUN addgroup -system app && adduser --system --no-create-home --group app

# create the appropriate directories
ENV HOME=/code
RUN mkdir $HOME/staticfiles
WORKDIR $HOME

# WORKDIR /code

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies  
RUN pip install --upgrade pip  

# Install dependencies
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends netcat &&\
    apt-get install -y binutils libproj-dev gdal-bin && \
    apt-get clean

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy project
COPY ./config $HOME/config
COPY ./staticfiles $HOME/staticfiles
COPY .env $HOME
COPY entrypoint.sh $HOME
COPY manage.py $HOME

# chown all the files to the app user
RUN chown -R app:app $HOME
RUN chmod +x manage.py

# change to the app user
USER app

# run entrypoint.prod.sh
RUN ["chmod", "+x", "/code/entrypoint.sh"]

ENTRYPOINT ["/code/entrypoint.sh"]