Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268418;
	b=GdhilHeUZ0WgjRg2sGSm3KTrqmQxNk3gCHxLTXZD6teA8hJDTEE/XWi1BgfTSd0CGO+U
	 Ti6wefR06WMw5/BRuq4igoEO1ODnIG3hQxDcd/e15m+XVgH4yehX15cyv1jdFJIGqY8iK
	 6Ixca1UkjM+Nj/ak6PsvHpXHaKBRdQsVo0Mqc9PwUKV5/GyPGcmfLnU7RnlBt3cc0I4Se
	 0hRSEIksHfqlxmnsoPl36Qpom3wNRluNYzfEhsQUwHwsEFpLGs83jUvumqXZytzM+DZkW
	 MWHbh/SMmoeq8fmUjfWlEe6FFC+6f0gFsCDiwwUugLDbBJfrd7W9MSGkN8BLvJHvuVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2m6sqEdIShmvg7ASfXjbhI99Pw56OM60znpq44ByAfs=;
	b=Ber+gkUQmJ7MQEzqzgmg2s2Q3ekvwXWq5NLzjAGAEdgx7e0VafKlavpPIR2X/ZhfGFa5
	 9Oxv2xoAQZUdeIA9yIoPw+o+Hh4Ftth5V33o85GzmeN3A92SuQeJv6Zn2MRSU8tgzjELQ
	 lSmljLJ1/KosdKXooPIzGxS+aLAdbNX937hkpQHvB8OlkxPWmpHmwbftuH2EmruMy2TsX
	 pknmwKDOXRyCEfpxBtN9KVw7MGC+G7sbg8U/ra0oBjdkkJcjpyVaToe6qaESgzU7B77cc
	 dbAb2D6lrVI5AKBfMOhECjqbEli2HRvv64l4w7x6LFbI8UPB3mZ3JF7jmGWcC9/5Nrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rM9Q3u46;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0193606A339
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 10:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0193606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rM9Q3u46
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d05d51553so13249215e9.2
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 03:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268411; x=1793873211; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2m6sqEdIShmvg7ASfXjbhI99Pw56OM60znpq44ByAfs=;
        b=rM9Q3u46t95sts7XQGBzq8ighT0q5fiDygzXK9IB1k65m6olJZ3iF16xNcJsUwnF3C
         dKUw0Y02PYSu3hnCFuFv7UdDAzFN8/eiI0VTeviOEoGR97g8znVrr3vtFVtbk5ZsmNm/
         kUbKtfKvK9vwjR/zUWsIipsWwSKdyH5UGI6WrgKm2aou6I3jKOtZmFD3ZKR64UR/Y7iZ
         ecbYLY84HVLIbinin8hO11JDk3cT1n7L5w67ThsV4IG9E7E1aaoAQ/TdrDMPLZRZph/C
         8xLKkMUITICj8KfJG7wmpu2FsCeKjN3qFLjr2m0cBl4nXQhQ9vcfI6IaqPg+5wmKVpRF
         LC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268411; x=1793873211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2m6sqEdIShmvg7ASfXjbhI99Pw56OM60znpq44ByAfs=;
        b=Qk0cpExeOZcVPeyoj/ro7qmaIDzYjL0oleTuG2+tdW29SKIzthi1Vcijm+HbuXjscY
         vAPKn+4gWLzIAXR+FGcHg+a88W3V382xjSA216L3flrr0ojWYZWnDQRKM9VCr8Re/Be7
         Z4voB+lzdOXGd9hwNPPkWYoXcbJ2Pc33T3MRd+6GIVuDaibi5KNOqGizHmWiCUftfIb8
         OFzxNGjYvh79kQ0bY42LCEVquJy45QFFJteKKXHOFZ5bQokmTfioVymZvNtrlaCwIUBs
         nXmfr3T1j+rwTziQ/YhgtPE9YVBeh18oMCyajMONDooTQW+eFh5smIXSfPPKh3mMtfau
         USFw==
X-Forwarded-Encrypted: i=1; AKwUvBzTCAshBGb725kivRmIOAdIIiSHM+Wx9LgKoj0kQhYOu47DGEzCzn5g0u1mOoO58/MLa/8=@lists.linux.dev
X-Gm-Message-State: AFq9FYIrLJtoH6ofW7rT1LiZk8HnzRSk5OK1aaSkqVs3hbP/jvGGRNB1
	S9TRrgqUSTHNSM9nZ0uEDOs0fByIJzF10zznmTmOkVY+l+f9m9X0Z2rJ
X-Gm-Gg: AYBFou31VWm1q31NnacmZ2U6pCdmnFBNrjPdVXIRTQ9ZWunszH1jDKk0NsxIkzgUrur
	jup2S3t60BW+UzrbZuCwAKkE4Fzfif+34Y4Sx/hlfGBsN3h789QfHueH5b1jB0/LKa78u+rJz4Z
	o8J4PQGzhZMzF+k7au9vQ63AGmRVNvT3TIr/WkNtT19MjK+NN0Najzqb7mOpXD9Cqf+Kz2VHPnP
	BDYCsXgQkVG+Z6KYyu3EEJmCQfxwN7NNpq6O0NccSQ6I5hyTPI4BB0OFiVU5180T7mBugQ7FXUe
	CCXsfAXhRmzf4CjwR7stHrheD3hdBBwZqi0uXa9+tiKLbPusGd1VlW0n73fbnOvX5gKerBFF2B2
	W61bQHF1KW5NfcOGfEKJm+cRA1+ahIRJqjHA/tZ07YPWOrtF5H9gKij+2EOAzWSYjCW6MZnCWbX
	ip922VdYOaVSbXRrC1dVHmmO+YheTA7AC2FHnLcBvSSj0M/Z9c+6KhY+dBKBczG/M1fg4bi1qq7
	PcLAMnuAnJoPo5DunADhxRRNZQUuVEj/C7L3HjMxMd7AY9HzJ1QVn7AqxqfVSzgRyddggiV4F/G
	l0esohvvLPKvkIGnMnTv6tOqp9Fy75otCaULohSxTSQFVMNZ+FL88ekJs0VYhLcaAJ+/TMeiB79
	dmULeTXkQGQ==
X-Received: by 2002:a05:600c:848c:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a966490754mr125374865e9.8.1793268411167;
        Thu, 29 Oct 2026 03:06:51 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:50 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Thu, 29 Oct 2026 11:06:25 +0100
Subject: [PATCH 3/4] mfd: rk8xx-spi: add system sleep PM ops
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
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-3-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=1163;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=1zvikwnDADGbJGUr+2C96ExmTpaaJdX4ozWbby5F6T0=;
 b=TCcmm2uv0Oq0jbsQFif9J3wiQ6uFZZOT6azcU9/u4jfR7utKpgVScfiFRlrkXexfBrw4RHf/7
 9Bb1HPxhFwfA2EYYzIpbfsEiuGXaDUD7LUMrp23QF3huhIpCcXvZ3KQ
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

Unlike rk8xx-i2c, the SPI driver does not hook up rk8xx_suspend() and
rk8xx_resume(), so the RK806 never gets its system sleep handling, e.g.
keeping its interrupt disabled while the SPI controller is suspended.

Add the same PM ops as rk8xx-i2c.

Fixes: 210f418f8ace ("mfd: rk8xx: Add rk806 support")
---
 drivers/mfd/rk8xx-spi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/rk8xx-spi.c b/drivers/mfd/rk8xx-spi.c
index bb85fe60518f6..a0b7d7a058108 100644
--- a/drivers/mfd/rk8xx-spi.c
+++ b/drivers/mfd/rk8xx-spi.c
@@ -97,6 +97,8 @@ static int rk8xx_spi_probe(struct spi_device *spi)
 	return rk8xx_probe(&spi->dev, RK806_ID, spi->irq, regmap);
 }
 
+static DEFINE_SIMPLE_DEV_PM_OPS(rk8xx_spi_pm_ops, rk8xx_suspend, rk8xx_resume);
+
 static const struct of_device_id rk8xx_spi_of_match[] = {
 	{ .compatible = "rockchip,rk806", },
 	{ }
@@ -113,6 +115,7 @@ static struct spi_driver rk8xx_spi_driver = {
 	.driver		= {
 		.name	= "rk8xx-spi",
 		.of_match_table = rk8xx_spi_of_match,
+		.pm = pm_sleep_ptr(&rk8xx_spi_pm_ops),
 	},
 	.probe		= rk8xx_spi_probe,
 	.id_table	= rk8xx_spi_id_table,

-- 
2.47.3

