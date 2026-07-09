Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DBC39E6C6
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617137; cv=none; b=hWi7pWQnxBAifBboYX/F24/Wy9s3PVfaWj4HjAvJhRo6UpVPon+XK+MHq64O/OE+Rc9isMz30R2zrvIk//Ez3oeTLS+MxSLBds4mUP5DZbFSt+KNk/q0FzKMsqrCWbRIPRDsxrZa+lUEftT6pMY/nVZcO1xk2Wyzq/6X2z5lXyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617137; c=relaxed/simple;
	bh=3ShOyu+1kzD7kKFd37+AlwkQ4WjrBjfV+QpsVQ5A2VU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SAjZnAO26WhNmsKGkHbHivIWwCUejE8WEhQmEA5hZ8vu/lmAVObGHL+x3GReZ365oBD7dZTEzuSlc5OBxcwGMNGyQDF3xHx/xcY/Loj1VzmE17RIObXb1SiyMnPrqdnJ5ne92IlMUqMlEKcjsdrh+bChJgpkGTcUpc/qdTUCaz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MouNOUWx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MouNOUWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B89D1F000E9;
	Thu,  9 Jul 2026 17:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617135;
	bh=YU+c73TLFwW6kZvLI60aeDAF/djzj/4KeiL3bLZIXVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MouNOUWxWG/lLPXshipfp/4wP393PY63aJizBTGbHAhpP1z4QwzMS+UtZEdX/PQD0
	 666XW4uCzwl6zOmMEr9Fs2PQ3HFtV/ETF2QKMVxIyFqx8q6x+WE9ApsoDVumJ+bqi0
	 fkc3l9Gy7vJrXxjIRZ5CLY1lRiAU5bikyOjG/n3U66QmRD+d+XZkqCn47sbVdDqTxX
	 qXUiLxYCjXKrhaEmb0aCFRBXxJ0hIyQFENyCOY6ndbhdZsiGxpU7NKNC1Nb12k8iT9
	 c3Eg5ZfSlI+zX1PE3JYNbEnzjMF+gAtK94hYmYqwmHE/lm9ovvN7FZUtyaEhbV/x3Q
	 vkTjfPfq6LBWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 17/23] mfd: Use named initializers for arrays of
 spi_device_id
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <d758f5b2b861fad11a3e90ef2d44e8aa3c817ec8.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <d758f5b2b861fad11a3e90ef2d44e8aa3c817ec8.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:12:14 +0000
Message-Id: <20260709171215.3B89D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Architecture/Design Pattern Violation: Platform data passed via ma=
tch table's .driver_data field
--

--- Patch [17]: [PATCH v3 17/23] mfd: Use named initializers for arrays of =
spi_device_id ---
commit b06e5cad6614df85c16a865ba7590ad2b10f7423
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Use named initializers for arrays of spi_device_id

This patch updates several MFD SPI drivers to use named initializers for
spi_device_id arrays. This improves code readability and provides robustness
against future changes to the spi_device_id struct definition.

> diff --git a/drivers/mfd/intel-m10-bmc-spi.c b/drivers/mfd/intel-m10-bmc-=
spi.c
> index cfa620f0c70e1..94b9c99bb4f86 100644
> --- a/drivers/mfd/intel-m10-bmc-spi.c
> +++ b/drivers/mfd/intel-m10-bmc-spi.c
> @@ -160,9 +160,9 @@ static const struct intel_m10bmc_platform_info m10bmc=
_spi_n5010 =3D {
>  };
> =20
>  static const struct spi_device_id m10bmc_spi_id[] =3D {
> -	{ "m10-n3000", (kernel_ulong_t)&m10bmc_spi_n3000 },
> -	{ "m10-d5005", (kernel_ulong_t)&m10bmc_spi_d5005 },
> -	{ "m10-n5010", (kernel_ulong_t)&m10bmc_spi_n5010 },
> +	{ .name =3D "m10-n3000", .driver_data =3D (kernel_ulong_t)&m10bmc_spi_n=
3000 },
> +	{ .name =3D "m10-d5005", .driver_data =3D (kernel_ulong_t)&m10bmc_spi_d=
5005 },
> +	{ .name =3D "m10-n5010", .driver_data =3D (kernel_ulong_t)&m10bmc_spi_n=
5010 },

[Severity: High]
This is a pre-existing issue, but does passing complex pointers through the
match table's driver_data field here violate the MFD subsystem safety rules?

According to the MFD guidelines, embedding platform data structures (like
the intel_m10bmc_platform_info pointers) directly in the match table can
cause memory safety hazards and initialization races.

Would it be better to store an enum or integer ID in the driver_data field
instead, and use a switch statement in the probe function to select the
correct static const cell array?

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(spi, m10bmc_spi_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D17
