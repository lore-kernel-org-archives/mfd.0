Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910001;
	b=R/VoNxkQik9i2r7vKMNRF3xPdHmMRN6b3P7Zbx97NyhXsPr+FYTjVwUomC8mD5f3BXU+
	 TfFvHit0dAaDw8psbuzI7PMweNRKYhCPC2FpNbRfxfch3gzM0/hGxdy2cmEo1pc0sIoO7
	 JT2r9UzrARGhi3Lr5F//y+9TXsmLxP94KuB3k+292ktCAfxOxnA4FW0tS54hpL1Lj/61P
	 qxAKISLn1FpF8HfR87M1AA+zFI8fZ2WRu28t6L6r7cA07AxbMBwLTqksdOHoIaM3pheq8
	 02RJfmZrLgE9XA/yxDIseDnEFdtr/TxtdXpE9vBUZmj2LazOwY6ChpydIdGF1GwGn/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910001;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1riLHhLgz+HQjJCZz8STCeLoCVIgwAo3tbfGH+5TvTU=;
	b=HmMdsdwaFft3uE5k7qHGgmBdU4wIzsGD7iaB+bIvb3JpIzTH5TtadHrYflFPZaJzBXEm
	 rDHuWn49js05rFzbKxLe4GNPqA039Zh1uHNz7tCckQ50cXMc/VnbQCRdkUac3KHVX1BXo
	 cnrThztZXmx+NdrhhoC7thpXDzb738LddVM8lit8Hya5CxVY57seZ0jlbyY950hMQunPc
	 +D/jDFnGWyGPT2TVM/BBYTwtckACOdSL7ro8kCV1aJoyEHDP8v1gsrlxG6zJDT9zAJOrM
	 I5apRlCOptRTdyVHGdfvqzpHluQzFDr1xl3HW3nWcqkDMX5MexHJ2LGWH++xj5YiRAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oVKZDP3s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0089606A323
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 10:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oVKZDP3s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA8B1F000C4;
	Tue, 17 Nov 2026 10:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910001;
	bh=1riLHhLgz+HQjJCZz8STCeLoCVIgwAo3tbfGH+5TvTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oVKZDP3sqqtdFOWqkGoToMFU7xQB9rmJ/b2MmGGN1HZrrRixLdXFPMPgHbevQPo6/
	 fmLy+gx0sxXwdySMmJQgY6Aqi1zLDaYLKkhfNby/IunLlVIpP3bnPDivRGu6BNx3KK
	 +92WR1/RuygVSeKTpMoQkKiyFvHVp5XFat9MXz8jwbhoEhWhlAWCm0h8YhFF44Wqnb
	 z8Wg/F7PU+btTW8+RC5ouYzi3wsqYBHvxn4U+ZImczH93k1Ev0HgT+AGNcD+SSgw60
	 3xEr0eRVIN5I6iPQdsxd2N4i1wLgmoNKDIZCOpRjEFfrod79K5funqSuFNjDgCUjQW
	 13nQNWy+sQGBQ==
Message-ID: <sashiko-outbox-218570@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/10] i2c: cgbc: Use plateform data to get bus ID
 and adapter name
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-5-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
 <20261117-cgbc-i2c-storage-devices-support-v6-5-bb070ad3e9aa@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 10:06:39 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Obtain the bus ID (from the BC point of view) and adapter name from
> platform data. This allows the specific definitions to be removed, leaving
> only a generic adapter definition.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-cgbc-i2c-s=
torage-devices-support-v6-0-bb070ad3e9aa@bootlin.com?part=3D5

