Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFF53DA7D2;
	Wed, 12 Aug 2026 21:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570872; cv=none; b=RHsg+arpJx5KtlTtwRwEpwyTq48AU8tnr0rkfZDmnNBLWURO7O263SvfSpreq+AcMabXPdGZ4ls+BZEzoPAIkpknK4h0PFvPuAxRo+Pvhs33NVv4K6W47Rym7e/0YAHePt/J5PpmANodFOjiYWNriCVJcjIYraY80PbfSleXCHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570872; c=relaxed/simple;
	bh=wJA5EihTaKzRMaO8YFaoTXvw9ObY53RmdBM1tnQHkxw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SGiMORhm26+iKJEwDPb7WC8xBaEnXvTLpHOuX6egrksbNELC8pKYOsCRH/OpKdYfowJ2/T0p1ObNwP5WOJ8VAZ93HoVo1XU/CjyQR8W4+X0equB1DxEl7Ukqj+KaFrNmfaPGfHtk/tBDDLOGjc4VqV2tyESIb6ATyycMkWAG7Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBwN6tNT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBwN6tNT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E398A1F000E9;
	Wed, 12 Aug 2026 21:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786570871;
	bh=wJA5EihTaKzRMaO8YFaoTXvw9ObY53RmdBM1tnQHkxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HBwN6tNTo9h0DF9w0NFAaoj+BIbdPNMR9efwCSyUqzIRHmCJN8MYqRcHdyze1yoMj
	 HVXESqHePSC2KZj9V+OOWwlsmsRmAIbvDnImq6QDhTUIGEk8i8FRrddKmzRsTg1HQB
	 jV5oo0SNZF6mS9yXwxKnHDUvXlUBpDIyrmsi/GpqKQbZVxJTbJernBUp3Y7j87COkF
	 AFptGVMpDvXYmrA65N27T11Fh2XyNJMbyz6AkLiRUlUmVGrMk4gSW3TNBqJ2bp6yeX
	 lLG9MQvJu79wlNSgf6wnQ4yQPLSIkIooBMpEif6n9RXDftIwlNARV9K1gq3rt33IvD
	 eE2bYI2lKLgiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v6 2/5] mfd: axp20x-i2c: Fix i2c instantiation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260812-axp318-regulator-v6-2-d6b84b55c000@baylibre.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
 <20260812-axp318-regulator-v6-2-d6b84b55c000@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 21:41:10 +0000
Message-Id: <20260812214110.E398A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Apparently this device never really supported i2c instantiation via
> sysfs, because the driver does not even look at the i2c device data,
> which are not set. It would only probe if the device matched through DT.
>=20
> Fix that for correctness, even-though it is probably useless.
> Add the missing AXP323 while at it.
>=20
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel=
.org
> Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loa=
ding")
> Acked-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-axp318-reg=
ulator-v6-0-d6b84b55c000@baylibre.com?part=3D2

