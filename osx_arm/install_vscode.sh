set -ex

pushd /tmp
rm -f vscode.zip
curl -L 'https://code.visualstudio.com/sha/download?build=stable&os=darwin-arm64' -o vscode.zip

rm -rf Visual\ Studio\ Code.app
rm -rf /Applications/Visual\ Studio\ Code.app

unzip vscode.zip

rsync -rav Visual\ Studio\ Code.app/ /Applications/Visual\ Studio\ Code.app/



popd

cat << EOF >> ~/.bash_profile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF
