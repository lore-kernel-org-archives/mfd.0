Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B333E3B3880
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 08:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510250; cv=none; b=KcuvVPDetFGCpZW7YYDi4+Fxl8wqgn/G1Y8VqboomoZdMX0s8rtyC20mx8NmmFzFVkhcd9xE4rS5MMakTf8sW2eNDS8EuCNhdwe8y23GratuNfA3L1Nnzc80aEjwERBI4HnTFUSuencfN3WDfWkgibQxrJEylW6RdtjrdIpPpok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510250; c=relaxed/simple;
	bh=bOFX6B1cMLWK/8rdWZyVjQRxmhZreHCtlJQd0747/0g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=td6X3IZCrD/VydsgizD4/F+1ify2bV+EqumDBUdQ0DWC/KQZbw74nh3Agg+sMmRBK6+sevAtYJf+360RbmEr8oY/UIxApNQeipzfsJXNYOr4BESEIc0I/o1aXIgkMTr6HgINyFcWdFE/NrpKwQEqWXO2VN8nKs6ohBq3ng6D54o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MX6pa+kY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="MX6pa+kY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso5932805e9.3
        for <mfd@lists.linux.dev>; Fri, 04 Sep 2026 01:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788510246; x=1789115046; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOFX6B1cMLWK/8rdWZyVjQRxmhZreHCtlJQd0747/0g=;
        b=MX6pa+kYsU2TaRwc99oI5/77Efi57CFhx+T7QHH3WcIuTUlJWBSLOKokMdTg/Q93Q6
         XzIohDz4IwuhSQsSP8XhzzVsyB3+b0PhSbtaHDJbsfFXCbvknu7GokcNRdz7avZ/3nxW
         cAq0pGOJa62hqGcq/NOP2ZGkfWqUEAfibv3VbH3CNxjh8xTcvoMyr8V/WwfkSaz8Vp4l
         PO6pnSqIYwP3QTUyU3OYh/elC0TPgLIVxsJcY6KjKbxRthV9dZbWjMvD49tbpR1rV3lN
         zWx760QmJVUFRIBuKbd9HD80PX+qghE2c9qobL5kXalAF6dhgWYbUQ0SSRilShCCahZP
         mKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510246; x=1789115046;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bOFX6B1cMLWK/8rdWZyVjQRxmhZreHCtlJQd0747/0g=;
        b=dcHTp5zkHhNmc9ms0+8Icc/LWYYf0+BHaj1U9Mu97802Fj1lRVFkWSNbH91a2PTx5h
         Oxg3Q8lW8fNjmgE0ChvWRqyaWzzNkatk/QwkxsBDVkmoWX/0e2wgpYd11QQbzdOsXpEN
         Q8Z4Y1kOq2Oa8qYJyo7B3ZyIMZNgfIcWVzXAUttlCthtDdYlJFMAKQI1MNYRmVqoaFvh
         Ew1KZJjmPaeB6VlG1tqLt4CMz0FfgjQKw4Z8s0bfDv1Uh6TTy6OFCBJ+Nugyv3p2Rr8V
         S2yPAerxOuWqLoIWmsuqoeV7UYomnUCcW3kx/O9UhjoDjGo1QSQwyUYrdQ0Kywi7L9M9
         9+4g==
X-Forwarded-Encrypted: i=1; AKwUvByGntNc2+XJXa4X8ulduVrctwjoJ9C6/E60jEKwQC3ZZpSAMvAPcp+pvQNnMXwonMpcg8k=@lists.linux.dev
X-Gm-Message-State: AFuF++liCIUNJD+j+o1Vnj+1ae05m7hMpMeQCOg7wdGZwJhJlXGLnv3n
	5WO/5XmL3ozguMOsHfTkFBkCsQdlwYj00c/uqp/z6r7++vPcYyGZEbpJUyv0eYFiOxg=
X-Gm-Gg: AYBFou1EC3Ci4Z8dlB2H0RAjyHLVXb1SfgQtGh9RORDG195fbe0sGkpyt6xA6h9+cxd
	HtSY+rl4t43/ampyYZmcAku+JWKc7vn33r/Vq5Bj6e7qV/jQzzy45LpBZueqi8bKk/73P3zirjx
	/JQOwDufW46BYatQiBRMbdNdgfLQ7Logeig1Pb4ciPFbo3oHX/XhCb2K8/NHMbsqFYN4jzgFXcv
	mfqz10CP+myWaveomtY7rGrzXigdBk33X2lh8GHHQ8WFwJvhEmOwBdA+7C/CX8NOxS6PXGLDV4b
	Fcu1SHd+EAxKzhWbPDijQl+58T0347lz1mFkoMTQjuOMAbuh2r+byDsCu7EwshVgay9Ubi35Mr2
	Vnb3Q2AvpRvc65YWcAHumPU7xABRLlGkTEQMp/ZeBe4Sm74Eyp8Qfh9ePoPrZzVgEa2HwDjerbl
	i74TbKWCukX+kWiXjjnEDgyFjjT5vF2Pihij/wK8ACTHfS7aCqUsx+ULBGLw4EYpZQnQLl69H1h
	LJ8NlQ8hCsilwUW5w==
X-Received: by 2002:a05:600c:a44:b0:49c:dcec:bd27 with SMTP id 5b1f17b1804b1-49cf821e7a5mr40764145e9.8.1788510246002;
        Fri, 04 Sep 2026 01:24:06 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfe14sm4632933f8f.35.2026.09.04.01.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:24:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Matti Vaittinen <matti.vaittinen@linux.dev>, Matti Vaittinen
 <mazziesaccount@gmail.com>, Matti Vaittinen
 <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen
 <matti.vaittinen@linux.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Michael Walle <mwalle@kernel.org>,
 mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 08/10] clk: bd718x7: Support ROHM BD73800
In-Reply-To: <2a74fea679420d147ab1029943ff071628dc8c5a.1788346553.git.mazziesaccount@gmail.com>
References: <cover.1788346553.git.mazziesaccount@gmail.com>
 <2a74fea679420d147ab1029943ff071628dc8c5a.1788346553.git.mazziesaccount@gmail.com>
Date: Fri, 04 Sep 2026 10:24:03 +0200
Message-ID: <1jik4ll90c.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 02 sept. 2026 at 14:05, Matti Vaittinen <matti.vaittinen@linux.dev> wrote:

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>
> The ROHM BD73800 PMIC has a 32.768 kHz clock gate. Add support for
> controlling this clock.
>
> NOTE: The CLKOUT pin can be muxed by an OTP option. On some OTP
> configurations the CLKOUT is not outputting the clk signal.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
