Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580890;
	b=LR0R8MGQoE1k0X8vl1On9BLvzQZOB221i/1uYFwEFHQwb04SoNwZJp1WFSQnPZ//l6qH
	 F6SbTkTZ1GJ+vKXDzYq/Xr8g7foLYHSdSVMuUfmzZMcXwawJ1CoA5jCpHqVd5wapxWx9r
	 zS58SzS+/pxRtEs+zMg5mmaBOYbWaBBvG12q4+MNmTelqgyxJO7mSxHsPoWTUkrsrVMQi
	 t51zKdzjadw4XHlEeR9A/YhHsG6kC8qirNyKnQ1zfNBETOWVga0c5jN+L4je+qSPwHPHw
	 uCziSKMF9bwiVqm/2Jwk7L1HsoiwfT3n8k2IXtwgjp21ae2ltsVBWNp7MUKhUVMhAKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580890;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Gy2FWlDcOaSXb94lcevdEfduS1q2a3AAjxg1htcNICs=;
	b=N/in4QDnDODKEIccFVWkg+Zhs+jwSVKvdUx8qlowvMfAK/EaHReBHylaBh2IY9WljOQ0
	 yJ4zAdCZQtITIihESnKeLMiY5rAFhU35KOHOLZn9SmWHt+bi6qIDaRgwxQziy9PcVLbyE
	 58Z61E0ETq6hKu47aQfma6AUw1CE5p8I0puAoUf4eWS3+VhYYnjM2snjcp7m6vpqGT8ci
	 beuw88OUUFsF3ZHlfGtdMKguXPtIBc7ZwhyZ4PYLPXteEwnAg9T1sBCJncHXJHgYM5d1K
	 t5cY0EhrkgeU9mWhsjof09Gxh/31iiX580ozHJjCRgxjTYoKjtXgDuUh4qcplRms8TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DsoaY+vj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79FD606A31B
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DsoaY+vj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C39C1F000C9;
	Wed, 21 Oct 2026 11:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792580889;
	bh=Gy2FWlDcOaSXb94lcevdEfduS1q2a3AAjxg1htcNICs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DsoaY+vjD+8vRg++RwK6EwjumqsW4YxAa9unZq3+19K1nZz3TD9ELt+IZhOI60QSG
	 oHuv67pahA7T4Of6Wq1NOIoHSRYJV0Vm8XHprKeO6jAQdNoTKYnM+MYWWDsdMoLd8k
	 GtgcJtxDrOIOjjTnl1GVLtOw+qEJtWhMPFEQsWAGY0XS7YaViWLsFn0Zyj+qk4QPmj
	 FPDGGSEmsL0ZPnlwrAwDu4sGa51UtGoeAe3c5a5CW2Zz3ejDnUDo37LFt4UFj5YBED
	 Gwhlwhj4i7x5eHvmTTi4JBNK4P1ciTX++OaB8sC9hoJzZdJGk3ROBpG5uSka028fVy
	 OGdXN6KuU3dNQ==
Message-ID: <sashiko-outbox-180143@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 5/9] mfd: mt6397: Add support for MT6392 PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261021105109.199886-6-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
 <20261021105109.199886-6-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 11:08:08 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021105109.1998=
86-1-l.scorcia@gmail.com?part=3D5

