ARG arch=amd64
FROM --platform=linux/${arch} ubuntu:latest
WORKDIR /MyProjects
# Install dependancies
RUN apt update
RUN apt upgrade -y
RUN apt install -y curl
RUN apt install -y python3-full
RUN apt install -y python3-pip
RUN apt install -y python3-pytest
RUN apt install -y nodejs
RUN apt install -y npm
RUN npm install @playwright/test
RUN npx playwright install --with-deps
# RUN npx -y playwright@1.52.0 install --with-deps
# CMD ["python3", "-m", "venv", "venvPyTest", "&&", "source", "venvPyTest/bin/activate"]
# RUN mkdir -p MyProjects
# RUN python3 -m venv venvPyTest
# RUN . venvPyTest/bin/activate
# RUN pip3 install pytest-playwright
# CMD ["pip", "install", "pytest-playwright"]
# Run playwright tests
# CMD ["npx", "playwright", "test", "--reporter=list"]
# docker run -it --name cntMyDevEnv --volume volumeMyProjects:/MyProjects --privileged img-my-dev-env /bin/bash 
