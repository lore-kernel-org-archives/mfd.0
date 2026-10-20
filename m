Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517847;
	b=YpFgJrzlz//hX09evgIdU9N2vAWvpLdsxvWKh+DzXvE4U8HsdlIjadIlXe7U797kp3R+
	 JnUXruh/0zXd8N40f4UUBAJoUun+LWmaSRY3XwMupsLGipZnKdJBhGzZzmv9PpVmBdK1q
	 NmkHeV92kZQzg7OH6+hK0s9XQ4jLmJIr6j4MEB42GN0K6qoQMj2b9paCTJXmJSUX3d3i1
	 H9Exhr/yM1lFOi3hZHcCaqH6Bk+eYUtr+bEhoPctgszg01AIRhhmclZfHDjGwJvVRFLch
	 HIHlcQVggg5NM5ylgF2JLP2Ngtm8Mqa1lZf1LK4ra2fCObYzEUfV5HhP3dAmGIURpRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=khjjDBK0J2xOtnMH1muymGK2fwTqPXy0k/z60K/0+xY=;
	b=XKQa5dBb+NJJaAGJ2eMVV7XahiqvJAV051VP09zbHrsUK4eKRP5iJT0+y1Rsd2wYqmRh
	 6lY8p0a9KLNaVsaLLhEy7oz4/tjmnQYO+vgllSzAFwnorMZStuq7/14crM5VRro6ox7Zc
	 1btU5AQwSloRI3qIXCaWqQUp4zSKo4hjGCtOBY25MRv9m0mCSk9c1nmENaQ7zZbBBngJy
	 O5sPpAWR/v3APn4c2e6WTaN9wTy4d5sicp3ImRMRwxtDBO+m+FdxRciAQP1CwqR3vzSB6
	 xIx52qNjIGRejX4sme2yoyCJsTV8zOC8Y01ixjGEFoFXmycILGj55BN6p0CS6GgL3TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="rDl/TDqM";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2002F606A338
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 17:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2002F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rDl/TDqM
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so30398585e9.3
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 10:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517845; x=1793122645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khjjDBK0J2xOtnMH1muymGK2fwTqPXy0k/z60K/0+xY=;
        b=rDl/TDqMU9M/UpZ1pgkogOVn9R8pwtduVW5hzlwoRn3JzF8JgUOiQnwkCh4We0WvDe
         x46oYnSct8Ffv7U0EwfpP1nO4xv974BafE7v2sYw8ou1A7XnZR+UCXovVre0AR6njBHx
         yk3I/JkBbm4Pt11KZF1+C7zaMxoneZo+oHIVIkF6XutOFVBEjP/031C6HM2uSpUwqP9J
         rxiLBM5ALkYJX13RR9VeVIA/bCpN/ESeHrp7oPdwR4NicNvIBtRJHmuY8g/idI00mG8o
         0Vsteu/YLRE8UZGQDxRuIYvSy5bExNdnxiP0qdaFf7L7IvkjQevr7xhfGFEeEkRKs1N1
         R+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517845; x=1793122645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khjjDBK0J2xOtnMH1muymGK2fwTqPXy0k/z60K/0+xY=;
        b=z7Jl/BJgS/ejWsaRVNdxzuB501vzbW5YO1QoqE1PBxKz3Fq80n6hvE2oOymzlOpcVV
         PcL2haAV84kJ6tbuEdRbKIOF2mLkT71Wv4qplSjKox/n/DXR4ttexBwVNETzi7FochCK
         WZlR2tG0pJXm6LAAZxm4X8ETPIKs8p33Gi8qWK1BhTd6hi5eqKLu0iA4bcD2+lWdjehK
         K+m+slo+BuRBrVdHYVj3EQgQNb7ABTbV2NVOaH6YexdcMEV9X7aJo0CSKNGz1ieikLfd
         xhrSZ38IS6/JopWXM7Oz0xqKYc69LrbYIqNaSZUKvOHgzpKq21fhpQtU1q9Y8Ay2BGay
         ZERw==
X-Forwarded-Encrypted: i=1; AKwUvBwzAKRttLqchd4AyLFRkxvfKst40rEvd5IHTUFT3FRkuP6ZtLlkombaTmWbT0ZmaFQ1qGU=@lists.linux.dev
X-Gm-Message-State: AFq9FYK9gENJPHPIyXIfifMEXSS95uROqQZ6Pt8R8doMQJTurKgIN47T
	dl8GkF7UuP1azL3xElABJmMtgh5Pm/uvEmUqh3uT85QyvQc0Qy50kH7L
X-Gm-Gg: AYBFou28M1gTG/aoozli71jIRPbHOq8Wn9kyPu9qCdp2vVXigaVvA6Po85d4kvW1QFV
	cnxMr5vdJqfCCGh7aN/ccihpuh/1VxLssNlGPC55msHk8tSFenXxb0v46f88x1jvdJ74uGFK4eq
	4E2UUSSlnbmMNCwSCHSXqVf/MNwLCTp4UdCYW6oD7Om29K2p102mahj/Bh/tbi6I8zhHBQm1d19
	Bt7pN/hZfQ246P8OTtAjTozWzSFa70I7F5nsCOnhwNqTq78FkngapoNnPjF8wNqY340TFel5gCM
	Z16yQ99Z9fBawDjTwwok8jg5x9MGHrZ8kaOPaox75psHxKcgNrboPMjhrPeJ4dN1vXvXRSkOI6N
	Wck5WP122voX35Lh0Kx2D6TwMyCloj/6e8HZP05gAj4qTrQlkThis2tNYJnOOW/n+XkDD+Xh57Q
	K6oC5Cgdj2p/vD9dyAGTDeDca/0mJbziMFBeJN36LKZLkJma87rm5J8EAWVkLRZjbSEg==
X-Received: by 2002:a05:600c:34c2:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4a1d76039d7mr227410065e9.20.1792517845273;
        Tue, 20 Oct 2026 10:37:25 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:37:24 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH RESEND v10 4/9] mfd: mt6397: Use MFD_CELL_* to describe sub-devices
Date: Tue, 20 Oct 2026 19:33:25 +0200
Message-ID: <20261020173556.632798-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the MFD_CELL_* macros to describe sub-devices. No functional changes.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mfd/mt6397-core.c | 207 ++++++++++++--------------------------
 1 file changed, 67 insertions(+), 140 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 9ec951996588..3e08179002fa 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -124,165 +124,92 @@ static const struct resource mt6323_pwrc_resources[] = {
 };
 
 static const struct mfd_cell mt6323_devs[] = {
-	{
-		.name = "mt6323-auxadc",
-		.of_compatible = "mediatek,mt6323-auxadc",
-	}, {
-		.name = "mt6323-efuse",
-		.of_compatible = "mediatek,mt6323-efuse",
-	}, {
-		.name = "mt6323-rtc",
-		.num_resources = ARRAY_SIZE(mt6323_rtc_resources),
-		.resources = mt6323_rtc_resources,
-		.of_compatible = "mediatek,mt6323-rtc",
-	}, {
-		.name = "mt6323-regulator",
-		.of_compatible = "mediatek,mt6323-regulator"
-	}, {
-		.name = "mt6323-led",
-		.of_compatible = "mediatek,mt6323-led"
-	}, {
-		.name = "mt6323-keys",
-		.num_resources = ARRAY_SIZE(mt6323_keys_resources),
-		.resources = mt6323_keys_resources,
-		.of_compatible = "mediatek,mt6323-keys"
-	}, {
-		.name = "mt6323-pwrc",
-		.num_resources = ARRAY_SIZE(mt6323_pwrc_resources),
-		.resources = mt6323_pwrc_resources,
-		.of_compatible = "mediatek,mt6323-pwrc"
-	},
+	MFD_CELL_OF("mt6323-auxadc", NULL, NULL, 0, 0,
+		    "mediatek,mt6323-auxadc"),
+	MFD_CELL_OF("mt6323-efuse", NULL, NULL, 0, 0,
+		    "mediatek,mt6323-efuse"),
+	MFD_CELL_OF("mt6323-rtc", mt6323_rtc_resources, NULL, 0, 0,
+		    "mediatek,mt6323-rtc"),
+	MFD_CELL_OF("mt6323-regulator", NULL, NULL, 0, 0,
+		    "mediatek,mt6323-regulator"),
+	MFD_CELL_OF("mt6323-led", NULL, NULL, 0, 0,
+		    "mediatek,mt6323-led"),
+	MFD_CELL_OF("mt6323-keys", mt6323_keys_resources, NULL, 0, 0,
+		    "mediatek,mt6323-keys"),
+	MFD_CELL_OF("mt6323-pwrc", mt6323_pwrc_resources, NULL, 0, 0,
+		    "mediatek,mt6323-pwrc"),
 };
 
 static const struct mfd_cell mt6328_devs[] = {
-	{
-		.name = "mt6328-regulator",
-		.of_compatible = "mediatek,mt6328-regulator"
-	}, {
-		.name = "mt6328-keys",
-		.num_resources = ARRAY_SIZE(mt6328_keys_resources),
-		.resources = mt6328_keys_resources,
-		.of_compatible = "mediatek,mt6328-keys"
-	},
+	MFD_CELL_OF("mt6328-regulator", NULL, NULL, 0, 0,
+		    "mediatek,mt6328-regulator"),
+	MFD_CELL_OF("mt6328-keys", mt6328_keys_resources, NULL, 0, 0,
+		    "mediatek,mt6328-keys"),
 };
 
 static const struct mfd_cell mt6357_devs[] = {
-	{
-		.name = "mt6359-auxadc",
-		.of_compatible = "mediatek,mt6357-auxadc"
-	}, {
-		.name = "mt6357-regulator",
-	}, {
-		.name = "mt6357-rtc",
-		.num_resources = ARRAY_SIZE(mt6357_rtc_resources),
-		.resources = mt6357_rtc_resources,
-		.of_compatible = "mediatek,mt6357-rtc",
-	}, {
-		.name = "mt6357-sound",
-		.of_compatible = "mediatek,mt6357-sound"
-	}, {
-		.name = "mt6357-keys",
-		.num_resources = ARRAY_SIZE(mt6357_keys_resources),
-		.resources = mt6357_keys_resources,
-		.of_compatible = "mediatek,mt6357-keys"
-	},
+	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0,
+		    "mediatek,mt6357-auxadc"),
+	MFD_CELL_NAME("mt6357-regulator"),
+	MFD_CELL_OF("mt6357-rtc", mt6357_rtc_resources, NULL, 0, 0,
+		    "mediatek,mt6357-rtc"),
+	MFD_CELL_OF("mt6357-sound", NULL, NULL, 0, 0,
+		    "mediatek,mt6357-sound"),
+	MFD_CELL_OF("mt6357-keys", mt6357_keys_resources, NULL, 0, 0,
+		    "mediatek,mt6357-keys"),
 };
 
 /* MT6331 is always used in combination with MT6332 */
 static const struct mfd_cell mt6331_mt6332_devs[] = {
-	{
-		.name = "mt6331-rtc",
-		.num_resources = ARRAY_SIZE(mt6331_rtc_resources),
-		.resources = mt6331_rtc_resources,
-		.of_compatible = "mediatek,mt6331-rtc",
-	}, {
-		.name = "mt6331-regulator",
-		.of_compatible = "mediatek,mt6331-regulator"
-	}, {
-		.name = "mt6332-regulator",
-		.of_compatible = "mediatek,mt6332-regulator"
-	}, {
-		.name = "mt6331-keys",
-		.num_resources = ARRAY_SIZE(mt6331_keys_resources),
-		.resources = mt6331_keys_resources,
-		.of_compatible = "mediatek,mt6331-keys"
-	},
+	MFD_CELL_OF("mt6331-rtc", mt6331_rtc_resources, NULL, 0, 0,
+		    "mediatek,mt6331-rtc"),
+	MFD_CELL_OF("mt6331-regulator", NULL, NULL, 0, 0,
+		    "mediatek,mt6331-regulator"),
+	MFD_CELL_OF("mt6332-regulator", NULL, NULL, 0, 0,
+		    "mediatek,mt6332-regulator"),
+	MFD_CELL_OF("mt6331-keys", mt6331_keys_resources, NULL, 0, 0,
+		    "mediatek,mt6331-keys"),
 };
 
 static const struct mfd_cell mt6358_devs[] = {
-	{
-		.name = "mt6359-auxadc",
-		.of_compatible = "mediatek,mt6358-auxadc"
-	}, {
-		.name = "mt6358-regulator",
-		.of_compatible = "mediatek,mt6358-regulator"
-	}, {
-		.name = "mt6358-rtc",
-		.num_resources = ARRAY_SIZE(mt6358_rtc_resources),
-		.resources = mt6358_rtc_resources,
-		.of_compatible = "mediatek,mt6358-rtc",
-	}, {
-		.name = "mt6358-sound",
-		.of_compatible = "mediatek,mt6358-sound"
-	}, {
-		.name = "mt6358-keys",
-		.num_resources = ARRAY_SIZE(mt6358_keys_resources),
-		.resources = mt6358_keys_resources,
-		.of_compatible = "mediatek,mt6358-keys"
-	},
+	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0,
+		    "mediatek,mt6358-auxadc"),
+	MFD_CELL_OF("mt6358-regulator", NULL, NULL, 0, 0,
+		    "mediatek,mt6358-regulator"),
+	MFD_CELL_OF("mt6358-rtc", mt6358_rtc_resources, NULL, 0, 0,
+		    "mediatek,mt6358-rtc"),
+	MFD_CELL_OF("mt6358-sound", NULL, NULL, 0, 0,
+		    "mediatek,mt6358-sound"),
+	MFD_CELL_OF("mt6358-keys", mt6358_keys_resources, NULL, 0, 0,
+		    "mediatek,mt6358-keys"),
 };
 
 static const struct mfd_cell mt6359_devs[] = {
-	{
-		.name = "mt6359-auxadc",
-		.of_compatible = "mediatek,mt6359-auxadc"
-	},
-	{ .name = "mt6359-regulator", },
-	{
-		.name = "mt6359-rtc",
-		.num_resources = ARRAY_SIZE(mt6358_rtc_resources),
-		.resources = mt6358_rtc_resources,
-		.of_compatible = "mediatek,mt6358-rtc",
-	},
-	{ .name = "mt6359-sound", },
-	{
-		.name = "mt6359-keys",
-		.num_resources = ARRAY_SIZE(mt6359_keys_resources),
-		.resources = mt6359_keys_resources,
-		.of_compatible = "mediatek,mt6359-keys"
-	},
-	{
-		.name = "mt6359-accdet",
-		.of_compatible = "mediatek,mt6359-accdet",
-		.num_resources = ARRAY_SIZE(mt6359_accdet_resources),
-		.resources = mt6359_accdet_resources,
-	},
+	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0,
+		    "mediatek,mt6359-auxadc"),
+	MFD_CELL_NAME("mt6359-regulator"),
+	MFD_CELL_OF("mt6359-rtc", mt6358_rtc_resources, NULL, 0, 0,
+		    "mediatek,mt6358-rtc"),
+	MFD_CELL_NAME("mt6359-sound"),
+	MFD_CELL_OF("mt6359-keys", mt6359_keys_resources, NULL, 0, 0,
+		    "mediatek,mt6359-keys"),
+	MFD_CELL_OF("mt6359-accdet", mt6359_accdet_resources, NULL, 0, 0,
+		    "mediatek,mt6359-accdet"),
 };
 
 static const struct mfd_cell mt6397_devs[] = {
-	{
-		.name = "mt6397-rtc",
-		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
-		.resources = mt6397_rtc_resources,
-		.of_compatible = "mediatek,mt6397-rtc",
-	}, {
-		.name = "mt6397-regulator",
-		.of_compatible = "mediatek,mt6397-regulator",
-	}, {
-		.name = "mt6397-codec",
-		.of_compatible = "mediatek,mt6397-codec",
-	}, {
-		.name = "mt6397-clk",
-		.of_compatible = "mediatek,mt6397-clk",
-	}, {
-		.name = "mt6397-pinctrl",
-		.of_compatible = "mediatek,mt6397-pinctrl",
-	}, {
-		.name = "mt6397-keys",
-		.num_resources = ARRAY_SIZE(mt6397_keys_resources),
-		.resources = mt6397_keys_resources,
-		.of_compatible = "mediatek,mt6397-keys"
-	}
+	MFD_CELL_OF("mt6397-rtc", mt6397_rtc_resources, NULL, 0, 0,
+		    "mediatek,mt6397-rtc"),
+	MFD_CELL_OF("mt6397-regulator", NULL, NULL, 0, 0,
+		    "mediatek,mt6397-regulator"),
+	MFD_CELL_OF("mt6397-codec", NULL, NULL, 0, 0,
+		    "mediatek,mt6397-codec"),
+	MFD_CELL_OF("mt6397-clk", NULL, NULL, 0, 0,
+		    "mediatek,mt6397-clk"),
+	MFD_CELL_OF("mt6397-pinctrl", NULL, NULL, 0, 0,
+		    "mediatek,mt6397-pinctrl"),
+	MFD_CELL_OF("mt6397-keys", mt6397_keys_resources, NULL, 0, 0,
+		    "mediatek,mt6397-keys"),
 };
 
 struct chip_data {
-- 
2.43.0

