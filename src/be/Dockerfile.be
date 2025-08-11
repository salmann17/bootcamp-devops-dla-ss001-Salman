# ===== build stage =====
FROM python:3.12-alpine AS build
WORKDIR /wheels
RUN apk add --no-cache build-base
COPY src/be/requirements.txt .
RUN pip wheel --no-cache-dir -r requirements.txt

# ===== run stage =====
FROM python:3.12-alpine
WORKDIR /app
COPY --from=build /wheels /wheels
RUN pip install --no-cache-dir --no-index --find-links=/wheels -r /wheels/requirements.txt
COPY src/be/ .
EXPOSE 5000
CMD ["python","app.py"]
