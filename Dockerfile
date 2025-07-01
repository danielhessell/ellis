FROM python:3.13.4-alpine3.22

# Definir o diretório de trabalho
WORKDIR /app

# Copiar o arquivo de dependências primeiro para aproveitar o cache do Docker
COPY requirements.txt .

# Instalar as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o restante do código da aplicação
COPY . .

# Expor a porta em que a aplicação será executada
EXPOSE 8000

# Comando para iniciar a aplicação com Uvicorn
# Usamos --host 0.0.0.0 para que a aplicação seja acessível de fora do contêiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
