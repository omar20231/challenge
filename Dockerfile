FROM python:3.8-slim AS build 
WORKDIR /app
COPY . . 
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libmariadb-dev \
    pkg-config
RUN pip install flask mysqlclient 

FROM python:3.8-slim 
WORKDIR /app
COPY --from=build /app /app
EXPOSE 5002
CMD ["python", "app.py"]
