FROM openstax/python3-base:latest as builder

# Create Virtualenv
RUN python -m venv /opt/venv && \
  . /opt/venv/bin/activate && \
  pip install --no-cache-dir -U 'pip' && \
  pip install playwright

ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

RUN mkdir /ms-playwright && \
    playwright install chromium --with-deps

FROM openstax/python3-base:latest as built

COPY --from=builder /ms-playwright /ms-playwright

ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright
