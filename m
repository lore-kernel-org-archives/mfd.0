Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792518241;
	b=hoYe2q3bzUnFVWCoZJ3jeDcRvnJN6CTN9tDOD9EklqKH24hidTYofJIJJDdhC6l8lkDt
	 Wnw0yiLfEy8U8r1t/dQgkj6ybQn2Yt8G1PF4b28xxvn9Ne5YQbRJN6bdbbWv2vzHw4kbQ
	 n4IbGEqHeWd7jvXRg5D/oneSDJA0LaXDum/c9HOnFQnLdFGgW+7Yc5Xd+n4LXfw1hnVMP
	 YWeN/cslIIEODWegqUhEowjTNLM/kq6IeQBy1wPTZy6KtVcuSyZrzlua4JpAj4mE+Iqsn
	 ZUWrSnP2PD/+wDSnfPfm/VZcldejz5PItXmvO2QJy/gxa8MmAjl1b1FqXuQ3dKuAOWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792518241;
	h=Received:Message-ID:From:Subject:Reply-To:To:Cc:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0qfI1ulEEfinW4SJBztjKQCz9P1onwkIIRF7zOVMM1o=;
	b=OIGEaycj7CFoFyIypNO8lDsW+XXsEriqGdHhfFHQyJpkfWizUoWYMkMyCtJZb6UQQ0Ws
	 CFEtGida8JideZUwRU9DblmkgQCR4piAvNT5eBUo4IOKI1T/HoMwtA97rcbxcFKOIMUZR
	 tvjIPwPtyb2ld+XIMqOsrX2Ylwy8wij/Xde/0g+SyKzuxHxpKsIyyZGDAWhKlK3MiT2Lx
	 Ux3hT2fxqVHT/jk854nSPzTnpkCl0ugmj6f3RHAXY8FrcGuyPsUCZEtVkKRVmyUlAdPg5
	 9FxSapxvutww1SDLy5LioLTPv2xMWfwvFiH3aY+8WB9YkSOPAMJhFPCEU287liXK/Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3F0606A31D
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 17:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F0C1F000C9;
	Tue, 20 Oct 2026 17:44:01 +0000 (UTC)
Message-ID: <sashiko-outbox-179439@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v10 5/9] mfd: mt6397: Add support for MT6392 PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261020173556.632798-6-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
 <20261020173556.632798-6-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 17:43:58 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Fabien Parent <parent.f@gmail.com>
>=20
> Align the MT6397 PMIC driver to other MFD drivers by passing only an
> identifier through mt6397_of_match[*].data and add support for the MT6392
> PMIC and its regulator, RTC, keys and pinctrl devices.
>=20
> The keys device manages two buttons named PWRKEY and FCHR_ENB, the latter
> is identified as "Force charging disable" in the data sheet but it also
> says "Merge with HOMEKEY", so call it "Home" for consistency.
>=20
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020173556.6327=
98-1-l.scorcia@gmail.com?part=3D5

