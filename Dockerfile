FROM node:16-alpine3.11

RUN apk add --no-cache python3 nodejs npm openjdk8
RUN mkdir /android 
COPY android /android

ENV ANDROID_HOME="/android"
ENV PATH="$PATH:$ANDROID_HOME/cmdline-tools/tools/bin"
ENV PATH="$PATH:$ANDROID_HOME/platform-tools"
ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk

RUN yes | sdkmanager --install "platform-tools"
RUN yes | sdkmanager --install "build-tools;31.0.0"
RUN yes | sdkmanager --install "cmake;3.10.2.4988404"
RUN yes | sdkmanager --install "platforms;android-10"
RUN yes | sdkmanager --install "ndk;20.1.5948944"
RUN yes | sdkmanager --install "build-tools;29.0.2"
CMD ["/bin/sh"]
