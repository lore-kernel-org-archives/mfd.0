Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793548483;
	b=g67I2ymyDQ3F3VE2h878//wCBn0Umst4QIG8RoTNKe/MdyeElY8sz8uITUQEWe10Jy1Y
	 Mw1wMRB4HrShOrUjJmAHDHHlTS38vNO1m5FX9JB/AglAx7R9E7y7fwSe/UfcH8LioirO1
	 Lr2bm1BvsPxguNE5TzCJ87YUYc72pD77dklPtqdb1ei1F+trwv3SCow/ZcPJsI5/QZA1N
	 JUxHckpxTYyGnT+E2u1goiQ2lIws+SZANg5XdYiU9ZZsp+pc8XjeiXxSXjtsgq+LZUgn5
	 tuke4h3FT7RkxTF7IEMGUsbvihqaP74NV2oEbZ1HZsc+B1n5nLE//GagyfuAMpHQXJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548483;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2mjfUwo1ZIHTUVEvmb3wrwyhPBTfgud6IdFI9Ply//A=;
	b=PIptlRd0kegwh6fX905NiBoBJ5IHEF+F1q7c/4uv0fNHShMTwcvA6XSJizvRN4JNSTyZ
	 OGBgeHsTossj5mxwyBDCuDvNFtpn+7MlTRQVSBBbmIqJHN3oHYyHKZivBglH0U6XkRHot
	 BsOKPvLgtYAcVqxflPMnUEARjhVeo+Xp+gJCxFTm/zS/eoIecBRQB3KH+AyR6g33hRb8i
	 yHuyhx72leccZC+h2tWbL0QDgI0LUx20fJsKlPDFMv7Ekeusxn9+5RbGHq9zVqL2LcZYP
	 q7sCTBPvLlALFy4uMC8KIAVCwFtlZlTD0fKT8tU9e1Ut1/qCjXgFdg5NfyJDV0Nideg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GGHILcLp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879D1606A325
	for <mfd@lists.linux.dev>; Sun,  1 Nov 2026 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GGHILcLp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8E41F000C1;
	Sun,  1 Nov 2026 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793548483;
	bh=2mjfUwo1ZIHTUVEvmb3wrwyhPBTfgud6IdFI9Ply//A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GGHILcLppPKWictCzQ7wyipKBtzMYGzrZj7M7Yttbk0yRchYVz1deTRKWKE2qKrRs
	 DMaFTtWBuYC6bJu1IPWNb1qbYEJOIk1GSk+kEgPxby2rrxEsM4VTtfVWkEehgnNb3W
	 DNV8jRRFeEPSFHQRRDNTOgWBOKCMOR0Kz/LbLspIH5NPnW3b9Ld+cvxUKYX6gq9NgY
	 akdsx5rvmvU41oaeMNYdx8qZV0WuJzfPFeZ0hsgx4KnjA2b+4JCHICA+y7/+1+S8q7
	 ajiuXEA0ZI3HNR7YZBZSg7kzSCXlYn+TAWHywegAYj8YIgS21zkccgSsE7rF27/oEq
	 N96g8mfhIOsuQ==
Message-ID: <sashiko-outbox-192489@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: rk8xx-core: Don't stop RTC during RK809/RK817
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arash Golgol" <arash.golgol@gmail.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261101154950.8673-1-arash.golgol@gmail.com>
References: <20261101154950.8673-1-arash.golgol@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 15:54:42 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> RK809 and RK817 have an internal RTC that is managed by the rtc-rk808
> driver. During probe, rk8xx-core stops the RTC by setting RTC_STOP in
> RK817_RTC_CTRL_REG (via rk817_pre_init_reg), and rtc-rk808 later starts
> it again in its own probe function.
>=20
> This unnecessary stop/start cycle makes the RTC lose about 1.9 seconds
> on every boot or reboot, as measured on an ASUS Tinker Edge R. It also
> leaves the RTC stopped until the next boot if power is lost between
> rk8xx_probe() and rk808_rtc_probe().
>=20
> Fix this by dropping the RTC_STOP entry from rk817_pre_init_reg.
>=20
> Tested on ASUS Tinker Edge R (RK3399Pro), which uses an RK809 PMIC.
>=20
> Fixes: 586c1b4125b3 ("mfd: rk808: Add RK817 and RK809 support")
> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101154950.8673=
-1-arash.golgol@gmail.com?part=3D1

