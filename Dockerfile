# Production image for the Accounts microservice
FROM python:3.9-slim

# Create working folder and install dependencies
WORKDIR /app
COPY requirements.txt .
RUN python -m pip install --upgrade pip wheel && \
    pip install --no-cache-dir -r requirements.txt

# Copy only the application source
COPY service/ ./service/

# Run as a non-root user
RUN useradd --uid 1000 --create-home theia && chown -R theia /app
USER theia

# Expose the port and start the app with gunicorn
EXPOSE 8080
CMD ["gunicorn", "--bind=0.0.0.0:8080", "--log-level=info", "service:app"]
