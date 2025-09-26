#!/bin/bash
set -e

echo "仮想カメラの設定を削除しています..."

# v4l2loopbackモジュールをアンロード
sudo modprobe -r v4l2loopback || echo "v4l2loopbackモジュールはロードされていません。"

# 設定ファイルを削除
sudo rm -f /etc/modules-load.d/v4l2loopback.conf
sudo rm -f /etc/modprobe.d/v4l2loopback.conf

echo "クリーンアップが完了しました。"
echo "システムを再起動すると、変更が完全に適用されます。"
