Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB274FC32A
	for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 20:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629056; cv=none; b=nh9rjB2wvGWIlutCjsOAa49WV8wTnsL3oKg42shiFzQK04ja0m8Puad9lbBA7T4kJmqqtGNigE1IkiiDxn2WmuLFfZIjwJSNgtIXMVFGL5fKIM/wWperMGYYHydA7MHTlcVWehn3fCLyYP35bDmRc/SYVOCjTsmpYXwJSY//1wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629056; c=relaxed/simple;
	bh=7RoUzDOZY1QDhkSdG9ZG4g/IuQvy7fWK/zAReNc1Fzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qenBFF5qZC60AO3v129hnVYjy319TiSS2ifXjuce35lTsDHZyhvQU4aQOKRmGpQIslWVYgIl+O2TjsIwe1rBYi48CZ399BMCxWimFeHG85K+XQ7M3VVCUrsXicBPy4/1p93WaLRElVFk1gTV04VFMsFL5Y07wK8ZbLGENZurXH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWOx4Mde; arc=none smtp.client-ip=74.125.230.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWOx4Mde"
Received: by mail-qk2-f8.google.com with SMTP id d75a77b69052e-530e2f0c0a8so39985931cf.0
        for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790629054; x=1791233854; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VERUOQXBp5L44ineuoMQ6cH79KBHk57qqtJbh8GU1Ow=;
        b=rWOx4MdejRp8NkMwa8zIMSuJXSJ4KTTx93HUu7vQIV5DxYrDr5U6Ozk9Log+wHRAZd
         2r5oeYUsdGR+YQAEaK1RG1I09zXE7YM/2qOqx6ZHgpsWWPpELT5ZZY3khTV8BuX0xSS1
         MBORxmvCV4GMmJBjYmI5a3ZJjK6SmkDMiXc8VPX7HonMSFdbotpAU4JeA1wMllAgYrwA
         aJyorz54FWO2X6Szx55CcBANUYozLr4eE6pOSjFjxTxpxXLfDLpCNb159iJK0AFM7Bor
         CXQeKSJSxpl2hebVDTFS4+MnSoaQrtkolCmOLY1xrjE21RUXmprpUG668mW2H04t+Zlb
         dKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629054; x=1791233854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VERUOQXBp5L44ineuoMQ6cH79KBHk57qqtJbh8GU1Ow=;
        b=Of2rVarv0QpvBn9mLiOhaFZibHpc0aRr5D/VJ7gOzKG0U04vWSUkHEnrQHba3k8kRF
         fSBN554BC91wmIKMdPwTEIMsIWE5Wk1YYq1rjtsAGLFFq37ImyqkW8VmcL0lbR5y/cBF
         Z08IzLoaEzGFhxeCjwzjhB1hMEskvRpQXejievgBTs5dhp81afBVL9e0Xhxp/2iR0Ue3
         TkXY6VfshtBqn8cIc4d6cUN+WQOgpujOKiNNAZagWcsTTw/PU5xjiS2Q9x5qTxg0N5Y+
         +yUyRn0CIZzEIBnK+mndnSnO/dgzq6/2ipa19T9o1V2NR4qDEi5qHx+/MHAXHjNJQ+HN
         5JfQ==
X-Forwarded-Encrypted: i=1; AKwUvBweoPfym0GFa8c7F+BZ3fjiAT3QYyMqpvyqWfaHpkY7dJ8BzgZKXAcvF90D6CEnkbdvS1g=@lists.linux.dev
X-Gm-Message-State: AFuF++m/XVQsxoGoFg/bef55+eJSsr7y1LkVHHLW5NXhoAnpZHjaf/Zi
	FsXMpsGicc3xjyF2kq27qAURgRbvvJjvM9Xiw6KWxe20ALaEmtRgVeSd
X-Gm-Gg: AYBFou1BgfW29NYzs8wHO+2AbVRBZ6l28Q7t7wDrbiYQYTIv9GUsAvTnS8ATiNLFxa5
	6LvHtEIHssJcxqBRN7AOIb2peXfAKAMsc1ElVMnezYpJh3XhNjpNKSnJZqJ8yKyroGw2p9K1dKQ
	W/IQ9qSuVL8Y1eOLkPnCV2VP/pNwBPZfUX5WOrhbHJDoka1/pLrxti+RHZ0lzYLS8Zs0tz659ea
	w4L71DfD+P82nmy4PD/+o2sCRL34bcI6DLZ7yhD6rFThPi7nDNvuSTjhI9SFiGeZtWcpsLB45je
	nDTCwWMp5BrUjKu/5U/VTGetOI69cNsJOWvWxcf7o10KGuFZkKlR0BsRlajc2HgKKuNswQM0vi2
	MND7qDzilCI3WT5FSta5VsLMbBnZVDtni70+czSEllvVZMnkgSfJnL2g96l2na5iw7KLprlQG7T
	Jt2aXI/pQBOWlZqgvoIaoJj3IBLXXetJmaX9XlW0gnLDMXKZTK7jAoMlHFoh9+FPnQBtYDswe/Q
	iroCSQIyq8GMCJG4mt/KkmVq/za/ab7EwN4f9cTyk5ilL0KAhM6zJkR6NaxA/RijngRpuaV2wQ=
X-Received: by 2002:a05:622a:13d1:b0:530:e343:b65a with SMTP id d75a77b69052e-5330b6ac001mr253823481cf.51.1790629054051;
        Mon, 28 Sep 2026 13:57:34 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533223c6d82sm71443421cf.21.2026.09.28.13.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:57:33 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 28 Sep 2026 15:57:21 -0500
Subject: [PATCH v4 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-3-23533a0d30e3@gmail.com>
References: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
In-Reply-To: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790629044; l=905;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=7RoUzDOZY1QDhkSdG9ZG4g/IuQvy7fWK/zAReNc1Fzk=;
 b=A6AqE7eu3ncyQ70or985e3ODrK8FHn79n9oI/zJvG4E8nupeafb2sik3BBKjwJARUxbfOYIEG
 cbE3E3gNJVsBZowBHGPEj6IcOlHtEOy4pJejW+IVae1ULrZIHdD/kjd
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
devices array to allow the corresponding driver to probe using compatible
string.

Assisted-by: LLM
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 9ec951996588..5d5f816492aa 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
 
 static const struct mfd_cell mt6397_devs[] = {
 	{
+		.name = "mt6397-auxadc",
+		.of_compatible = "mediatek,mt6397-auxadc",
+	}, {
 		.name = "mt6397-rtc",
 		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
 		.resources = mt6397_rtc_resources,

-- 
2.55.0

