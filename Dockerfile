FROM binux/pyspider
RUN pip install MySQL-python
VOLUME ["/opt/pyspider"]
ENTRYPOINT ["pyspider"]
EXPOSE 5000 23333 24444 25555


