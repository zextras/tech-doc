FROM python

WORKDIR /docs
ADD requirements.txt /docs
COPY source /docs/source
COPY source/suite /docs/source/suite
COPY source/carbonio /docs/source/carbonio
COPY source/carbonio-ce /docs/source/carbonio-ce
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python -m sphinx source/suite build/suite/html
RUN python -m sphinx source/carbonio build/carbonio/html
RUN python -m sphinx source/carbonio-ce build/carbonio-ce/html
