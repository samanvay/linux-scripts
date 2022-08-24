#https://classic.yarnpkg.com/en/docs/cli/install

rm -rf `yarn cache dir`/npm-rules-config*

#missing node modules
yarn install --check-files

