entrypoint  := "src/main.ts"
deno_config := "src/deno.jsonc"

up:
	deno cache --unstable \
		--config={{ deno_config }} {{ entrypoint }}

build:
	deno compile --unstable --allow-all --output=dist/downpipe \
		--config={{ deno_config }} {{ entrypoint }}

run:
	deno run --unstable --allow-all --watch=src \
		--config={{ deno_config }} {{ entrypoint }}

alias dev := run

test:
	deno test --unstable --allow-all \
		--config={{ deno_config }}

clean:
	rm -rf dist
