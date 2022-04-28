FROM python

WORKDIR /docs
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python -m sphinx source/suite build/suite/html
RUN python -m sphinx source/carbonio build/carbonio/html
RUN python -m sphinx source/carbonio-ce build/carbonio-ce/html
