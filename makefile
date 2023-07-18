compose := "docker-compose.yaml"

start: 
	docker-compose -f ${compose} build
	docker-compose -f ${compose} up -d

init:
	docker exec -it notebook bash
	clear
	echo "Welcome to container"


prepare:
	python3 init-docker.py
	python3 notebook/prepare_dataset.py
	clear

process:
	mallet/mallet-2.0.8/bin/mallet import-dir --input ./output/so_data/ --output ./output/so.mallet --keep-sequence --remove-stopwords --extra-stopwords extra_stop_words/so.txt
	mallet/mallet-2.0.8/bin/mallet train-topics --random-seed 100 --input ./output/so.mallet --num-topics 15 --optimize-interval 20 --output-state ./output/so-topic-state.gz --output-topic-keys ./output/so_keys.txt --output-doc-topics ./output/so_composition.txt --diagnostics-file ./output/so_results/so_diagnostics.xml
	clear

results:
	python3 notebook/manage_results.py
	clear

test:
	docker exec notebook pytest tests/unit/ -vv 