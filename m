Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579975;
	b=YG1buauoEz5ju/g+1BY3BwBzzt37tOrQHTkyYy8aUUs0SoHEg6HYde1SkkUNyMi2CfO9
	 NBxFZ+E22DQgJp2ZPqfDSKgbNUznjn/hCVQXJR63XnohjdzQljplSEd19WuGIvQcuJhYq
	 F2OLd5EaxPLyLRalXDEby0NAzON9J7zQUCXA1w0G7YMdZXLmxeyIRx+UnmljcHwl1Z2p5
	 1ojUcOsQeqAR4V2zPJINpABztuB+EgT/O0FINCTk8nv1BV6qsNjDWh5RgF0QQiPZhv6Z1
	 3yefdaV8zrL0kvu6BmO9/oRv7pmOAaevkP/TUrjX4RAU+2Ve2slhf7QOFzNlvwwaOcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=khjjDBK0J2xOtnMH1muymGK2fwTqPXy0k/z60K/0+xY=;
	b=hsdnrMt/1RwD30X4gji0lN+CZgPPqsa5sIQj83C6MKU1Tgq4qXToU8WuCconMwmy5PoN
	 Gmn4kYVBLAuNR8XsZqW3MvtKMp616DB4k5vDkIavnQMeFJVrpQ3Fg8nJ4AHseJ9YBG1EC
	 OL2QyX0j3/EdYAosX+MU3Rp+NuDGxK+c+AuvurLxj2iwE/J3QzoL5FphUbCnsk00iFk8v
	 ZwdbiAAc7TsqlnK0eZWZ8IylLRT8y1ZuzgUI8r0PtN5UxgnsqG9pGObhxcSWGO/t8lAOi
	 M3yWcWcmKM2PmcCQRGsPee3e0tRzmy99Q4vQvHp6JUsuU0xOXqOdhYtiOhLDsRgBqow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XEu2NnXy;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263E3606A31E
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 10:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 263E3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XEu2NnXy
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so6494435e9.0
        for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 03:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579973; x=1793184773; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khjjDBK0J2xOtnMH1muymGK2fwTqPXy0k/z60K/0+xY=;
        b=XEu2NnXy7gkAMhZONgGEoifpVtgzDq6g1UQzrqTR2cAMiz3kZsDV9aBtSAmFfgvkd+
         eAHkgc02zHj+E620M8M4+FUMNjHyh5EDwcOKU2jD9VQwtRGYnKDHyADJl0fKrZIFFqb4
         32DEHdOowFmeg+4bS/tqvaflnb8e5rbVZR+PNYgmpy2qacNX1gEFvxpxYc+yLbl86D1d
         Hz3RWm2eyicc8aE2Jc9bGSQSy9Zky+MtZtkxLri4kGZfe9VN2ADyVAKbkibBNJSfjFEJ
         6SBUMOfIyAtJPsyP62UbcomK0DPz81wwDoVh7XTKW+cgaLRAn7jgbKiUBUYvUbUe+CN0
         vBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579973; x=1793184773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khjjDBK0J2xOtnMH1muymGK2fwTqPXy0k/z60K/0+xY=;
        b=Id5Dh+F3dkrFsgk5sBGUfke52Bp1/gBz8dx3ataI4apLWHlBfTVYlaS555Iq1u0JSi
         hbxBlTMdMyHyqpi5RxPfXfmpu3HIiSgE6Z1mUpLT+Yl2AbDHPWe7eaquFyrEXCeGTk+d
         bOSPJdYfbPh/e1Um+xmVvhQo24pVOFqCVGIyqZXYTan3XFHQQh9pLOz+N7ps2+mCjMeZ
         cHYpwDsOy5RycKi84BJC+AkgB2LkIL6M92a2dwcg8Nc7HrzqyNyiXZBN5hqOtusOwVkp
         krGNTn4aJ5aXrVkGcvN++GQUrbvewExsVlFuEVHyyYNaCBnf+D7VlGN5KY6G1jmeNZ0s
         /3Iw==
X-Forwarded-Encrypted: i=1; AKwUvBwV1qy9VKIdEtyjB9x+a5+x0lwPFMXMYtPF2xGCoQ/0jgGD35HhBvVvwtek6jUIFJ57UrQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYK0Q/TK1ZOyd0gKYYROiJFxuSvcHXjFWHQOu9Zfl2/1XYOhBaFr
	Lw+h1YquxUZmNFo41w06+NpOs6juZw7FkuuWEqpavy9fbnrVFj8JTkzD
X-Gm-Gg: AYBFou3E6HNNBIaWq880akLi7ze0mvBa3penG4BJmsg4XE0p67yk+s0lrw7QYYrSlRI
	pgW9K3B/iAQGUGEIkicqbSgkWuzBygMPDatqyiqFOs8rrLjTTkCbK0jSuXMx8eIDzMrJGjemF9D
	0FDKMt9UkZkTZdRr0Jfnv/WvnJiZShlybJO+LGlxj556h/3Et8ZkNW2uubEiPOge0C2D2TfY3Gf
	UnurcFn+DfaiQYHsODKZLIX5Y4J4VVK6MDBjBvERbJIAoEQBXGM6mKe5bqBwKPcthl3mpKV9+TQ
	3BE5j/lzZSuvKtHPTIEYjf1y0sRKmyz36ucokooiVzCi30t04m5qKIn3kR6e42mK+XhWjlHH8Bn
	9eU6yhOsF+8Gn3NypcTx1tlfZRV2z8VBl4kIUFRcMlFjGR0jPtRnw0aq9PNp+VSdYi2eF5tXCDp
	fSH82OJKdMdDAcYJguflNpu43U07td88mc8i2VoF09Rc2i5NE9bhH5qQ2TN/QS5LWl4QEoYxvsr
	gxUaYwg60Qv2BXdN1HcooZ97s1FGKTAcVeTQWeAgoTSythS0NQ=
X-Received: by 2002:a05:600c:a0b:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4a1fdd2443bmr32691975e9.12.1792579973272;
        Wed, 21 Oct 2026 03:52:53 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:52:52 -0700 (PDT)
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
Subject: [PATCH v11 4/9] mfd: mt6397: Use MFD_CELL_* to describe sub-devices
Date: Wed, 21 Oct 2026 12:47:22 +0200
Message-ID: <20261021105109.199886-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
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

