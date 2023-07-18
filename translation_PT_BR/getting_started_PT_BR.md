# Introdução ao uso do MSR2021Replication

## Instale o martelo

Para instalar a ferramenta Mallet, primeiro é necessário ter a ferramenta Apache ant build tool instalada. Instale o binário de [https://ant.apache.org/](https://ant.apache.org/) e siga as [instruções do manual](https://ant.apache.org/manual/install. html#getBinary) para configurá-lo.

Com o ant instalado e configurado, abra a pasta Mallet 2.0.8 no repositório MSR2021Replication em `mallet/mallet-2.0.8` e execute o seguinte comando:

```sh
$ ant
```

A ferramenta Mallet estará disponível para uso em `mallet/mallet-2.0.8/bin/mallet`.

## Execute com notebook jupyter

O notebook jupyter pode ser usado para conjuntos de dados StackOverflow. Para executar o jupyter notebook, execute o seguinte comando na raiz do repositório.

```sh
$ jupyter-notebook SO_dataset_analysis.ipynb
```

Siga as instruções do notebook para importar o conjunto de dados correto e executar os scripts.

## Executar com bash

### Instalar bibliotecas python

Execute o seguinte comando para instalar as bibliotecas nos scripts:

```sh
$ pip install -r notebook/requirements.txt
```

Abra um console Python3 com o comando:

```sh
$ python3
```

Dentro do console, baixe os pacotes nltk executando o seguinte código:
```py
import nltk

nltk.download('punkt')
nltk.download('palavras de parada')
nltk.download('word_tokenize')
nltk.download('tokenize')
nltk.download('tronco')
```
### Exportar as variáveis

Use os seguintes comandos para exportar as variáveis para que os scripts possam usar o caminho correto para o conjunto de dados e a pasta de saída.

```sh
# Caminho de exportação para o conjunto de dados brutos
$ export DATASET_PATH=./tcc/so_questions.csv

# Exporte o caminho de saída
$ export OUTPUT_PATH=./saída

# Exporta a divisão do número de tópicos
$ export TOPICS_NUM=15
```
### Preparar conjunto de dados

Para executar o MSR2021Replication, é necessário executar o seguinte script para analisar o conjunto de dados `.csv`, limpá-lo e criar documentos para serem usados pela ferramenta malho.

```sh
$ python3 prepare_dataset.py
```
### Execute a ferramenta Mallet

Execute as instruções do mallet:

```sh
$ mallet/mallet-2.0.8/bin/mallet import-dir --input $OUTPUT_PATH/so_data/ --output $OUTPUT_PATH/so.mallet --keep-sequence --remove-stopwords --extra-stopwords extra_stopwords/so .TXT
```

```sh
$ mallet/mallet-2.0.8/bin/mallet train-topics --random-seed 100 --input $OUTPUT_PATH/so.mallet --num-topics 15 --optimize-interval 20 --output-state $OUTPUT_PATH/ so-topic-state.gz --output-topic-keys $OUTPUT_PATH/so_keys.txt --output-doc-topics $OUTPUT_PATH/so_composition.txt --diagnostics-file $OUTPUT_PATH/so_results/so_diagnostics.xml

```

### Analisar os resultados do martelo

Depois de executar a ferramenta mallet, execute o seguinte script.

```sh
$ python3 manage_results.py
```

Este script criará arquivos de documentos para cada tópico contendo todas as questões relacionadas a este tópico.


## Executar com docker

### primeiros passos

- Baixe o docker e o docker compose

- Extraia o arquivo so_questions.csv.zip presente na pasta TCC

### iniciar contêiner docker

Execute o contêiner docker

``` make start ```

### Instalar dependências e exec docker

Para instalar as dependências e entrar no container

``` make init ```

### ↳ siga os próximos passos usando o bash aberto pelo comando make init:

### Preparar dados

Preparar dados

``` make prepare ```

### Processar dados

Processe os dados com o mallet

``` make process ```

### Resultados

Processe os resultados

```make results```