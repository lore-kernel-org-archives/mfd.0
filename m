Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020129;
	b=qjaU/CWa/jj8GNAOwAswiSjTBDgb9L/LPtSlGyjGQGcxDS4QPhJOWwPgsdVXRuecA0nY
	 hwfnYge8XGMm3/Xjfgd5maWP0Y15PsxRFjoGTOOilMk3pZM211lxrKt/imfmkODoQOXiH
	 Qp/WCtkIrJ3uDSzzW8RpEFz9ivx7kmsSOA8YeAyLxA8hS6MNgeBVAmjuo30uTIJiIp8yg
	 YA2b5kEgW454cOdU+607EmLzD11zwaZVtS5mQTBnFV6XKUxsruZOtzrs3KY3rdid4XjuD
	 fAYOWJNDsGFCPRPX5s6dz7i6u5VAQ+gkW5NlUxVGQHs5NHDlmW+l8LTuPRw6qvzTRNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020129;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=12KxCmH9xfGZDzSLuyd0Xn1SyOqdbGFznpU+IJxvzak=;
	b=RY/B67C1ACYPCxoBPO0zeEkPGN0PSHkrxO9whvHEOOLaIELfCFgoLqznq+4Zc9JnJkT4
	 U2RxuonrEwpfyRJhA2Ha/57+VMGiTd0TAxBhcSPcFsw9SZbAdPZ2bLFseMX7q5AAXT3jU
	 hYskMTS3D2IWl4g6/Bc1uVF/cax7f9oCiJa0Pm2WhQmA5ZgU0Lx9IDxfnVcScWZJyeCCT
	 AcT0XDVBycQU4IYmGhU2iCoGixtkd+g9fmWjbkJXPIA89Yr/0jlip/8s0mYmTL7GyXbLj
	 1yp1rXaqLwp5WMrfNEne/cjB9MvRvlYVcKkDjPNRLzCPhxi7edsPaGGQ3pABHX+Uxzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YTY2jdpp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98786606A325
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 16:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YTY2jdpp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19ECC1F000C8;
	Wed, 18 Nov 2026 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795020129;
	bh=12KxCmH9xfGZDzSLuyd0Xn1SyOqdbGFznpU+IJxvzak=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YTY2jdppedFF6qrk/MwZW8hjjqIFhpvIN2xE0Lyb1hOX3Y/BvZnhbqDxGOJ0o8G8c
	 0A9OjfPeW4VlcXijYbgvVS6X6qCI+ji14LaZGn2nAwvsU+Ffg3shXDnJyh1lBbnu8O
	 f/OgASvinttFXknxTOX5ui2nFxoyu5BZMfZ1xQmSaGeZU477D/CRKqs1i8n5IX4zQd
	 CloPeHpwQLpYQHOS6FZpuNTr2ZNi2R/A8Ls2mYKCcdq/ICgpRlbY1ZJjEeAgJVEShk
	 96XkqKqx6K0HzLvE5EdJjztmk8OYvcjqdOPyi1eIk/ECqZJvmtNgWDA174+qhezNK6
	 D+TYnvPZ9Wn7A==
Message-ID: <sashiko-outbox-221531@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: net: Document support for AN8855
 Switch Internal PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261117164132.47167-3-ansuelsmth@gmail.com>
References: <20261117164132.47167-1-ansuelsmth@gmail.com>
 <20261117164132.47167-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 16:42:08 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Document support for AN8855 Switch Internal PHY.
>=20
> Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
> PHYs on the MDIO bus.
>=20
> Each PHY might need to be calibrated to correctly work with the
> use of the eFUSE provided by the Switch SoC. This can be enabled by
> defining in the PHY node the NVMEM cell properties.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117164132.4716=
7-1-ansuelsmth@gmail.com?part=3D2

