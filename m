Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580266;
	b=zultaZF9gRd8vomY6sQHXb2jEMsvrDzhrPWy40rMd5UmlW1XZvbFRjfU4UyeRJwZs2Jr
	 8/68J+YSoNR56u12Tkekt4GZJBwddky+bWtn7pKhufkp89X0qFstExh6y1LJaPK3OzVP5
	 yIdrombgV16M9sRogZvQlk7QVcNz8CyQxTEMmhd0SHsrfUF+LchWWmMoE4hjVgX61ZE7N
	 3nmgtrMbnnU+qi/VtA4MX0YaRU5GW+xafoc2i7puRLtStm64bEZw3Smw2iCXVQUnbfADJ
	 l7xKRF54N1DVjuYt3X4PRi982N9W6wWAvl26S0JU0TAIChZitBjAO1POks8zJgxT2JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580266;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=37mUJu8Ga1bPuryN7/n0nzLtDwoUk8jGgC1nS/D5VTk=;
	b=adR4RkcsVMDM/Z34ZIgsKUYoTV5+iSaguhMDZ7gu1I9jaowDAJq0eX0+r/id6BoH3tdS
	 T6Dp8Aul1p7MT0NtXJjZRtOTNaDVZehj5WVr+Bboivc2gyoJc/fN3jNLX0LAR1wXxdoFK
	 3MN36R3qvNIb5Md8IPbWspDf5WiEK9hKKL5TflRS/dATclWVCQbiVzFDqjfmSmc3NL1SK
	 vQYmrMIzExWqDthJUXrq1D4LzJCN/eOiTxXMk5OK+TQMSIVFjtV4T4uZKNHwb7r8klFQj
	 IHchWN7utWmp9GoKZMfkrptpJYcIHSNo5WquNFWsVUceXnV/g2bE2VknSCbBcsKegwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9acCUJu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4063606A321
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 10:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9acCUJu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195271F000C9;
	Wed, 21 Oct 2026 10:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792580265;
	bh=37mUJu8Ga1bPuryN7/n0nzLtDwoUk8jGgC1nS/D5VTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g9acCUJu6vF6Zk56aQ+USNFTudcMNJBIL6mvk7Be5KL4xNgyECzNafggRaHGR42uT
	 BrRQzLYokDbcKfNiVzH1Lw/4gqnyvjL2Hc50i9mB0kaZnMLBPTO5hZtozJ/FTgOn3t
	 MKah0L9IWRpSwuHfOZtZ57DGiueEpCipSLhpKC4tBwRbvWNAfNB4L6vCF/nUZPtokh
	 Cxf5nlLUR+OFFpdTTI/JTSnLl7FfuX/HI9k1/jlIUQdK1zM+FRY4FZPjTDfjJftRxz
	 mt9xYAxfs2UJ0LEFZCKT+YzZPDNG+HE/pIOHiLItbWiq5PzfldCiv3QVSpmI0a6oC+
	 ZssX1k4hoKmUg==
Message-ID: <sashiko-outbox-180133@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 4/9] mfd: mt6397: Use MFD_CELL_* to describe
 sub-devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261021105109.199886-5-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
 <20261021105109.199886-5-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 10:57:44 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Use the MFD_CELL_* macros to describe sub-devices. No functional changes.
>=20
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021105109.1998=
86-1-l.scorcia@gmail.com?part=3D4

