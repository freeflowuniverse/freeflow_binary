set -ex

pushd /tmp
rm -f planetnet.dmg
curl -L  https://github.com/threefoldtech/Planetary-Network/releases/download/v0.2RC3/ThreeFoldPlanetaryNetwork-v0.2-RC3-x64-macOS.dmg -o planetnet.dmg

mkdir -p /tmp/planetnet
hdiutil attach planetnet.dmg -mountroot /tmp/planetnet

mkdir -p /Applications/ThreeFold\ Planetary\ Network.app
rsync -rav planetnet/darwin/ThreeFold\ Planetary\ Network.app /Applications/ThreeFold\ Planetary\ Network.app

hdiutil detach  /private/tmp/planetnet/darwin

popd

open /Applications/ThreeFold\ Planetary\ Network.app

echo "PLANETARY NETWORK INSTALLED"