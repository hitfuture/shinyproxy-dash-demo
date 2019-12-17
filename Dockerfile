FROM ubuntu:18.04

LABEL maintainer "Tobias Verbeke <tobias.verbeke@openanalytics.eu>"

RUN apt-get update && apt-get install -y python3.7 python3-pip

# Dash and dependencies
RUN pip3 install dash===1.7.0  # The core dash backend
RUN pip3 install dash-renderer==1.2.2  # The dash front-end
RUN pip3 install dash-html-components==1.0.2  # HTML components
RUN pip3 install dash-core-components==1.6.0  # Supercharged components
RUN pip3 install plotly --upgrade  # Plotly graphing library used in examples

# app dependencies
RUN pip3 install pandas

RUN mkdir app
COPY app/app.py /app

EXPOSE 8050
ENTRYPOINT ["/usr/bin/python3" ]
WORKDIR /app
CMD ["/usr/bin/python3", "app.py"]
