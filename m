Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854801;
	b=1sZOxwcsUzVWwyHsW55/WiZ0V2jlDp8AB2Um+MdtK2iuHIueolWd2Qf4egUE+3/5lGPM
	 ZBYrheulBvmoIV2JWNudJtpT4uYwl9avJr0FWB6+A0dbX2NljAGn4v0llCHSMvD/HJ5TZ
	 AsHKE98bWE3w2/LfMlhzdaz22q3BAsGPtBoBZciMKsFAoxcpLn8Y0x27pJ7HjOdHjas7p
	 0P0RmkYuxvTJhVUFOKa32daz2d4XirNnSmDPNqqD/t5sN0PeqJ0EK5fPZW+h0hXjzCmHG
	 2RUMN9zwtTUh5q2bikYdQHxDYS205rWaa3Ypdye4zcGrnJ4Pu98p/SKuej03A37gpDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tFzDEYw+EnooXYdZM/QgeJxwD9oyUj/5EK6tkUOx56g=;
	b=ZxqrK8zJCYcHhz8K4YBC1VvT92bAQeZCjjXwwqyjMXYcm/jFBjN8QIC4fy8PkPlV+SrK
	 wGgz0csKAYsmm+KS/oMwIhxr+saNK7Xm1jfeagGzxC+7I+RG79N3LwpAGixG2oabvhcwc
	 czbf/e94MRkaYKeZbYxaryQnL9ZWhrypEF04sWxSffLe8pR0PNfjgo30LBwRkUMsLQEo5
	 5/U/e/pCaKGdQtWnCPAP3yXMfUXQvqeibggnsLhkhE+xuV8T7NAWrr2QbizlpmdpRTd4m
	 L5JJty8bxD8YdP1w+SJ2q6nZndS2C3seiSjf9BdsSEOL/XAzxTphbccx8DxI4/2t7+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Q1Ct/5ud";
	arc=none smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B795606A330
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 18:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B795606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q1Ct/5ud
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-51cddc2451aso1328848b6e.0
        for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 10:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854800; x=1795459600; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFzDEYw+EnooXYdZM/QgeJxwD9oyUj/5EK6tkUOx56g=;
        b=Q1Ct/5udPwF7jQ5l1A2bS0zfhpAa1ksZYNb9mLciiOiPYnpbmSll3Rhqu4tbxM2OcL
         B9k6WoSfsx0QHZwd1pFR+4B+83H/JwmKzKrKyAwsWZ2E7kvKVfY4GwsMleL5xORFyJ2i
         4PL8+IfIaBsi/KS56vB/Bsccv1spJuziAs/qELzQ0Br9s9TwNLwzh9N/UqTc5YqCJ5b1
         zHWNIhcCMu0mJqrsfBcm04lKfY0UBE6X/13UJcDmArL3m56znS59KCbhh2yBHMZLUxzY
         JIBPBMmWpsUMlLU9PbRZLEqr08oAQDLDnrlh5z4mIHHCw+9PEia+BaL6+QDjSpqo1GtE
         tLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854800; x=1795459600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tFzDEYw+EnooXYdZM/QgeJxwD9oyUj/5EK6tkUOx56g=;
        b=CqZCntDZmeXe9NZWjWuE9ogGux0jWHqCM95GGWmb2Ru3WNzULs0XzHuZNup3pdlVAD
         M2xN4EBwBal1vqOfdS0PPqIkVwaW+cYhpfTV80JRP1ZoVHleoIWITufJZWfFd4tpjtsT
         hkug4RT7bnFH6i227NC+16qFkE+fjcugdAdZLo6fGY0tvvffjiUhE0gLHEPBE0pmbzHC
         Wh3b3rqz8RU/AUiwz+yzkmoijd6f5vaZaIHOgSLjD18J+CipUKZYSU/AexgdZWyYJSKB
         cij1Oz78dUBH3bd7NSTnFp3dfS5ZsImjiFmaOJarpAhptUts5HvH1eHziAQqs5cMIOgc
         8Vgw==
X-Forwarded-Encrypted: i=1; AL+hErGCgj811s6bnsGSUd/VEL1Gn6GESo6Agz78YlB+e9zDUn7I6g2s29UPB43p/PkKmIa1QFk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+MeUCyumvj4weQL3DeQPdbk06yPz9ATlMKkYRpaJmmHBeicjFl
	y8khfRU+zQTeMKJUuKIxx77HlT2H6u/DeDM3+/3/oxzEXybjRCqWCSzq
X-Gm-Gg: AYBFou1XbUpf8R4ofE/YiS4xyAcqRuglmn5pHq+OlzqAHWj92+oR1RT+xLkCJpbJN1E
	2g4UPmX9XbsABRN1ybdK2GX9zo5bYctLvhQXa+HBdzWO1pDPXA7fA6dqjfMxCIwf6C+uEMgEk1R
	mI4sABptILbV0YM/t1Fn3baHn8cHaui49nMRcA/gpNEWBMB6DQ+Qaz2iSwLZ3kpQzskW8Eo7c09
	j1y6ilie5dnH13ep2AhlV1kwcPHhg0NHGSGfCOJDc4XRL8E3eCA+dLNQr53YhrI1QHqyxk1e+jj
	O8mfPF1zp8YtiSyb1MvrwhpBVsjcUGYPBL+XYAP4PsBzew37YEilHiaqeP/ED3UdIFlCN02SBLt
	ZwWTfiQECAFIjjK1TcwtyL+r1hyovVQn17LmWrcnVJTtlfZRMCg7DG56oS5iAbnVulHxuyM9eYO
	a/uegAxWkV6aH/lsRBbxTnVqhXWho4GPiErGyQ0MdzMNpniamvmkdT6oBTJwzNC4Oo88UUwrPyf
	BxP8dgDPIn5iruXWAq/JndzurrR+yC3HDhK7MacNzkW4hu2Dq0ud8n30FJuARObZPW/y/kn9ZB3
	nJhKHWXPG6qQ5g606PCOnDlSBoDyw31Zzk7kJVfznDKS8+HMn6H/HPJL0Au4UwroetddJeiDxus
	TltqezH6i8aUGw3MjU6U=
X-Received: by 2002:a05:6808:4fd2:b0:4df:5cd0:89c1 with SMTP id 5614622812f47-56e63ba5727mr9976924b6e.23.1794854800435;
        Mon, 16 Nov 2026 10:46:40 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe242b670sm7210735fac.17.2026.11.16.10.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:46:39 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 16 Nov 2026 12:46:33 -0600
Subject: [PATCH v3 1/2] rtc: mt6397: rename the write trigger register
 offset
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
Message-Id: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-1-179145eb7e89@gmail.com>
References: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
In-Reply-To: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794854794; l=1817;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=df32cdCXYqRXb7AgGz4g+i9owLPH2NyaDIX+9W0kTJ8=;
 b=YXj0OOXR/Ek7mAgVNZ2ePkshYGmwdQh66wpXgUVRUARhBWhlo4xL7c+hw4g+ulZz6PAARMwLB
 rVWKea1gZoeASnjj2zRQPwTaWnyl9lPPgcWMM+sqyHTCH5hZTlMhQwv
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

struct mtk_rtc_data holds the offset of the register that commits RTC
writes, in a member called wrtgr after the register's datasheet name.
Call it write_trigger_reg, so that the next member, the control
register's offset, can be named the same way.

No functional change.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/rtc/rtc-mt6397.c       | 7 ++++---
 include/linux/mfd/mt6397/rtc.h | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index ab402f9f85c3..5afdb707a5b5 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -22,7 +22,8 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
 	int ret;
 	u32 data;
 
-	ret = regmap_write(rtc->regmap, rtc->addr_base + rtc->data->wrtgr, 1);
+	ret = regmap_write(rtc->regmap,
+			   rtc->addr_base + rtc->data->write_trigger_reg, 1);
 	if (ret < 0)
 		return ret;
 
@@ -411,11 +412,11 @@ static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_rtc_suspend,
 			mt6397_rtc_resume);
 
 static const struct mtk_rtc_data mt6358_rtc_data = {
-	.wrtgr = RTC_WRTGR_MT6358,
+	.write_trigger_reg = RTC_WRTGR_MT6358,
 };
 
 static const struct mtk_rtc_data mt6397_rtc_data = {
-	.wrtgr = RTC_WRTGR_MT6397,
+	.write_trigger_reg = RTC_WRTGR_MT6397,
 };
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index f4da579ec638..44d2b2cb1ff7 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -71,7 +71,7 @@
 #define MTK_RTC_POLL_TIMEOUT   (jiffies_to_usecs(HZ))
 
 struct mtk_rtc_data {
-	u32                     wrtgr;
+	u32                     write_trigger_reg;
 };
 
 struct mt6397_rtc {

-- 
2.56.0

