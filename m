Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505616;
	b=TJxW4MDDLmxXJdkHexcBrEkoBIjouOKIiNA3J3LpRP/Rfppe6uo5obFG3J7k2FnZsfKU
	 BrMD7sXoiLLgb7F+LWtxE/hzmC2UYfzWU8rbx6q9HoxjxBnarh0MtkCXXOgdA4I2JsVVl
	 L7Rk8Sbp60MOEPLmclBumJzZ4DnAJSNPgY3Lbo0kwBYuUHDuyqqHT6KiuDoCVJzoOisnf
	 NwLHH1MY5xVHrL4bCCArkXi5FXjt88Z0dgPzkoFhLCviLwgDqsLJOCasDKxd/+8Msbdgb
	 E0o5JHhFidvisqhJywW9Q6YhfoY6wYq2AW06qOCd9UmUq25j6REjsx1CboqnEBniJag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505616;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9kHIMuS6SZliWlkDN3TmHr/h3Q3DEIcpNaZqkggMA8I=;
	b=lLSW38L9YLyhqlP5YwJJLQNLiduJE3U31Cu7p/SNYPYmiR3bieO2pL6B0vZ8Gjm2p8dt
	 4k4djbJjoxy8WhNKivP9QzWm9FAvLCJ1jL02OFTFNVXgjh6v8ILYzyC8i9t4w1iD7Cbj/
	 6z9V8fcb21ykgl0N2GZ79RUtGhc7vRWRsc9zgJKrEbxoOkG47K32h8mRQjVEQY1PgBwpe
	 oDHAuoZT01+u0ZhxBEUq2DDrzEiMw94keKHwdR4A+/A2OD+VO92gVuZpxmWioHbV1lyim
	 /MGYF93IefPXZc+DiQrh8Ia4hw7dRtH+R5kTtnEe9jCuooCq59y7gW9mk9oNYsheIiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DiQRdTFZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F1E606C231
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DiQRdTFZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966771F000C6;
	Tue, 20 Oct 2026 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792505615;
	bh=9kHIMuS6SZliWlkDN3TmHr/h3Q3DEIcpNaZqkggMA8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DiQRdTFZf7+hF1fdzpKLkcpcv66X1Emfo/R6bd6WTMT044vvkFzykED3GZSYISr9X
	 oiFK8YS09BEObRE2nVZNAa4HKOzgOfE6mpIVd7AMjHw7d8whB0Dt1Wo4DG0nQF+sw7
	 RARM1cg+PjoptmJMmkVdNfzQJ+G1MaYm5qf0/Hg2HfiHcUJzqDfOo6Oiv6biKRMCJe
	 mtuqhiHGdvXWyYlHQccCiFwDyJM8PP7jk06cGa3IDiN9kMoQHcq5p5sSltUdOzNzW9
	 QuukF3Z/+J1mA8/25FNWreSyMrI4HR3gxbBYuSuLxnEgQTnF+ijN6z8jHdxjioCsOX
	 AEsJtJkw2k8rg==
Message-ID: <sashiko-outbox-179098@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] mfd: rk8xx: Release the power hold GPIOs before
 powering off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261020140127.720-3-yaozhonguwl@gmail.com>
References: <20261020140127.720-1-yaozhonguwl@gmail.com>
 <20261020140127.720-3-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 14:13:35 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> rk808_power_off() writes the PMIC's shutdown bit directly. On boards where
> lines driven by the SoC gate the PMIC's power-off path, a shutdown
> performed this way does not stick: the rails drop and immediately come
> back up, so the board restarts instead of staying off. U-Boot reports the
> result as a power-on reset.
>=20
> Take those lines as an optional GPIO array, hold them asserted while the
> system runs and release them - waiting power-hold-delay-ms - before
> writing the shutdown bit. Device trees without the property retain the
> existing behaviour.
>=20
> The array is claimed before any child device is registered, so that a
> -EPROBE_DEFER from the GPIO provider does not tear down the regulators,
> RTC and clocks that devm_mfd_add_devices() has already registered.
>=20
> On a Firefly-RK3399 the shutdown stuck when such a line went from high to
> low before the shutdown bit was written, and did not when the line was
> never driven.
>=20
> Assisted-by: LLM
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020140127.720-=
1-yaozhonguwl@gmail.com?part=3D2

