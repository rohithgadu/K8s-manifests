FROM openjdk:19
ADD build/libs/*.jar taskdockerimage.jar
EXPOSE 8090
RUN bash -c 'touch /taskdockerimage.jar'
ENTRYPOINT ["java","-jar","taskdockerimage.jar"]