# TODO: some env variable to choose whether to run full verification suite
# or the subset that doesn't require Tabby
LICENSE_PATH = INSERT_PATH_TO_TABBY_LICENSE_HERE

all: clean build verify

clean:
	rm -rf target/
	rm -rf arbitration/
	rm -rf nclic/

build: clean
	veryl build

verify: verify_arb

verify_arb: build
	YOSYSHQ_LICENSE=$LICENSE_PATH sby arbitration.sby

verify_nclic: build
	YOSYSHQ_LICENSE=$LICENSE_PATH sby nclic.sby