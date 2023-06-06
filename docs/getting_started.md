# Getting started with using the MSR2021Replication

## Install Mallet

To install the Mallet tool, first is necessary to have the Apache ant build tool installed. Install the binary from [https://ant.apache.org/](https://ant.apache.org/) and follow the [manual instructions](https://ant.apache.org/manual/install.html#getBinary) to configure it.

With ant installed and configured, open the Mallet 2.0.8 folder in the MSR2021Replication repository at `mallet/mallet-2.0.8` and run the following command:

```sh
$ ant
```

The Mallet tool will be available to use at `mallet/mallet-2.0.8/bin/mallet`.

## Run with jupyter notebook

The jupyter notebook can be used for StackOverflow datasets. To run the jupyter notebook run the following command on the repository root.

```sh
$ jupyter-notebook SO_dataset_analysis.ipynb
```

Follow the notebook instructions to import the correct dataset and run the scripts.

## Run with bash

### Install python libraries

Run the following command to install the libraries in the scripts:

```sh
$ pip install -r notebook/requirements.txt
```

Open a Python3 console with the command:

```sh
$ python3
```

Inside the console download the nltk packages by running the following code:
```py
import nltk

nltk.download('punkt')
nltk.download('stopwords')
nltk.download('word_tokenize')
nltk.download('tokenize')
nltk.download('stem')
```
### Export the variables

Use the following commands to export the variables so scripts can use the correct path to the dataset and output folder.

```sh
# Export path to the raw dataset
$ export DATASET_PATH=./questions_dataset/so_questions.csv

# Export the output path
$ export OUTPUT_PATH=./output

# Export the number of topics division
$ export TOPICS_NUM=15
```
### Prepare dataset

To run the MSR2021Replication, it is necessary to run the following script to parse the `.csv` dataset, clean it and create documents to be used by the mallet tool.

```sh
$ python3 prepare_dataset.py
```
### Run the Mallet tool

Run mallet instructions:

```sh
$ mallet/mallet-2.0.8/bin/mallet import-dir --input $OUTPUT_PATH/so_data/ --output $OUTPUT_PATH/so.mallet --keep-sequence --remove-stopwords --extra-stopwords extra_stopwords/so.txt
```

```sh
$ mallet/mallet-2.0.8/bin/mallet train-topics --random-seed 100 --input $OUTPUT_PATH/so.mallet --num-topics 15 --optimize-interval 20 --output-state $OUTPUT_PATH/so-topic-state.gz --output-topic-keys $OUTPUT_PATH/so_keys.txt --output-doc-topics $OUTPUT_PATH/so_composition.txt --diagnostics-file $OUTPUT_PATH/so_results/so_diagnostics.xml

```

### Parse mallet results

After running the mallet tool, run the following script.

```sh
$ python3 manage_results.py
```

This script will create document files for each topic containg all the questions related to this topic.

## Run with docker


### Run container dokcer

Run the docker container

``` make start ```

### Install dependeces and exec docker

To install the dependencies and enter the container

``` make init ```

### Prepare data

Prepare data

``` make prepare ```

### Process data

Process the data with mallet

``` make process ```

Process the results

### Results

``` make results ```