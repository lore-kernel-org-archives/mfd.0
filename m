Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1001B21A453;
	Wed, 16 Sep 2026 04:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532342; cv=none; b=QE8UE5kKsFs/2IyFc8XBSyoGC1xD7xgL+UmTRMIhBvj1zgkfW8FIwTI+XgHMdd+OI6xKvNrXIvpqPd1hSILdkC1U/+lJSYKtpUtun6xl+ropeEKUaDdvx0ylbcpTZozi0DlPndygUenWL/Ie5VCk7rOibDfsB0ljM0KcDP0uFhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532342; c=relaxed/simple;
	bh=ANJ7hYI/cak89pLsehgG3TbJrGnV5GuyYM9gcmD8cPk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ObLxIKNXgx1ckiFTJllvydekYVoGjUFfhne2FilguiwvYYhGwzK3xSJPH/Wi/NYcUsJWcGdjSmcK4Z4rtxwlrJvSDgIhYskcHiW7B6aOpKPnZQS1pFl1l4bSAartwlWxQ07UE2ERHuCpsDmrJ2RwCzbWfYCpxScxtJv3Krj723Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gp5VIrha; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gp5VIrha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0715D1F000FF;
	Wed, 16 Sep 2026 04:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789532340;
	bh=ANJ7hYI/cak89pLsehgG3TbJrGnV5GuyYM9gcmD8cPk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gp5VIrhaTg6xg9RlNTgLTRrTUIzTnShkx3ccSyMT/XCQydP/BYbHUMi9J/TvFie1f
	 OI872z8G6q4KuByRiSFXKTwM0yAX4Da07WdPE2A5F5z6I56KmZf/ZqQn9pBckAd5I8
	 Fd8ALIMAug/1d6CFPhmMIpotfoZOe6ejsui7tv/wOJ78IC6b3zBuwufk5C2qSWy9Az
	 DHgsElp+lCLpiuDfXpDDwOiokZHpSgPHn2nu4e9Omb5qqlL/ChLquvbchqHVzkPRB+
	 LuesXaDYZu9e+7VPuLJAjbbd+MOvm5V9KkvprcS1LmJywRESZl0YZGjDNpbtOYfaHy
	 xwksJEIKN+qUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6397 PMIC AUXADC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-1-d35d2ac3d6f0@gmail.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-1-d35d2ac3d6f0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 04:18:59 +0000
Message-Id: <20260916041900.0715D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The MediaTek mt6397 PMIC includes a 10-bit AUXADC used for battery voltage
> and battery temperature measurements. It is not register compatible with
> mt6359: a conversion is requested by writing a channel number to a select
> field and pulsing an edge triggered start bit rather than by setting the
> channel's bit in a request register, and the results live elsewhere.
> It therefore gets its own compatible rather than a fallback.
>=20
> Add the binding and the header naming the channels a consumer puts in
> io-channels. The battery channel is named for the input it measures,
> ISENSE, which is what mt6323-auxadc calls the same input.
>=20
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-rbrue-suez=
-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com?part=3D1

