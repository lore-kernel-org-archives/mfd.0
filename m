Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990674;
	b=J8Ahcm+zku9eHmZTdBiptkSMhbzFYRQYtrgVp/PGZVQRK+tpqJ4GKJvG0uFLWpXP72O3
	 iwFFGVSEi2CvXOqhmK/ttf6kkiF6WxcjRZNdwTmSScK6msk5ZRAoUXZrp6mr9gGwycqYz
	 GTv7aU2Hty3ebRmUM+oWG00LOe8E3LFxqDD/tzZcKGzDbriuz1cx4CACga+4mXgGkmOe+
	 KXAlKsqj6Oe6xWNqkKb7JvqaBZOg6Ctuh7YcweZB/n1RDIsHxLnQ1R85miNEEYIweKncI
	 fdy70KqI3hESEVS3khR0rtQx6/OZRhj8aRsB7OgKkfwtYwNcNlR7ZpCiDz0sN03Ntxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990674;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/AVzdGpA6Y2QNDTuJxo2KcPjoN8S0i12lY9Knr4v7RE=;
	b=BRbIcRgq3fb/x+rAIv2C/cI+98t/z7VUzCBGXVIQrzoYw63q4hcN9JFh3Pc0cZLLwz+N
	 DNUxTeAfFbj9NI5NiNGVYoEi2ycHOPrFVQ/LIOsHDx8UYO1+818PdtK5+weBpglrUi6N4
	 16k/aczwvngSkPF0phyiuUdYANP1UKuIwJ6INfy2QY7YQjju1BaFbmKuM1QoTAz1xYK2c
	 D4pN/ovtyZ/ac//UcUMSD+kx5uxPDTp5ykZwtHCx2yP8QMSD0InvbOtj6U4SzpMVTG+1S
	 xfKPWacBzf3J+ANJfPQksn9unB/ZxfjzZhBDf/C09Svuup1SPEyTWrBXHZ2hxaYCP2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LN+kJgOa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DC0606A31C
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LN+kJgOa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A33A1F000C4;
	Wed, 18 Nov 2026 08:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990673;
	bh=/AVzdGpA6Y2QNDTuJxo2KcPjoN8S0i12lY9Knr4v7RE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LN+kJgOahWNRFDb/NrKXKkSBITsGGMlCuaE5ZlZRZUDowXR6nLAGHbdkepyiVGye0
	 IaniGae2cejw9cavd+nqDNjpAmiqatHvim54lxr228aSUx9F1T1PnIFJXL2/x4aSGO
	 xEi3GIAG2Pba3IaHeQdxqIpFtK6UV+m2BeH0NqMDe2xCqDGpJlpodP7vGt+DELxwWJ
	 QEfBWv9exaYtfppXJ4caCbfBgayeysK+bWmupkhHF8BaGJT1Wj8N+4KLB2ITTMuiDd
	 aomO2rgg4/X28L1USp6evRUCT2HlqfU5HUsT2cBaM3HuiwP3/vnLqqANTPFlYTMv2H
	 ji2GpeoCDsk7w==
Message-ID: <sashiko-outbox-220455@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 08/13] mfd: nct6694: Rename USB transport functions
 with _usb_ prefix
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261118081625.2399247-9-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
 <20261118081625.2399247-9-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:31:13 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Ming Yu <a0282524688@gmail.com>
>=20
> Add a _usb_ prefix to the USB transport functions, tables and driver
> name to mark them as USB specific, in preparation for the core and HIF
> transport added in later patches.
>=20
> Keep nct6694_{read,write}_msg() as static inline wrappers in the shared
> header so that the sub-device drivers remain untouched; they are
> reimplemented on top of regmap later in the series.
>=20
> No functional change.
>=20
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118081625.2399=
247-1-a0282524688@gmail.com?part=3D8

