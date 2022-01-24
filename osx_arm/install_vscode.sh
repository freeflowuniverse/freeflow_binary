set -ex

pushd /tmp
rm -f vscode.zip
curl -L 'https://code.visualstudio.com/sha/download?build=stable&os=darwin-arm64' -o vscode.zip

rm -rf Visual\ Studio\ Code.app
rm -rf /Applications/Visual\ Studio\ Code.app

unzip vscode.zip

rsync -rav Visual\ Studio\ Code.app/ /Applications/Visual\ Studio\ Code.app/

rm -f vscode.zip
rm -rf Visual\ Studio\ Code.app


popd

#have to do this workaround on osx, can't do infile -i
sed '/Visual Studio/d' ~/.zprofile > /tmp/1 && mv /tmp/1 ~/.zprofile
# sed '/Visual Studio/d' ~/.bash_profile > /tmp/1 && mv /tmp/1 ~/.bash_profile

cat << EOF >> ~/.zprofile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

# cat << EOF >> ~/.bash_profile
# # Add Visual Studio Code (code)
# export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# EOF

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

code --install-extension yzhang.markdown-all-in-one
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension bpruitt-goddard.mermaid-markdown-syntax-highlighting
code --install-extension mushan.vscode-paste-image
code --install-extension vlanguage.vscode-vlang
code --install-extension ms-vscode-remote.remote-ssh


echo "VSCODE INSTALLED SUCCESFULLY"