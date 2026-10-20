Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792518103;
	b=cE4GCQwsTh0SwI454ulpoCVnWWQuJmqVFt49DG0BVv0fmaEFq99U6rz2gsPFkiYFLTZb
	 0ufxkIqOi0rcp1f5MTjgLYSZMaHIDl/w6cLzLIbPoxSGLKs/32flxvvKFs3JgZG+v3LGf
	 Hu8n2BgDSR/s6FUuKFPUoM+njaGexaey9BrG42f8ZUvSCFO18r79zqDiA34B8ypJ22KjV
	 JofT6mqqCiAqbGRPwVr0dVlQvDk/sCfZpZ4G5RwhYa8hgNDXRYtAsIdCKxfESqIFJqoJQ
	 zXOhzBddXDCho5ZVYkgw6BqpCGN93dWSm4h3Ara7qF0Wfwa52SyEWxIurlwiqysbE3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792518103;
	h=Received:Message-ID:From:Subject:Reply-To:To:Cc:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:Date;
	bh=H7LQub4ZvkjOb49aR4rq4txY0Sd8iQtmTIc73pmJS+A=;
	b=ilaJHTLIUUifz95yIe0ypASjzkFsMh17intHuHpseunyeNdK8CuQGHe7Dm62Zvyn/mUl
	 eiFr8KTp57+gUAzi9mVcIYhLdEXFFG2AL+77qch/ZL5g+/bOAT207DOS64lr5LeRQ55Ga
	 Mc3RR0vE07TA9lmKPT04oRp9A0Imi6LFkKqUDpUHTKIHWpom2VVArBUaGsruAoG34jZyo
	 fORzciX1cBQ6E0lj5qAWxskzOwrKrADaLOwi3+xVriLtBC3Pf1qS2rfiOyJsukEWGhlX9
	 MIQAx4JJy2U5DxRBZKtKQruc+hCq+dJv2n5AlKjARKbY6hwv6HymGgZ3PDZrz4jYQEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53F5606A32A
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 17:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1ACA1F000CC;
	Tue, 20 Oct 2026 17:41:41 +0000 (UTC)
Message-ID: <sashiko-outbox-179432@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v10 3/9] regulator: dt-bindings: Add MediaTek
 MT6392 PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261020173556.632798-4-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
 <20261020173556.632798-4-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 17:41:11 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add bindings for the regulators found in the MediaTek MT6392 PMIC,
> usually found in board designs using the MediaTek MT8516/MT8167 SoCs.
>=20
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020173556.6327=
98-1-l.scorcia@gmail.com?part=3D3

