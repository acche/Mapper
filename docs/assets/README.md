# 赞助二维码图片替换说明

若要将网页上的赞助二维码替换为您自己的真实微信/支付宝收款码：

1. **微信支付**：
   - 将您的微信赞助/收款码图片重命名为 `wechat-pay.png`（建议正方形，如 600x600 像素）。
   - 放置在本目录 `docs/assets/wechat-pay.png`。

2. **支付宝**：
   - 将您的支付宝收款码图片重命名为 `alipay.png`（建议正方形，如 600x600 像素）。
   - 放置在本目录 `docs/assets/alipay.png`。

3. **提交与推送**：
   - 运行 `git add docs/assets/ && git commit -m "docs: update donation qr codes" && git push`
   - GitHub Pages 将自动重新部署并展示真实收款码。
