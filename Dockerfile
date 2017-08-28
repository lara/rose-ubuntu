FROM ubuntu

ADD ./parts/1-deps.sh ./1-deps.sh
RUN chmod +x ./1-deps.sh
RUN ./1-deps.sh

ADD ./parts/2-boost.sh ./2-boost.sh
RUN chmod +x ./2-boost.sh
RUN ./2-boost.sh

RUN apt-get install unzip

ADD ./parts/3-zgrviewer.sh ./3-zgrviewer.sh
RUN chmod +x ./3-zgrviewer.sh
RUN ./3-zgrviewer.sh

ADD ./parts/4-dlib.sh ./4-dlib.sh
RUN chmod +x ./4-dlib.sh
RUN ./4-dlib.sh

ADD ./parts/5-bash.sh ./5-bash.sh
RUN chmod +x ./5-bash.sh
RUN ./5-bash.sh

ADD ./parts/6-rose-clone.sh ./6-rose-clone.sh
RUN chmod +x ./6-rose-clone.sh
RUN ./6-rose-clone.sh

RUN apt-get install -y ghostscript

ADD ./parts/7-rose-build.sh ./7-rose-build.sh
RUN chmod +x ./7-rose-build.sh
RUN ./7-rose-build.sh

# RUN rm ./1-deps.sh
# RUN rm ./2-boost.sh
# RUN rm ./3-zgrviewer.sh
# RUN rm ./4-dlib.sh
# RUN rm ./5-bash.sh
# RUN rm ./6-rose-clone.sh
# RUN rm ./7-rose-build.sh
