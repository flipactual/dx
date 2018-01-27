.PHONY: ci commitlint commitlint-cit commitmsg compile emdaer lint lint-staged preccomit prepublish test type

ci: commitlint-ci lint type test
commitmsg: commitlint
precommit: lint-staged type test emdaer
prepublish: compile

commitlint:
	./node_modules/.bin/commitlint -e ${GIT_PARAMS}
commitlint-ci:
	./node_modules/.bin/commitlint --from="${TRAVIS_BRANCH}" --to="${TRAVIS_COMMIT}"
	./node_modules/.bin/commitlint --from=${TRAVIS_COMMIT}
compile:
	./node_modules/.bin/babel src -d lib
emdaer:
	./node_modules/.bin/emdaer
	git add *.md
lint:
	./node_modules/.bin/eslint .
lint-staged:
	./node_modules/.bin/lint-staged
test:
	./node_modules/.bin/jest
type:
	./node_modules/.bin/flow status
