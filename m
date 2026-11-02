Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638232;
	b=wr7XdkrMPn1705eDT2gB13sPxKzj3iSUvjNy8LFoOOVEgeGscgIOwwRIVPD8vjEvPLrP
	 YSTA7+f7JHcjrEJ3xFb8vt76eEEWAsE/STy/fex+ssDmewS52T/lzuFgpACyP8x0kkQk4
	 1cJ94vpzQ9BhwvueOQNnD5OU1ygCbYv2sZ5tSHB1PyqyjxhQQs7lFJywKkyWgL/WS97Sq
	 PXGYEsrvWJAClXAfHrvwYkbh46Dj9o1M2aE5ktte1VokJFzizip9IYkWJUc3Sql5NIsqQ
	 ghEZxCXEcVpLcBd7raEp4zAFePERi8ztBLMd/HG5XwKGN73KmP/NwHmHl0gbrrg61+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=K8BYvSAD0vaRsrXFQzKVgQ9ORTXgw762XXjLlecX85Y=;
	b=TmZK5FM+JsWimc8i7uhbzh0XGYqbh/er0mXHQUI+IOmgmprAvfmXSqwg4qN33bWda2K5
	 TIz+1IokdnSVNX4JHFavt/po6RwEGK91NsOk9dBaUazxgyU2n/niWWTwbVS5Kdjl/ZjhQ
	 3M/GEJha4Dsvn8eEljdVrPGfxQVcuaHYinKsimOc8HXM2fVuOzo4TkCzePdll9/9igIu9
	 k8QqlR/Xj7hNwG1XfXYez2Kix/6KHKhb/XqSxQRcNEkdQiXidVGC4ano9TyNAseuC21e1
	 CwjJSpj7ge/9EP2AGasl0A830IBI2sX1N3foTMZR6fzhDxCUM423icnizBKE6hRsgjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=olnXWzoH;
	arc=none smtp.remote-ip=74.125.231.137
Received: from mail-oo2-f9.google.com (mail-oo2-f9.google.com [74.125.231.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E7A607466C
	for <mfd@lists.linux.dev>; Mon,  2 Nov 2026 16:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1E7A607466C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=olnXWzoH
Received: by mail-oo2-f9.google.com with SMTP id 46e09a7af769-821a4a69647so258985a34.0
        for <mfd@lists.linux.dev>; Mon, 02 Nov 2026 08:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638231; x=1794243031; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K8BYvSAD0vaRsrXFQzKVgQ9ORTXgw762XXjLlecX85Y=;
        b=olnXWzoHkug1ARF3wcr4rqyS6qmNUk/S1sH0xw32Hn/h4nfwh3IHH3MvffbNekDc2D
         FN/6D9GNbVCW13y2qMGf7b+JP53TlMe8ORxwqQ8ldx07iGLQgu2hq0tabZ+LRkQU+Cgq
         xxnPYLR0pibHLTARJ9BsOBkwiIM+b/JaJyjYc9bV/bfSVPRzcheMuCE7d9eZjibCCCEv
         FJ7gjOA5QvQHYCE/EO51JhsxZUQM3EM1uQftzRtD4LWCVPjYfPtM0+wd7o+YAspLSP0g
         W9e2ITFyzEGT7SAyxLq2EJ6+qBas23UsRPrLiQljnyHtfu0dXJrN8NENU5g8shgWG7ZS
         d8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638231; x=1794243031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8BYvSAD0vaRsrXFQzKVgQ9ORTXgw762XXjLlecX85Y=;
        b=CP3j/F0bUEoOTnwLv/GkYCEZyiyHr0t3RKCDX5Qh8KfFQY3/tyFW3SjQPjPLiSooJN
         d7F1K1C2Z5t5WZkPn2x1YcG0oCCSk5GpKkGG7wwqO8qpJbS/nJmbVQstBT1aW9osP501
         PPWiXDfJvs8MdEk9gFkH9+0pwfEBO8DupKpSY4Fx31zXMlaaD6f6lwBZ6pGtzM2hdSkb
         epuTnQZfoOEablOwVHRKN6XHRL084FdFpwft3xC/oN/q9HmovBx6sxfKRIjHbHEXwh3h
         gdef313qgEsrc+JX5zkaxdNhqyaK8IwxxUS+wSW7eW/JOnAVDNDpFru5auA1JAOSlZ+/
         E8AA==
X-Forwarded-Encrypted: i=1; AKwUvBygjVkJMz1k/3GBmqMEoL/LZ+xYwaLudZ3hiMVcw8hkTgxRp2ZvFKGbEEthKQlWkPu57wE=@lists.linux.dev
X-Gm-Message-State: AFq9FYIhFmcElGIiHtiDiXPZobmdUZhCuTHUY0QkDvgeEs/NnzxY3FGt
	JMEHAL8MaSl1BSEI0MHpnzMxJ9m5q9vNykMGnvAmw7if0/MC2k69+aAR
X-Gm-Gg: AYBFou3LYptubOpvpbhghc+AGF5XDdg6VREYsfZcG02diETkk2SrfYSWn6PxLwiWO6j
	RNwLqt0DqauLrqu9U4QX8tf/tGk/jM5yI4qm7yGjZbA++b0xk61/AkVtf43KLHmIwU19dph0waM
	HAPnGqrHUC7shJUKApGIYbFWkwF0h3/3iEAvsFAjp4XQaKx5UmZQ1eLUARNCf4yI02qwwDG2Dfc
	O0SxsBQtvKiQd2+/1JYlIGH+JYZc1W+JaFxBKgKce9uc33zb/aZlf/N4XZnSobX1sxXrBBXAMZ5
	Thyuugsg3aADCO+ZGatuHS86rVYZnZzluEgBVJd5RC/qZqDWqVVWh4DrJdnT/T5lTb5ZqoISHnU
	E4EJQmfpbhCQuds3KrYvbGSRkq3BHzQdg0iQsVlK8nDJZIj7XAw0YhssP4BHker1NDl9j/bxaC8
	fld5rlrwKn3H48AFMMGl0DygxvjX0Q0gttRRjcXpZn1F/js86eQtwwAT1wSoojXaM/DuABd0iNy
	jQhs4xuTazi0ekegYwoxSv3z5WKYhZs0UZqO/mKHQgOU464j+ixpEOblER0+eqOJMmmXt8Vwkpb
	8CNLshB59cSMCQPGwZ9ls6a15st2sRHeScJM3/mKjdum+2wm6gMNN1MfXQBGSUWMn1DCrV/VSJO
	HajaJepYgU/y22OgqTBI=
X-Received: by 2002:a05:6830:3481:b0:844:a8bf:7dc7 with SMTP id 46e09a7af769-85d363fc570mr7336192a34.17.1793638230796;
        Mon, 02 Nov 2026 08:50:30 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985cdsm9936779a34.10.2026.11.02.08.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:50:30 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 02 Nov 2026 10:50:22 -0600
Subject: [PATCH v2 2/2] rtc: mt6397: provide the 32 kHz output as a clock
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-2-19ca72815374@gmail.com>
References: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
In-Reply-To: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793638226; l=4890;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=amIz4+OO8bg9BY0ErwfxlJTjkYD75qjrKdIIoLGCs4c=;
 b=SddfdcmGKWyuqGOE2/GxaWQqOQ1TXoTGs5VUhTToGfp3bnPWl7+Zrz5vLWEeXxPdlsr4dE61r
 fAJ9r7/SePRCBSg2vB3thim3kLRhLfoupjQ/1z8Xsr6XCNPG6w8yuKc
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The RTC's 32 kHz output is gated by RTC_CON.F32KOB, which the vendor
kernel clears before it powers the Wi-Fi/Bluetooth combo chip. Mainline
never touches it, so on a board whose bootloader leaves it set, such a
chip has no sleep clock and does not come up.

Register the output as a clock when the RTC node has #clock-cells, so
the chip's power sequence can enable it.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/rtc/rtc-mt6397.c       | 85 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/mt6397/rtc.h |  6 +++
 2 files changed, 91 insertions(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index d6e156516aa6..2849beddc79d 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -6,6 +6,7 @@
 
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/mt6397/core.h>
@@ -317,6 +318,84 @@ static int mtk_rtc_nvram_write(void *priv, unsigned int offset, void *val,
 	return ret;
 }
 
+#ifdef CONFIG_COMMON_CLK
+static int mtk_rtc_clkout_set(struct clk_hw *hw, bool on)
+{
+	struct mt6397_rtc *rtc = container_of(hw, struct mt6397_rtc, clkout);
+	int ret;
+
+	mutex_lock(&rtc->lock);
+	ret = regmap_update_bits(rtc->regmap, rtc->addr_base + rtc->data->con,
+				 RTC_CON_F32KOB, on ? 0 : RTC_CON_F32KOB);
+	if (!ret)
+		ret = mtk_rtc_write_trigger(rtc);
+	mutex_unlock(&rtc->lock);
+
+	return ret;
+}
+
+static int mtk_rtc_clkout_prepare(struct clk_hw *hw)
+{
+	return mtk_rtc_clkout_set(hw, true);
+}
+
+static void mtk_rtc_clkout_unprepare(struct clk_hw *hw)
+{
+	mtk_rtc_clkout_set(hw, false);
+}
+
+static int mtk_rtc_clkout_is_prepared(struct clk_hw *hw)
+{
+	struct mt6397_rtc *rtc = container_of(hw, struct mt6397_rtc, clkout);
+	u32 con;
+
+	if (regmap_read(rtc->regmap, rtc->addr_base + rtc->data->con, &con))
+		return 0;
+
+	return !(con & RTC_CON_F32KOB);
+}
+
+static unsigned long mtk_rtc_clkout_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	return 32768;
+}
+
+static const struct clk_ops mtk_rtc_clkout_ops = {
+	.prepare = mtk_rtc_clkout_prepare,
+	.unprepare = mtk_rtc_clkout_unprepare,
+	.is_prepared = mtk_rtc_clkout_is_prepared,
+	.recalc_rate = mtk_rtc_clkout_recalc_rate,
+};
+
+/* The 32 kHz output the PMIC drives to other chips, such as a combo chip */
+static int mtk_rtc_register_clkout(struct device *dev, struct mt6397_rtc *rtc)
+{
+	struct clk_init_data init = {
+		.name = "mt6397-rtc-32k",
+		.ops = &mtk_rtc_clkout_ops,
+	};
+	int ret;
+
+	if (!of_property_present(dev->of_node, "#clock-cells") || !rtc->data->con)
+		return 0;
+
+	rtc->clkout.init = &init;
+
+	ret = devm_clk_hw_register(dev, &rtc->clkout);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					   &rtc->clkout);
+}
+#else
+static int mtk_rtc_register_clkout(struct device *dev, struct mt6397_rtc *rtc)
+{
+	return 0;
+}
+#endif
+
 static int mtk_rtc_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -380,6 +459,11 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = mtk_rtc_register_clkout(&pdev->dev, rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register the 32k clock\n");
+
 	nvmem_cfg.priv = rtc;
 
 	return devm_rtc_nvmem_register(rtc->rtc_dev, &nvmem_cfg);
@@ -416,6 +500,7 @@ static const struct mtk_rtc_data mt6358_rtc_data = {
 
 static const struct mtk_rtc_data mt6397_rtc_data = {
 	.wrtgr = RTC_WRTGR_MT6397,
+	.con = RTC_CON_MT6397,
 };
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index f4da579ec638..a8130d726c59 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -9,6 +9,7 @@
 #ifndef _LINUX_MFD_MT6397_RTC_H_
 #define _LINUX_MFD_MT6397_RTC_H_
 
+#include <linux/clk-provider.h>
 #include <linux/jiffies.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
@@ -22,6 +23,9 @@
 #define RTC_WRTGR_MT6397       0x003c
 #define RTC_WRTGR_MT6323       RTC_WRTGR_MT6397
 
+#define RTC_CON_MT6397         0x003e
+#define RTC_CON_F32KOB         BIT(5)
+
 #define RTC_IRQ_STA            0x0002
 #define RTC_IRQ_STA_AL         BIT(0)
 #define RTC_IRQ_STA_LP         BIT(3)
@@ -72,6 +76,7 @@
 
 struct mtk_rtc_data {
 	u32                     wrtgr;
+	u32                     con;
 };
 
 struct mt6397_rtc {
@@ -83,6 +88,7 @@ struct mt6397_rtc {
 	int                     irq;
 	u32                     addr_base;
 	const struct mtk_rtc_data *data;
+	struct clk_hw           clkout;
 };
 
 #endif /* _LINUX_MFD_MT6397_RTC_H_ */

-- 
2.55.0

