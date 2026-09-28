Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2820C3CFF51;
	Mon, 28 Sep 2026 21:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629526; cv=none; b=Nv5VFUxDBpgqynb85VG1ejI+UrWqswzWIFdFmhRV+a0ocwR6hZ/4TVeFN/To+N8I7qsaPCE1QJn374CX6hEtJ5P5nL/lj2Ko9n1vfyW1Ahljr1VM13cNAogD8BvUedYlx/0b6vOOOrWkf6i5LP5TUkiOQItkzG1X3Wi1GrHP/Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629526; c=relaxed/simple;
	bh=grHiVNv4fxqbyuIrt8ZDHiLToc108D1qA31IbFxhYME=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kJA4uFg+kL6ATrbEWBUYT+WZablkGs5JKX/+0UaW13Bw0bCYJRFyVX+lCV+SBTHXUe76cPQcCxnx8Zc35Rn+MN5JCl8HB1hk+VaZ/MY8NunPaaXtFtPG3F7nFOz4y0vkQ1wX6X2LTadUC4N3+jFKizfzDJShxRNpbW93oaFcMB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fn1dlRmO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fn1dlRmO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB171F000FF;
	Mon, 28 Sep 2026 21:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790629524;
	bh=grHiVNv4fxqbyuIrt8ZDHiLToc108D1qA31IbFxhYME=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fn1dlRmOg/P2MaEpASd2mDIqeKfZ8LjT/bwk7D2kG1emhMd7ga12xhPVSP3Mn8Zhs
	 9juAT43QI+58yTtdk9RVqINNWDWpBCOLw4IumQcVCV4uWnm9VnLOFk9emq28ELoFHD
	 rmeX5OBZ8Og1/LM0mPYbEn+ZDBEkGW6gkVj0414nR4l/UkXIeqLe48EU7qk6yXgYcw
	 YovZTGJ+qfvFV9FxrFXKwTCHaZFbsc4NGnbF0ac2Ku9+gaw3Us6VvCF5Ry2Zv72+PA
	 kKnssPZ+1UFTycZQG+iTLUv6a/bQ/1QSDxZa2VwqIlDI0l8riYfj5leIhNMuDhBLkI
	 8dNpCpgkd1giQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-2-23533a0d30e3@gmail.com>
References: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
 <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-2-23533a0d30e3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 21:05:23 +0000
Message-Id: <20260928210524.6FB171F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The mt6397 AUXADC is a 10-bit ADC behind the SoC's PMIC wrapper. On boards
> built around this PMIC it is the only way to read the battery: the SoC's
> AUXADC is wired to board thermistors and the charger ICs these boards use
> have no ADC of their own.
>=20
> Add a driver exposing the battery voltage and battery temperature
> channels. Only those two are described, so a channel ID in the device tree
> indexes the driver's channel array rather than the PMIC's channel number,
> as mt6323-auxadc does. The ready bit lives in a channel's raw result
> register, but the value comes from the chip's factory-calibrated copy.
>=20
> The battery voltage is measured through ISENSE, because a board with a
> switching charger in the power path leaves BATSNS on the charger's system
> rail instead of on the pack. The thermistor only reads correctly with the
> PMIC's battery-detect bias and input buffer enabled, which take 20 ms to
> settle. Both are switched back off afterwards.
>=20
> Reads average sixteen conversions in software; the chip's sample
> accumulator makes no measurable difference at any setting, so it is left
> at one sample per conversion.
>=20
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-rbrue-suez=
-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com?part=3D2

