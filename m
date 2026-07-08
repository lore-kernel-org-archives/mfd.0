Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E79E451064
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515296; cv=none; b=urWh05qGawhA3RgTcfwFR482KOFy7+rwcgvdl+GFl1dYuA4mbXGNc8G6MG9YCmLNXMRL6f8IGBnxZbhsZ7liB49fSlHFSytuPt3DwIBAq2ybp24qrad2RPZTw7Z26jhtbCQlDj1P1vPHceCC8Whu9d8FE3yK+VSUPN0PcTlbfA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515296; c=relaxed/simple;
	bh=NqIdz9eEaKfnjtFoMaD9625M1qr2VdseCv1Uqzseygc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t7uTgLMcX8zRWHiXBzVUMMK9Ou8ZLGQtPhrz6JjeyfdC6QMi7v1QdMDrow0l+pj5dJc8J5E9zCWJgYBCu90Onk9mQNbEQSc3QhBEsi1LyzBKJm1EWgor5Zo1R4JGwNv1ogcSoDdku3br43v5rO/+3T/lXS2agab/9nomWF1JTEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mC0yvDm8; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mC0yvDm8"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso1280847a12.2
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783515293; x=1784120093; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NqIdz9eEaKfnjtFoMaD9625M1qr2VdseCv1Uqzseygc=;
        b=mC0yvDm8GVNbpg5bEzFju7NmnsJ3d6tlJO8bST/XBhp6BIN3qEY2HKB95qHjDbK6C1
         Q9Cu/vVP0eLVMk32XBJOUTL0qPgED8x03+eGhUKCndr4cyBtS3H+SICRIqhqq1vD54za
         fB2jPDrGidTAVgcwSnlJwirlxtwGTtCl5TCyQV/f8E35VwVJWLSuvDrNxdkxPegY2Bbw
         1QsVtyrkSaP3NJoq1L0fLXNGog5Cx1pjAQTxl6I2mWiXTA5WdqUZN+k9rlABr58hlXpd
         KCiPPTKDM078zFc0n8NXyNxicU/zTuDfb1tMHFhmtxOrA1ZWsAa3zm6IaR5HicXqjfJ3
         xS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515293; x=1784120093;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqIdz9eEaKfnjtFoMaD9625M1qr2VdseCv1Uqzseygc=;
        b=RIpmn41aQ2+Z1z+kaOLGzqLDpU07Z89AWhdY7rZHf+6zl7XLTQ2Pb+PMuOTxz/YAoU
         cwgOVcxj454uFHHjHmpvz9UX4KKZY3l9ooPLKqctfEZyTIF81sIjnYj7kMxot8woIWFu
         yel1gvjeSra+J2gFoHVlarqKRWnsz4282H/6TRZX3hp47aORYM5qNbBnrGWLMeKMbzGV
         k3+kv+XWIQ/Tvak/uaSFMYDRIwbSIlMFDk5A+6Vs1hAPia5ZJh5UHCF5jT/+HUgcq9Py
         0RkwNCegwXkpm8ai20+62TOw2eBhBJI5J5ONQiMIdaBBKUZcDMrZeI9XSRhr+AixtGwN
         snoQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEtAFOjMzcZBkgtlaCDCn8nHbtqKpI97pdrUdR6U8IShkcQOtSRV7LY9yNL09BXRsaUhc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlyKmERbS4QIbg7y9dXpZVZZbqqaCPfyLrbR+yRLbA0fCMmCSK
	xwS4rhm88qrELYgsWD4o9NKBQZlegEqXxzcb+OY6YQCslM+rlUdQcZnUClDGkZ4PNgY=
X-Gm-Gg: AfdE7ckYmdoSQmNIrcSnykBBFmJo9l6wPDfdr33WEWbZK5MhRfkO6jf5EGnd7MUOlZm
	5wwOZsi5G30Ipi1J7i/O9pR9aSKFgAxMrJq6X1Yqku78s8U14MrgpN6/AkMlUWGLSeAzAG7JQ5P
	HAYmvc9U0fQsRrrQAkIRD6/vP+Rmq6vd2cf+J5WuN/0h2IksQWjSyv/fXeXNXKY/arC56GyY4uN
	bqbhCcJKuRMFAneA1WEHWMLYY/YmWjKMgklbGq+61i3/YmRYu5ORDh5zrW01XaVZHW7DMVLcxrl
	w8gbanEzWPGTqcd+cFyQXAxRFVnjbnbKMDTk0K8HWmuWBhSJ+hfxbxuXYSBFmBjWHbihzZSStr7
	J75VnSsxZBf9Wk0tvVPLnElSgGAJAPj1PhUz3wLCQ8lxtbaTX4YCE4y8sbGiS1VpSjLAxpJnMs3
	owKw3fCjTBss8LWrTxE/Y=
X-Received: by 2002:a05:6402:1906:b0:698:b60b:aac2 with SMTP id 4fb4d7f45d1cf-69ab4453d30mr1054344a12.4.1783515292855;
        Wed, 08 Jul 2026 05:54:52 -0700 (PDT)
Received: from draszik.lan ([212.129.81.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69aa613d4e2sm2000319a12.24.2026.07.08.05.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:54:52 -0700 (PDT)
Message-ID: <4a5a09fd68fe45939bdcec4a3c5a781d664eb34c.camel@linaro.org>
Subject: Re: [PATCH v2 13/23] mfd: Use named initializers for arrays of
 i2c_device_id
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= "(The Capable Hub)"
	 <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Michael Hennerich
 <michael.hennerich@analog.com>,  Chen-Yu Tsai <wens@kernel.org>, Marek
 Vasut <marek.vasut+renesas@gmail.com>, James Ogletree	
 <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, Ben
 Bright <ben.bright@cirrus.com>, Support Opensource
 <support.opensource@diasemi.com>, Andy Shevchenko <andy@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald	
 <rf@opensource.cirrus.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade	 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros	 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Andreas
 Werner	 <andreas.werner@men.de>, Samuel Kayode <samkay014@gmail.com>,
 Maxime Coquelin	 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, 	mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-omap@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 08 Jul 2026 13:55:06 +0100
In-Reply-To: <5aec0fc2ac0cd1d2e27027ad0c180e2647bd494e.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
	 <5aec0fc2ac0cd1d2e27027ad0c180e2647bd494e.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-07-08 at 13:15 +0200, Uwe Kleine-K=C3=B6nig (The Capable Hub) =
wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
> =C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # for Maxim MAX7=
7759
