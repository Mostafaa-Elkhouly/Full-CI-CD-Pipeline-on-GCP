FROM python:3-alpine

# Create app directory
WORKDIR /app

# Copy app source code
COPY . .

# Install app dependencies
RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["flask", "run","--host","0.0.0.0","--port","5000"]