FROM python

WORKDIR /docs
ADD requirements.txt /docs
ADD source /docs/source
ADD source/suite /docs/source/suite
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python -m sphinx source/suite build/suite
